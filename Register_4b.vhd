library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- input and output are 8 bit std_logic_vectors
-- LOAD is given as the EN signal for the ENDFF
entity Reg_4b is
    port(
        LOAD, CLK: in std_logic;
        INPUT: in std_logic_vector(3 downto 0);
        OUTPUT: out std_logic_vector(3 downto 0)
    );
end Reg_4b;

architecture struct OF Reg_4b is
    signal signalENDFF: std_logic_vector(3 downto 0);
begin
    ENDFF_0: entity work.ENDFF(struct)
        port map(INPUT(0), LOAD, CLK, signalENDFF(0));
     ENDFF_1: entity work.ENDFF(struct)
        port map(INPUT(1), LOAD, CLK, signalENDFF(1));
     ENDFF_2: entity work.ENDFF(struct)
        port map(INPUT(2), LOAD, CLK, signalENDFF(2));
     ENDFF_3: entity work.ENDFF(struct)
        port map(INPUT(3), LOAD, CLK, signalENDFF(3));
    OUTPUT <= signalENDFF;
end struct;