library ieee;
use ieee.std_logic_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

entity tb_bc is
end tb_bc;

architecture behavior of tb_bc is

   -- Component Declaration for the Unit Under Test (UUT)

   component BC
      port (
         clk       : in std_logic;
         rst       : in std_logic;
         PCC       : out std_logic_vector(4 downto 0);
         MARR      : out std_logic_vector(4 downto 0);
         ACCC      : out std_logic_vector(7 downto 0);
         MDRR      : out std_logic_vector(7 downto 0);
         IRR       : out std_logic_vector(7 downto 0);
         CFF       : out std_logic;
         state_out : out std_logic_vector(3 downto 0);
         myoutdata : out std_logic_vector(7 downto 0)
      );
   end component;
   --Inputs
   signal clk          : std_logic := '0';
   signal rst          : std_logic := '0';

   --Outputs
   signal PCC          : std_logic_vector(4 downto 0);
   signal MARR         : std_logic_vector(4 downto 0);
   signal ACCC         : std_logic_vector(7 downto 0);
   signal MDRR         : std_logic_vector(7 downto 0);
   signal IRR          : std_logic_vector(7 downto 0);
   signal CFF          : std_logic;
   signal state_out    : std_logic_vector(3 downto 0);
   signal myoutdata    : std_logic_vector(7 downto 0);
   -- Clock period definitions
   constant clk_period : time := 50 ns;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut : BC port map(
      clk       => clk,
      rst       => rst,
      PCC       => PCC,
      MARR      => MARR,
      ACCC      => ACCC,
      MDRR      => MDRR,
      IRR       => IRR,
      CFF       => CFF,
      state_out => state_out,
      myoutdata => myoutdata
   );

   -- Clock process definitions
   clk_process : process
   begin
      clk <= '0';
      wait for clk_period/2;
      clk <= '1';
      wait for clk_period/2;
   end process;
   -- Stimulus process
   stim_proc : process
   begin
      -- hold reset state for 100 ns.
      rst <= '0';
      wait for 300 ns;
      rst <= '1';
      wait for clk_period * 10;

      -- insert stimulus here 

      wait;
   end process;

end;