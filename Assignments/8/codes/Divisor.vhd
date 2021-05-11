library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity divisor is
    port (
        A        : in std_logic_vector(7 downto 0);
        B        : in std_logic_vector(3 downto 0);
        Q        : out std_logic_vector(3 downto 0);
        R        : out std_logic_vector(3 downto 0);
        OverFlow : out std_logic
    );
end divisor;

architecture Behavioral of divisor is

begin

    process (A, B)

        variable ERA : std_logic_vector(8 downto 0);

    begin

        ERA(8)          := '0';
        ERA(7 downto 0) := A;

        ERA(8 downto 4) := (ERA(8 downto 4) + not(B)) + 1; --E:R = R+B'+1

        if (ERA(8) = '1') then                             -- R>=B
            ERA(7 downto 4) := ERA(7 downto 4) + B;            --R = R + B

            Q        <= "XXXX";
            R        <= "XXXX";
            OverFlow <= '1';                        --overflow accured
        else                                    -- R<B
            ERA(7 downto 4) := ERA(7 downto 4) + B; --R = R + B

            for i in 0 to 3 loop

                ERA := to_stdlogicvector(to_bitvector(ERA) sll 1); --shifting to left

                if (ERA(8) = '0') then
                    ERA(8 downto 4) := (ERA(8 downto 4) + not(B)) + 1; --E:R = R+B'+1

                    if (ERA(8) = '0') then
                        ERA(0)          := '0';                 --A0 = 0
                        ERA(7 downto 4) := ERA(7 downto 4) + B; --R = R + B
                    else
                        ERA(0) := '1';
                    end if;

                else
                    ERA(8 downto 4) := (ERA(8 downto 4) + not(B)) + 1; --E:R = R+B'+1
                    ERA(0)          := '1';                            --A0 = 0
                end if;
            end loop;

            Q        <= ERA(3 downto 0);
            R        <= ERA(7 downto 4);
            OverFlow <= '0'; --output is valid

        end if;

    end process;

end Behavioral;