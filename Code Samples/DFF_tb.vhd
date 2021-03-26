----------------------------------------------------------------
-- Test Bench for D flip-flop
----------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity dff_TB is		-- entity declaration
end dff_TB;

----------------------------------------------------------------

architecture TB of dff_TB is

    signal T_data_in: 	std_logic;
    signal T_clock:	std_logic;
    signal T_data_out:	std_logic;
	
    component dff
    port(	data_in:	in std_logic;
    		clock:		in std_logic;
		data_out:	out std_logic
    );
    end component;
		
begin

    U_DFF: dff port map (T_data_in, T_clock, T_data_out);

    -- concurrent process to offer clock signal	
    process
    begin
	T_clock <= '0';
	wait for 5 ns;
	T_clock <= '1';
	wait for 5 ns;
    end process;
	
    process

	variable err_cnt: integer := 0; 

    begin
		
	-- case 1
	T_data_in <= '1';
	wait for 12 ns;		 
	assert (T_data_out='1') report "Error1!" severity error;
	if (T_data_out/='1') then
	    err_cnt := err_cnt + 1;
	end if;

	-- case 2
	T_data_in <=  '0';	 
	wait for 28 ns;
	assert (T_data_out='0') report "Error2!" severity error;
	if (T_data_out/='0') then
	    err_cnt := err_cnt + 1;
	end if;

	-- case 3
	T_data_in <= '1';					  
	wait for 2 ns;
	assert (T_data_out='0') report "Error3!" severity error;
	if (T_data_out/='0') then
	    err_cnt := err_cnt + 1;
	end if;
		
	-- case 4
	T_data_in <= '0';
	wait for 10 ns;
	assert (T_data_out='0') report "Error4!" severity error;
	if (T_data_out/='0') then
	    err_cnt := err_cnt + 1;
	end if;

	-- case 5
	T_data_in <=  '1';		
	wait for 20 ns;		
	assert (T_data_out='1') report "Error5!" severity error;	 
	if (T_data_out/='0') then
	    err_cnt := err_cnt + 1;
	end if;

	-- summary of all the tests
	if (err_cnt=0) then 			
	    assert false 
	    report "Testbench of Adder completed successfully!" 
	    severity note; 
	else 
	    assert true 
	    report "Something wrong, try again" 
	    severity error; 
	end if; 

	wait;

    end process;

end TB;

-----------------------------------------------------------------
configuration CFG_TB of dff_TB is
	for TB
	end for;
end CFG_TB;
-----------------------------------------------------------------