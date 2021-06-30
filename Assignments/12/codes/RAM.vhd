library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity ram is
	generic (
		W : integer := 16;
		d : integer := 4096;
		c : integer := 12);

	port (
		data_in      : in std_logic_vector(W - 1 downto 0);
		addr         : in std_logic_vector(c - 1 downto 0);
		wr, clk, rst : in std_logic;
		data_out     : out std_logic_vector(W - 1 downto 0));
end entity ram;

architecture behavior of ram is

	type ram_type is array(0 to d - 1) of std_logic_vector(W - 1 downto 0);
	signal ram : ram_type := (others => (others => '0'));

begin

	main_process : process (clk, rst)
	begin
		if (rising_edge(clk)) then
			if (wr = '1') then
				ram(conv_integer(addr)) <= data_in;
			elsif (wr = '0') then
				data_out <= ram(conv_integer(addr));
			end if;
		end if;

	end architecture behavior;