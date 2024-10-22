library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ALShiftReg_4b is
 Port (
    LOAD, SHIFTL, CLK, ASin: in std_logic;
    INPUT: in std_logic_vector(3 downto 0);
    OUTPUT: out std_logic_vector(3 downto 0)
 );
end ALShiftReg_4b;

architecture struct of ALShiftReg_4b is
    signal signalENDFF: std_logic_vector(3 downto 0);
    signal signalMUX: std_logic_vector(3 downto 0);
    signal signalQshift: std_logic_vector(3 downto 0);
begin
    -- Shift signal logic
    signalQshift(3 downto 1) <= signalENDFF(2 downto 0);
    signalQshift(0) <= ASin;

    ENDFF_0: entity work.ENDFF(struct)
        port map(signalMUX(0), LOAD, CLK, signalENDFF(0));
    ENDFF_1: entity work.ENDFF(struct)
        port map(signalMUX(1), LOAD, CLK, signalENDFF(1));
    ENDFF_2: entity work.ENDFF(struct)
        port map(signalMUX(2), LOAD, CLK, signalENDFF(2));
    ENDFF_3: entity work.ENDFF(struct)
        port map(signalMUX(3), LOAD, CLK, signalENDFF(3));
    
    -- SHIFTL is the select to determine the register's input
    -- OUTPUT <= left shifted signal if SHIFTL is 1
    -- OUTPUT <= INPUT signal if SHIFTL is 0
        MUX2to1_4b: entity work.MUX2to1_4b(struct)
        port map(INPUT, signalQshift, SHIFTL, signalMUX);
    OUTPUT <= signalENDFF;

end ;
