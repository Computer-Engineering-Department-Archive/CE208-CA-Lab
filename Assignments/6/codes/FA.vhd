library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity FA is
    port (
        A    : in std_logic;
        B    : in std_logic;
        Cin  : in std_logic;
        Sum  : out std_logic;
        Cout : out std_logic);
end FA;

architecture StructOfFA of FA is
    component HA port (
        A, B : in std_logic;
        S, C : out std_logic
        );
    end component;

    component or port (
        a, b   : in std_logic;
        output : out std_logic
        );
    end component;
    signal sum1, cout1, cout2 : std_logic;
begin
    ha1 : HA port map(A, B, sum1, cout1);
    ha2 : HA port map(Cin, sum1, Sum, cout2);
    or1 : Or port map(cout1, cout2, Cout);

end StructOfFA;
