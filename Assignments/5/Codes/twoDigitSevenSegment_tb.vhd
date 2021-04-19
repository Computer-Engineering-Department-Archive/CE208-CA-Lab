library ieee;
use ieee.std_logic_1164.all;
entity two_digit_tb_bcd_7seg is
end two_digit_tb_bcd_7seg;

architecture behavior of two_digit_tb_bcd_7seg is

    -- Component Declaration for the Unit Under Test (UUT)

    component two_digit_bcd_7segment
        port (
            BCDinFirstDigit  : in std_logic_vector (3 downto 0);
            BCDinSecondDigit : in std_logic_vector (3 downto 0);

            firstDigit       : out std_logic_vector (6 downto 0);
            secondDigit      : out std_logic_vector (6 downto 0)
        );
    end component;

    --Inputs
    signal BCDinFirstDigit  : std_logic_vector(3 downto 0) := (others => '0');
    signal BCDinSecondDigit : std_logic_vector(3 downto 0) := (others => '0');

    --Outputs
    signal firstDigit       : std_logic_vector(6 downto 0);
    signal secondDigit      : std_logic_vector(6 downto 0);
begin

    -- Instantiate the Unit Under Test (UUT)
    uut : two_digit_bcd_7segment port map(
        BCDinFirstDigit  => BCDinFirstDigit,
        BCDinSecondDigit => BCDinSecondDigit,

        firstDigit       => firstDigit,
        secondDigit      => secondDigit
    );

    -- Stimulus process
    stim_proc : process
    begin

        BCDinFirstDigit  <= "0000"; -- 0
        BCDinSecondDigit <= "0000"; -- 0
        wait for 100 ns;
        BCDinFirstDigit  <= "0001"; -- 1
        BCDinSecondDigit <= "0000"; -- 0
        wait for 100 ns;
        BCDinFirstDigit  <= "1001"; -- 9
        BCDinSecondDigit <= "0000"; -- 0
        wait for 100 ns;
        BCDinFirstDigit  <= "1100"; -- invalid
        BCDinSecondDigit <= "0000"; -- 0
        wait for 100 ns;
        BCDinFirstDigit  <= "1000"; -- 8
        BCDinSecondDigit <= "1000"; -- 8
        wait for 100 ns;
        BCDinFirstDigit  <= "0010"; -- 2
        BCDinSecondDigit <= "0101"; -- 5
        wait for 100 ns;
        BCDinFirstDigit  <= "1001"; -- 9
        BCDinSecondDigit <= "1001"; -- 9
        wait for 100 ns;
        BCDinFirstDigit  <= "0001"; -- 1
        BCDinSecondDigit <= "1100"; -- invalid
        wait for 100 ns;
    end process;

end;