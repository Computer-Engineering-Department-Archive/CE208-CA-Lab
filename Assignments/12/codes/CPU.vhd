library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity BC is
	generic(
		DataSize: integer := 8; -- data
		AdressSize: integer := 5 -- address
	);
	
	port(
		clk, rst : in std_logic;
		ACCC : out std_logic_vector(DataSize-1 downto 0);
		MDRR : out std_logic_vector(DataSize-1 downto 0);
		IRR : out std_logic_vector(DataSize-1 downto 0);
		PCC : out std_logic_vector(AdressSize-1 downto 0);  
		MARR : out std_logic_vector(AdressSize-1 downto 0);
		CFF : out std_logic;
		state_out : out std_logic_vector(3 downto 0);
		myoutdata : out std_logic_vector(7 downto 0)
	--	opcode : out std_logic_vector(2 downto 0);
		
	);

end BC;

architecture Behavioral of BC is
	
	component RAM is
		port(
			data_in : in std_logic_vector(7 downto 0);
			addr : in std_logic_vector(4 downto 0);
			wr, clk, rst : in std_logic;
			data_out : out std_logic_vector(7 downto 0));
	end component;

	signal ourState : std_logic_vector(3 downto 0);
	signal MAR : std_logic_vector(AdressSize-1 downto 0);

	signal WR: std_logic;	
	signal in_Data : std_logic_vector(DataSize-1 downto 0);
	signal out_Data : std_logic_vector(DataSize-1 downto 0);


	
	begin		
		--out_data <= "ZZZZZZZZ";
		
		ram_block : RAM port map(
		data_in => in_Data,
		addr => MAR ,
		wr => WR ,
		clk => clk,
		rst => rst ,
		data_out => out_Data
		);
		process(clk, rst)
		
			variable ACC : std_logic_vector(DataSize-1 downto 0);
			variable mdr : std_logic_vector(DataSize-1 downto 0);
			variable IR : std_logic_vector(DataSize-1 downto 0);
			variable CF : std_logic;	
			variable temp : std_logic_vector(8 downto 0);
			variable PC : unsigned(AdressSize-1 downto 0);

		begin
			if(rst = '0') then
			-- make every thing -0-
				PC := (others => '0');
				MAR <= (others => '0'); 
				mdr := (others => '0');
				ACC := (others => '0');
				IR := (others => '0'); 
				CF := '0'; -- means carry
				WR <= '0'; -- 				WR = 1 -> write , WR = 0 -> read
				ourState <= "0000";  		-- starting state
			elsif rising_edge(clk) then			
				case ourState is
					-- fetching : first level of newman algorithem
					when "0000" =>
						ourState <= "0001";
						MAR <= std_logic_vector(PC); -- put PC in to the address rigester

					when "0001" =>
						ourState <= "0010"; -- next state
						PC := PC + 1;
					   IR := out_Data;

					-- decoding : second level of newman algorithem
					when "0010" =>
						case IR(7 downto 5) is -- 7 to 5 => opcode 
						
						-- NEED ADDRESS :
						
							when "000" =>MAR <= IR(4 downto 0); -- LD
							
							when "001" =>MAR <= IR(4 downto 0); -- ST
							
							when "010" =>MAR <= IR(4 downto 0); -- JP
							
							when "011" =>MAR <= IR(4 downto 0); -- JPC
							
							when "100" =>MAR <= IR(4 downto 0); -- AND
							
							when "101" =>MAR <= IR(4 downto 0); -- ADD
							
					--  	DON'T NEED ADDRESS :
							
							when "110" =>MAR <= MAR;
							
							when "111" =>MAR <= MAR;
							
					-- 	NOT NECESSERY :
					
							when others => MAR <= IR(4 downto 0);
							
						end case;
						
						ourState <= "0011";
						
					when "0011" => --CU
						case IR(7 downto 5) is
							
when "000" =>ourState <= "1000"; --LD
WR <= '0';						
when "001" =>ourState <= "1001";-- ST
in_Data <= ACC;
WR <= '1';						
when "010" =>ourState <= "1010";	-- JP
WR <= '0';
when "011" =>ourState <= "1011";-- JPC
WR <= '0';
when "100" =>ourState <= "1100";-- AND
WR <= '0';
when "101" =>ourState <= "1101";-- ADD
WR <= '0';
when "110" =>ourState <= "1110";-- NOT
WR <= '0';
when "111" =>ourState <= "1111";	-- SHR
WR <= '0';
when others =>ourState <= "0000";
WR <= '0';
								
						end case; -- END OF CU 
						
--- START THE 4TH LEVEL OF NEWMAN
						
					-- LD
					when "1000" =>ourState <= "0000";
						ACC := out_Data;
						mdr := out_Data;
						
						
					-- ST
					when "1001" => ourState <= "0000";
						WR <= '0';

					-- JP
					when "1010" => ourState <= "0000";
						PC := unsigned(MAR);
						
						
					-- JPC
					when "1011" =>ourState <= "0000";
						if(CF = '1') then
							PC := unsigned(MAR);
						end if;
						
					
					-- AND
					when "1100" =>ourState <= "0000";
						mdr := out_Data;
						ACC := ACC and out_Data;
						
					
					-- ADD
					when "1101" =>ourState <= "0000";

						mdr := out_Data;
						temp(8 downto 0) := std_logic_vector(to_unsigned(to_integer(unsigned(ACC)) + to_integer(unsigned(out_Data)), 9)); -- out_data + acc 
						ACC := temp(7 downto 0); 	-- add	
						CF := temp(8);					--Carry bit

					
					-- NOT
					when "1110" =>	ourState <= "0000";

						ACC := not ACC;
					
					-- SHR
					when "1111" => ourState <= "0000"; -- right shift
						ACC(2 downto 0) := ACC(3 downto 1);
						ACC(3) := '0';
					
					when others => ourState <= "0000";
						
				end case;
						
			end if;
			
					
			PCC <= std_logic_vector(PC);  
			MARR <= MAR;
			ACCC <= ACC;
			MDRR <= mdr;
			IRR <= IR;
			CFF <= CF;
			state_out <= ourState;
			
			
			
			myoutdata  <= out_Data;
			
		end process;
		
end Behavioral;