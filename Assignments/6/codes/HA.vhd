library ieee;
use ieee.std_logic_1164.all;

entity HA is
Port(
	a, b: in std_logic;
	s, c : out std_logic
);
end entity HA;

architecture structure of HA is

begin
	s <= a xor b;
	c <= a and b;
end structure;