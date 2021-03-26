-- VHDL project: VHDL code for Sequence Detector using Moore FSM
-- VHDL testbench for Moore FSM Sequence Detector
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_VHDL_Moore_FSM_Sequence_Detector IS
END tb_VHDL_Moore_FSM_Sequence_Detector;

ARCHITECTURE behavior OF tb_VHDL_Moore_FSM_Sequence_Detector IS

    -- Component Declaration for the Moore FSM Sequence Detector in VHDL

    COMPONENT VHDL_MOORE_FSM_Sequence_Detector
        PORT (
            clock : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            sequence_in : IN STD_LOGIC;
            detector_out : OUT STD_LOGIC
        );
    END COMPONENT;
    --Inputs
    SIGNAL clock : STD_LOGIC := '0';
    SIGNAL reset : STD_LOGIC := '0';
    SIGNAL sequence_in : STD_LOGIC := '0';

    --Outputs
    SIGNAL detector_out : STD_LOGIC;

    -- Clock period definitions
    CONSTANT clock_period : TIME := 10 ns;

BEGIN

    -- Instantiate the Moore FSM Sequence Detector in VHDL
    uut : VHDL_MOORE_FSM_Sequence_Detector PORT MAP(
        clock => clock,
        reset => reset,
        sequence_in => sequence_in,
        detector_out => detector_out
    );

    -- Clock process definitions
    clock_process : PROCESS
    BEGIN
        clock <= '0';
        WAIT FOR clock_period/2;
        clock <= '1';
        WAIT FOR clock_period/2;
    END PROCESS;
    -- Stimulus process
    stim_proc : PROCESS
    BEGIN
        -- hold reset state for 100 ns.
        sequence_in <= '0';
        reset <= '1';
        -- Wait 100 ns for global reset to finish
        WAIT FOR 30 ns;
        reset <= '0';
        WAIT FOR 40 ns;
        sequence_in <= '0';
        WAIT FOR 10 ns;
        sequence_in <= '1';
        WAIT FOR 10 ns;
        sequence_in <= '0';
        WAIT FOR 20 ns;
        sequence_in <= '1';
        WAIT FOR 20 ns;
        sequence_in <= '0';
        WAIT FOR 20 ns;
        sequence_in <= '1';
        WAIT FOR 20 ns;
        sequence_in <= '0';
        WAIT FOR 20 ns;
        sequence_in <= '1';
        WAIT FOR 20 ns;
        sequence_in <= '0';
        WAIT FOR 20 ns;
        sequence_in <= '1';
        -- insert stimulus here 
        WAIT;
    END PROCESS;

END;