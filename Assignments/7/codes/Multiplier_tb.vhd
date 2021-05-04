library ieee;
use ieee.std_logic_1164.all;

entity Tb_multiplier4bit is
end Tb_multiplier4bit;

architecture behavior of Tb_multiplier4bit is

	-- Component Declaration for the Unit Under Test (UUT)

	component multiplier4bit
		port (
			A : in std_logic_vector (3 downto 0);
			B : in std_logic_vector (3 downto 0);
			S : out std_logic_vector (7 downto 0));
	end component;

	--Inputs
	signal A : std_logic_vector(3 downto 0)  := (others => '0');
	signal B : std_logic_vector(3 downto 0)  := (others => '0');
	--Outputs
	signal S : std_logic_vector (7 downto 0) := (others => '0');

begin

	-- Instantiate the Unit Under Test (UUT)
	uut : multiplier4bit port map(
		A => A,
		B => B,
		S => S
	);

	-- Stimulus process
	stim_proc : process
	begin
		-- hold reset state for 2 ns.
		--wait for 5 ns;
		A <= "0110";
		B <= "1100";

		wait for 10 ns;

		A <= "0010";
		B <= "0001";

		wait for 10 ns;
		A <= "0111";
		B <= "0101";

		wait for 10 ns;
		A <= "0100";
		B <= "1101";

		wait for 10 ns;
		A <= "1010";
		B <= "1110";

		wait for 10 ns;
		A <= "1011";
		B <= "1011";

		wait for 10 ns;
		wait;

	end process;

end;