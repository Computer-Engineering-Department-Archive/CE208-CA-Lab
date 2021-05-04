library ieee;
use ieee.std_logic_1164.all;

entity FA is
	port (
		A, B, Cin : in std_logic;
		S, Cout   : out std_logic
	);
end entity FA;

architecture structure of FA is

	component HA is
		port (
			in1, in2   : in std_logic;
			out1, out2 : out std_logic
		);
	end component HA;

	signal internal_signal0, internal_signal1, internal_signal2 : std_logic;
begin

	half_adder_instance0 : HA port map(in1 => A, in2 => B, out1 => internal_signal0, out2 => internal_signal1);
	half_adder_instance1 : HA port map(in1 => internal_signal0, in2 => Cin, out1 => S, out2 => internal_signal2);
	Cout <= internal_signal1 or internal_signal2;

end structure;