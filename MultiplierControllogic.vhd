library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MultiplierControllogic is
 Port (
    Greset, CLK, z, b0: in std_logic;
    loadA, loadB: out std_logic;
    LSHA, RSHB: out std_logic;
    PSel, loadP: out std_logic
 );
end MultiplierControllogic;

architecture struct of MultiplierControllogic is
    signal s0, s0_bar: std_logic;
	signal s1, s1_bar: std_logic;
	signal s2, s2_bar: std_logic;
	signal s3, s3_bar: std_logic;
    signal DFF1IN, DFF2IN, DFF3IN: std_logic;
begin

    DFF1IN <= (s0 and not(z) and b0) or (s2 and not(z) and b0);
    DFF2IN <= s1 or (not(b0) and not(z) and s2) or (not(b0) and not(z) and s0);
    DFF3IN <= (z and s0) or (z and s2);


    DFF0: entity work.enARdFF_2(struct)
        port map(s0, Greset, '1', CLK, s0, s0_bar);
    
    DFF1: entity work.enARdFF_2(struct)
        port map(s0, DFF1IN, '1', CLK, s1, s1_bar);
        
    DFF2: entity work.enARdFF_2(struct)
        port map(s0, DFF2IN, '1', CLK, s2, s2_bar);
    
    DFF3: entity work.enARdFF_2(struct)
        port map(s0, DFF3IN, '1', CLK, s3, s3_bar);

    loadA <= (s0 or s2) and not(s3);
    loadB <= (s0 or s2) and not(s3);
    PSel <= s1 and not(s3);                
    loadP <= (s0 or s1) and not(s3);
    LSHA <= s2 and not(s3);
    RSHB <= s2 and not(s3);

end ;
