library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity two_digit_bcd_7segment is

    port (
        BCDinFirstDigit  : in std_logic_vector (3 downto 0);
        BCDinSecondDigit : in std_logic_vector (3 downto 0);

        firstDigit       : out std_logic_vector (6 downto 0);
        secondDigit      : out std_logic_vector (6 downto 0)
    );

end two_digit_bcd_7segment;

architecture Behavioral of two_digit_bcd_7segment is

begin

    process (BCDinFirstDigit, BCDinSecondDigit)

    begin

        if to_integer(unsigned(BCDinFirstDigit)) < 10 and to_integer(unsigned(BCDinSecondDigit)) < 10 then

            case to_integer(unsigned(BCDinFirstDigit)) is

                when 0 =>
                    firstDigit <= "0000001"; --0
                when 1 =>
                    firstDigit <= "1001111"; --1
                when 2 =>
                    firstDigit <= "0010010"; --2
                when 3 =>
                    firstDigit <= "0000110"; --3
                when 4 =>
                    firstDigit <= "1001100"; --4
                when 5 =>
                    firstDigit <= "0100100"; --5
                when 6 =>
                    firstDigit <= "0100000"; --6
                when 7 =>
                    firstDigit <= "0001111"; --7
                when 8 =>
                    firstDigit <= "0000000"; --8
                when 9 =>
                    firstDigit <= "0000100"; --9
                when others =>
                    firstDigit <= "1111111"; --null

            end case;

            case to_integer(unsigned(BCDinSecondDigit)) is

                when 0 =>
                    secondDigit <= "0000001"; --0
                when 1 =>
                    secondDigit <= "1001111"; --1
                when 2 =>
                    secondDigit <= "0010010"; --2
                when 3 =>
                    secondDigit <= "0000110"; --3
                when 4 =>
                    secondDigit <= "1001100"; --4
                when 5 =>
                    secondDigit <= "0100100"; --5
                when 6 =>
                    secondDigit <= "0100000"; --6
                when 7 =>
                    secondDigit <= "0001111"; --7
                when 8 =>
                    secondDigit <= "0000000"; --8
                when 9 =>
                    secondDigit <= "0000100"; --9
                when others =>
                    secondDigit <= "1111111"; --null

            end case;

        else
            firstDigit  <= "1111111"; --null
            secondDigit <= "1111111"; --null

        end if;

    end process;

end Behavioral;