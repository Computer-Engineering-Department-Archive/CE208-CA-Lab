library ieee;
use ieee.std_logic_1164.all;

entity FA is
Port(
	i0, i1, cin: in std_logic;
	s, cout : out std_logic
);
end entity FA;

architecture structure of FA is

component HA is
Port(
	in1, in2: in std_logic;
	out1, out2 : out std_logic
);
end component HA;

signal internal_signal0, internal_signal1, internal_signal2: std_logic;
begin

	half_adder_instance0: HA port map ( in1 => i0, in2 => i1, out1 => internal_signal0, out2 => internal_signal1);
	half_adder_instance1: HA port map ( in1 => internal_signal0, in2 => cin, out1 => s, out2 => internal_signal2);
	cout <= internal_signal1 or internal_signal2;
	
end structure;