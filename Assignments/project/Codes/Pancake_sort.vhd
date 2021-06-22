library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
package arr_package is
    type arr is array (natural range <>) of std_logic_vector(4 downto 0);
end package;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.arr_package.all;

entity Pancake_sort is
    generic (SIZE : integer := 10);

    port (
        in_arr  : in arr(0 to SIZE - 1);
        out_arr : out arr(0 to SIZE - 1)
    );
end entity;

architecture Behavioral of Pancake_sort is

    --a funtion to find the maximum element's index
    function find_max(a : arr) return integer is
        variable index      : integer := 0;
        variable foundmax   : std_logic_vector(4 downto 0);
    begin
        for i in 0 to a'high loop
            if (a(i) > to_integer(unsigned(foundmax))) then
                index    := i;
                foundmax := a(i);
            end if;
        end loop;
        return index;
    end function find_max;

    --a function to reverse the 'a' array
    function reverse(a : arr) return arr is
        variable b         : arr(a'range);
    begin
        for i in b'range loop
            b(i) := a(a'high - i);
        end loop;
        return b;
    end function reverse;

begin

    process (in_arr)

        variable max_index : integer;
        variable temp_arr  : arr(in_arr'range);
        variable index     : integer;

    begin

        temp_arr := in_arr;
        -- the pancake sorting algorithm
        for i in temp_arr'range loop
            index                    := (SIZE - 1) - i;
            max_index                := find_max(temp_arr(0 to index));
            temp_arr(0 to max_index) := reverse(temp_arr(0 to max_index));
            temp_arr(0 to index)     := reverse(temp_arr(0 to index));
        end loop;

        out_arr <= temp_arr;
    end process;
end Behavioral;