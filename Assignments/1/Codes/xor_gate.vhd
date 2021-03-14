library IEEE;
use IEEE.std_logic_1164.all;
Entity xor_gate is
Port(
A, B: in std_logic;
C : out std_logic
);
End entity xor_gate;
Architecture gatelevel of xor_gate is
Begin
C <= A xor B;
End gatelevel;