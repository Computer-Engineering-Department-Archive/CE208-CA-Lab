library ieee;
use ieee.std_logic_1164.all;
entity full_adder_tb is
end entity full_adder_tb;
architecture test of full_adder_tb is
component full_adder is
port(
i0, i1, cin: in std_logic;
s, cout : out std_logic
);
end component;
signal i0_sig  : std_logic;
signal i1_sig  : std_logic;
signal cin_sig : std_logic;
signal s_sig   : std_logic;
signal cout_sig: std_logic;
begin
fa:full_adder port map ( i0 => i0_sig, i1 => i1_sig, cin => cin_sig, s => s_sig, cout => cout_sig);
i0_sig  <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 300 ns, '0' after 400 ns, '1' after 500 ns, '0' after 600 ns,'1' after 700 ns;
i1_sig  <= '0', '0' after 100 ns, '1' after 200 ns, '1' after 300 ns, '0' after 400 ns, '0' after 500 ns, '1' after 600 ns,'1' after 700 ns;
cin_sig <= '0', '0' after 100 ns, '0' after 200 ns, '0' after 300 ns, '1' after 400 ns, '1' after 500 ns, '1' after 600 ns,'1' after 700 ns;

end test;