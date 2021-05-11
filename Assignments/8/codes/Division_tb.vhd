library ieee;
use ieee.std_logic_1164.all;

entity division_tb is
end division_tb;

architecture behavior of division_tb is

    -- Component Declaration for the Unit Under Test (UUT)

    component division
        port (
            A        : in std_logic_vector(7 downto 0);
            B        : in std_logic_vector(3 downto 0);
            Q        : out std_logic_vector(3 downto 0);
            R        : out std_logic_vector(3 downto 0);
            OverFlow : out std_logic
        );
    end component;

    --Inputs
    signal A        : std_logic_vector(7 downto 0) := (others => '0');
    signal B        : std_logic_vector(3 downto 0) := (others => '0');

    --Outputs
    signal Q        : std_logic_vector(3 downto 0) := (others => '0');
    signal R        : std_logic_vector(3 downto 0) := (others => '0');
    signal OverFlow : std_logic;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut : division port map(
        A        => A,
        B        => B,
        Q        => Q,
        R        => R,
        OverFlow => OverFlow
    );

    process
    begin

        wait for 1000 ns;
        A <= "11100101";
        B <= "1111";

        wait for 1000 ns;
        A <= "00001000";
        B <= "0011";

        wait for 1000 ns;
        A <= "01101110";
        B <= "0000";

        wait for 1000 ns;
        A <= "01101110";
        B <= "1110";

        wait for 1000 ns;
        A <= "11111111";
        B <= "1111";

        wait for 1000 ns;
        A <= "01111000";
        B <= "1001";
    end process;

end;