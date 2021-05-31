LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY register32 IS PORT(
input		: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
load_enable	: IN STD_LOGIC; -- load/enable.
clr 		: IN STD_LOGIC; -- async. clear.
clk 		: IN STD_LOGIC; -- clock.
output   	: OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- output
storage		: BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0) --store the data
);
END register32;

ARCHITECTURE description OF register32 IS

BEGIN
	process(clk, clr)
	begin
	if clr = '1' then
		output <= x"00000000";
	elsif rising_edge(clk) then
		if load_enable = '1' then
			storage <= input;
		else
			output <= storage;
		end if;
        end if;
    end process;
END description;
