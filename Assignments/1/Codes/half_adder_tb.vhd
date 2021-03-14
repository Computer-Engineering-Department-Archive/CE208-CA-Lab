library ieee;
use ieee.std_logic_1164.all;
entity half_adder_tb is
end entity half_adder_tb;
architecture test of half_adder_tb is
component half_adder is
port(
in1, in2: in std_logic;
out1, out2 : out std_logic
);
end component;
signal in1_sig : std_logic;
signal in2_sig : std_logic;
signal out1_sig: std_logic;
signal out2_sig: std_logic;
begin
ha:half_adder port map ( in1 => in1_sig, in2 => in2_sig, out1 => out1_sig, out2 => out2_sig);
in1_sig <= '0', '1' after 100 ns, '1' after 200 ns, '0' after 300 ns;
in2_sig <= '0', '0' after 100 ns, '1' after 200 ns, '1' after 300 ns;

end test;