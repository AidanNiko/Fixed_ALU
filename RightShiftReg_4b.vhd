library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Right shift register
entity RightShiftReg_4b is
    port(
        LOAD, SHIFTR, CLK: in std_logic;
        INPUT: in std_logic_vector(3 downto 0);
        OUTPUT: out std_logic_vector(3 downto 0)
    );
end RightShiftReg_4b;

architecture rtl OF RightShiftReg_4b is
    signal signalENDFF: std_logic_vector(3 downto 0);
    signal signalMUX: std_logic_vector(3 downto 0);
    signal signalQshift: std_logic_vector(3 downto 0);
begin
    -- Shift signal logic
    signalQshift(2 downto 0) <= signalENDFF(3 downto 1);
    signalQshift(3) <= '0';

    ENDFF_0: entity work.ENDFF(struct)
        port map(signalMUX(0), LOAD, CLK, signalENDFF(0));
    ENDFF_1: entity work.ENDFF(struct)
        port map(signalMUX(1), LOAD, CLK, signalENDFF(1));
    ENDFF_2: entity work.ENDFF(struct)
        port map(signalMUX(2), LOAD, CLK, signalENDFF(2));
    ENDFF_3: entity work.ENDFF(struct)
        port map(signalMUX(3), LOAD, CLK, signalENDFF(3));
   
    -- SHIFTR is the select to determine the register's input
    -- OUTPUT <= right shifted signal if SHIFTR is 1
    -- OUTPUT <= INPUT signal if SHIFTR is 0
        MUX2to1_4b: entity work.MUX2to1_4b(struct)
        port map(INPUT, signalQshift, SHIFTR, signalMUX);
    OUTPUT <= signalENDFF;
end rtl;