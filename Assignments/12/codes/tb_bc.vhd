--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:54:50 06/15/2021
-- Design Name:   
-- Module Name:   C:/Users/novin/Desktop/verilog/basicComputer/tb_bc.vhd
-- Project Name:  basicComputer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Basic_Computer
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_bc IS
END tb_bc;
 
ARCHITECTURE behavior OF tb_bc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BC
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         PCC : OUT  std_logic_vector(4 downto 0);
         MARR : OUT  std_logic_vector(4 downto 0);
         ACCC : OUT  std_logic_vector(7 downto 0);
         MDRR : OUT  std_logic_vector(7 downto 0);
         IRR : OUT  std_logic_vector(7 downto 0);
         CFF : OUT  std_logic;
         state_out : OUT  std_logic_vector(3 downto 0);
			myoutdata : out std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal PCC : std_logic_vector(4 downto 0);
   signal MARR : std_logic_vector(4 downto 0);
   signal ACCC : std_logic_vector(7 downto 0);
   signal MDRR : std_logic_vector(7 downto 0);
   signal IRR : std_logic_vector(7 downto 0);
   signal CFF : std_logic;
   signal state_out : std_logic_vector(3 downto 0);
	signal myoutdata :  std_logic_vector(7 downto 0);
   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BC PORT MAP (
          clk => clk,
          rst => rst,
          PCC => PCC,
          MARR => MARR,
          ACCC => ACCC,
          MDRR => MDRR,
          IRR => IRR,
          CFF => CFF,
          state_out => state_out,
			 myoutdata => myoutdata 
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rst <= '0';
      wait for 300 ns;	
		rst <= '1';
      wait for clk_period*10;
		
      -- insert stimulus here 

      wait;
   end process;

END;
