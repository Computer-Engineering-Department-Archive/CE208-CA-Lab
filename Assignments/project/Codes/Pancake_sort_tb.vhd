
library ieee;
use ieee.std_logic_1164.all;
use work.arr_package.all;
entity Pancake_sort_tb is
end Pancake_sort_tb;

architecture behavior of Pancake_sort_tb is
    signal in_arr  : arr(0 to 9);
    signal out_arr : arr(0 to 9);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut : entity work.Pancake_sort port map (
        in_arr  => in_arr,
        out_arr => out_arr
        );

    process

    begin

        in_arr(0) <= "11010";
        in_arr(1) <= "11111";
        in_arr(2) <= "10101";
        in_arr(3) <= "01000";
        in_arr(4) <= "10011";
        in_arr(5) <= "10100";
        in_arr(6) <= "00100";
        in_arr(7) <= "00000";
        in_arr(8) <= "00110";
        in_arr(9) <= "01100";

        wait for 200 ns;

        in_arr(0) <= "11110";
        in_arr(1) <= "11011";
        in_arr(2) <= "11101";
        in_arr(3) <= "01000";
        in_arr(4) <= "10001";
        in_arr(5) <= "10000";
        in_arr(6) <= "00110";
        in_arr(7) <= "00001";
        in_arr(8) <= "00010";
        in_arr(9) <= "11100";
        wait for 200 ns;

    end process;

end;