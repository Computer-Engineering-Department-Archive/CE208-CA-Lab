library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity gcd_tb is
end entity gcd_tb;

architecture TB of gcd_tb is

	component gcd_cal
	port(
		clk	:	in std_logic;
		A	:	in integer range 0 to 15;
		B	:	in integer range 0 to 15;
		O	:	out integer range 0 to 15
	);
	end component;

	signal T_clk: std_logic;
	signal A: integer range 0 to 15;
	signal B: integer range 0 to 15;
	signal O: integer range 0 to 15;

begin
	T_gcd: gcd_cal port map (T_clk, A, B, O);

	process
	begin
		T_clk <= '0';
		A <= 12;
		B <= 4;
		wait for 5 ns;

		T_clk <= '0';
		A <= 3;
		B <= 15;
		wait for 5 ns;
	end process;
end;