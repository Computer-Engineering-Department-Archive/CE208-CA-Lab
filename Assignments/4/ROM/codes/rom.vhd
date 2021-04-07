library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--ROM with clock and reset
--each word is 1 bytes (or 8 bits)
--this architecture is 16 x 8
entity ROM is port(
	clk			: in std_logic;
	rst			: in std_logic;
	enable			: in std_logic;
	read			: in std_logic;
	address			: in integer range 0 to 15;
	dout			: out std_ulogic_vector(7 downto 0)
);
end ROM;

architecture behave of ROM is
	type ROM_Array is array (0 to 15) of std_ulogic_vector (7 downto 0);

	constant content: ROM_Array := (
		"00000000", "00000001", "00000010", "00000011",
		"00000100", "00000101", "00000110", "00000111",
		"00001000", "00001001", "00001010", "00001011",
		"00001100", "00001101", "00001110", "00001111"
	);

begin 
    process(clk, rst, enable, read, address)
    begin
        if(rst = '1') then 
            dout <= "ZZZZZZZZ";
        elsif(clk'event and clk = '1') then
            if (enable = '1') then
                if (read = '1') then 
                    dout <= content(address);
                else 
                    dout <= "ZZZZZZZZ";
                end if;
            end if;
        end if;
    end process;
end behave;