library ieee;
use ieee.std_logic_1164.all;

entity ram is
    port (
        arst     : in std_logic;
        clk      : in std_logic;
        enable   : in std_logic;
        we       : in std_logic;
        re       : in std_logic;
        r_addr   : in natural range 0 to 63;
        w_addr   : in natural range 0 to 63;
        data_in  : in std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(7 downto 0)
    );

end entity;

architecture behav of ram is

    -- Building a 2D-array for the RAM.
    ---------------------------------------------------
    -- Defiening subtype word (8-bits).
    subtype word_t is std_logic_vector(7 downto 0);
    -- Defiening main type  (64 * 8-bits).
    type ram_type is array(63 downto 0) of word_t;
    ---------------------------------------------------

    -- Declaring the RAM signal.
    signal ram_sig : ram_type;

begin

    -- Read Proccess Section
    process (arst, clk, enable, re)
    begin
        if arst = '1' then
            data_out <= (data_out'range => 'Z');
        elsif (clk'event and clk = '1') then
            if enable = '1' then
                if re = '1' then
                    data_out <= ram_sig(r_addr);
                else
                    data_out <= (data_out'range => 'Z');
                end if;
            end if;
        end if;
    end process;
    -- End of Read Proccess Section

    -- Write Proccess Section
    process (clk, enable, we)
    begin
        if (clk'event and clk = '1') then
            if enable = '1' then
                if we = '1' then
                    ram_sig(w_addr) <= data_in;
                end if;
            end if;
        end if;
    end process;
    -- End of Write Proccess Section
end behav;