--------------------------------------------------------------------
-- Test Bench for memory module
-- use loop statement to test module completely
-------------------------------------------------------------------- 

library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ram_tb is -- entity declaration
end ram_tb;

--------------------------------------------------------------------

architecture Testbench of ram_tb is

    component ram is
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
    end component;

    signal arst_sig, clk_sig, enable_sig, re_sig, we_sig : std_logic;
    signal r_Addr_sig, w_Addr_sig                        : natural range 0 to 63;
    signal data_in_sig, data_out_sig                     : std_logic_vector(7 downto 0);
begin

    ram_compo : ram port map(
        arst_sig, clk_sig, enable_sig, re_sig, we_sig,
        r_Addr_sig, w_Addr_sig,
        data_in_sig, data_out_sig
    );

    clk_proccess : process
    begin
        clk_sig <= '1'; -- clock cycle 10 ns
        wait for 5 ns;
        clk_sig <= '0';
        wait for 5 ns;
    end process;

    process
    begin
        arst_sig    <= '0';
        enable_sig  <= '1';
        re_sig      <= '0';
        we_sig      <= '0';
        w_Addr_sig  <= 0;
        r_Addr_sig  <= 0;
        data_in_sig <= (data_in_sig'range => '0');
        wait for 20 ns;

        -- test write		
        for i in 0 to 4 loop
            w_Addr_sig  <= w_Addr_sig + 5;
            data_in_sig <= data_in_sig + "101";
            we_sig      <= '1';
            re_sig      <= '1';
            wait for 10 ns;
        end loop;

        -- test read
        for i in 0 to 4 loop
            r_Addr_sig <= r_Addr_sig + 5;
            re_sig     <= '1';
            -- we_sig     <= '0';
            wait for 10 ns;
        end loop;

    end process;
end Testbench;