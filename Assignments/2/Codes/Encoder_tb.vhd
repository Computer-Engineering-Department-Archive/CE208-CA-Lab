library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------
-- Test-bench for priority 4 to 2 encoder
------------------------------------------------------


entity Encoder_tb is 
end entity Encoder_tb;

architecture test of Encoder_tb is 

component Encoder
 	port(
 		input : in STD_LOGIC_VECTOR(3 downto 0);
 		output : out STD_LOGIC_VECTOR(2 downto 0)
	 );
end component;

signal input_sig : STD_LOGIC_VECTOR(3 downto 0);
signal output_sig: STD_LOGIC_VECTOR(2 downto 0);

begin

enc:Encoder port map(input => input_sig, output => output_sig);

input_sig <= "0000",
 "0001" after 100 ns,
 "0010" after 200 ns,
 "0011" after 300 ns,
 "0100" after 400 ns,
 "0101" after 500 ns,
 "0110" after 600 ns,
 "0111" after 700 ns,
 "1000" after 800 ns,
 "1001" after 900 ns,
 "1010" after 1000 ns,
 "1011" after 1100 ns,
 "1100" after 1200 ns,
 "1101" after 1300 ns,
 "1110" after 1400 ns,
 "1111" after 1500 ns;

end test ;