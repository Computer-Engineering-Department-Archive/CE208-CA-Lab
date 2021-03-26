-- VHDL project: VHDL code for Sequence Detector using Moore FSM
-- The sequence being detected is "01010101"
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY VHDL_MOORE_FSM_Sequence_Detector IS
    PORT (
        clock : IN STD_LOGIC; --- clock signal
        reset : IN STD_LOGIC; -- reset input
        sequence_in : IN STD_LOGIC; -- binary sequence input
        detector_out : OUT STD_LOGIC -- output of the VHDL sequence detector
    );
END VHDL_MOORE_FSM_Sequence_Detector;

ARCHITECTURE Behavioral OF VHDL_MOORE_FSM_Sequence_Detector IS
    TYPE MOORE_FSM IS (Init, S0, S1, S2, S3, S4, S5, S6, S7);
    SIGNAL current_state, next_state : MOORE_FSM;

BEGIN
    -- Sequential memory of the VHDL MOORE FSM Sequence Detector
    PROCESS (clock, reset)
    BEGIN
        IF (reset = '1') THEN
            current_state <= Init;
        ELSIF (rising_edge(clock)) THEN
            current_state <= next_state;
        END IF;
    END PROCESS;

    -- Next state logic of the VHDL MOORE FSM Sequence Detector
    -- Combinational logic
    PROCESS (current_state, sequence_in)
    BEGIN
        CASE(current_state) IS
            WHEN Init =>
                IF (sequence_in = '0') THEN
                    -- "0"
                    next_state <= S0;
                END IF;
            WHEN S0 =>
                IF (sequence_in = '1') THEN
                    -- "01"
                    next_state <= S1;
                END IF;
            WHEN S1 =>
                IF (sequence_in = '0') THEN
                    -- "010"
                    next_state <= S2;
                ELSE
                    next_state <= Init;
                END IF;
            WHEN S2 =>
                IF (sequence_in = '1') THEN
                    -- "0101"
                    next_state <= S3;
                ELSE
                    -- "0"
                    next_state <= S0;
                END IF;
            WHEN S3 =>
                IF (sequence_in = '0') THEN
                    -- "01010"
                    next_state <= S4;
                ELSE
                    next_state <= Init;
                END IF;
            WHEN S4 =>
                IF (sequence_in = '1') THEN
                    -- "010101"
                    next_state <= S5;
                ELSE
                    -- "0"
                    next_state <= S0;
                END IF;
            WHEN S5 =>
                IF (sequence_in = '0') THEN
                    -- "0101010"
                    next_state <= S6;
                ELSE
                    next_state <= Init;
                END IF;
            WHEN S6 =>
                IF (sequence_in = '1') THEN
                    -- "01010101"
                    next_state <= S7;
                ELSE
                    next_state <= S0;
                END IF;
            WHEN S7 =>
                IF (sequence_in = '0') THEN
                    -- "0101010"
                    next_state <= S6;
                ELSE
                    next_state <= Init;
                END IF;
        END CASE;
    END PROCESS;

    -- Output logic of the VHDL MOORE FSM Sequence Detector
    PROCESS (current_state)
    BEGIN
        CASE current_state IS
            WHEN S7 =>
                detector_out <= '1';
            WHEN OTHERS =>
                detector_out <= '0';
        END CASE;
    END PROCESS;
END Behavioral;