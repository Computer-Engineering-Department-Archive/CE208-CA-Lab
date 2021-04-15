library ieee;
use ieee.std_logic_1164.all;
entity two_digit_tb_bcd_7seg is
end two_digit_tb_bcd_7seg;

architecture behavior of two_digit_tb_bcd_7seg is

    -- Component Declaration for the Unit Under Test (UUT)

    component two_digit_bcd_7segment
        port (
            BCDin       : in std_logic_vector (6 downto 0);
            firstDigit  : out std_logic_vector (6 downto 0);
            secondDigit : out std_logic_vector (6 downto 0)
        );
    end component;

    --Inputs
    signal BCDin       : std_logic_vector(6 downto 0) := (others => '0');

    --Outputs
    signal firstDigit  : std_logic_vector(6 downto 0);
    signal secondDigit : std_logic_vector(6 downto 0);
begin

    -- Instantiate the Unit Under Test (UUT)
    uut : two_digit_bcd_7segment port map(
        BCDin       => BCDin,
        firstDigit  => firstDigit,
        secondDigit => secondDigit
    );

    -- Stimulus process
    stim_proc : process
    begin

        BCDin <= "0000000"; -- 0
        wait for 100 ns;
        BCDin <= "0000011"; -- 3
        wait for 100 ns;
        BCDin <= "0000110"; -- 6
        wait for 100 ns;
        BCDin <= "0000111"; -- 7
        wait for 100 ns;
        BCDin <= "0001001"; -- 9
        wait for 100 ns;
        BCDin <= "0001010"; -- 10
        wait for 100 ns;
        BCDin <= "0100101"; -- 37
        wait for 100 ns;
        BCDin <= "0111111"; -- 63
        wait for 100 ns;
        BCDin <= "1100011"; -- 99
        wait for 100 ns;
        BCDin <= "1111111"; -- 127
        wait for 100 ns;
    end process;

end;