library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DividerControllogic is
 Port (
    Greset, CLK: in std_logic;
    Cout, C: in std_logic;
    loadA, loadB, loadR, loadQ, loadC: out std_logic;
    LSHR, LSHA, LSHQ: out std_logic;
    RSel, decC: out std_logic
 );
end DividerControllogic;

architecture struct of DividerControllogic is
    signal s0, s0_bar: std_logic;
	signal s1, s1_bar: std_logic;
	signal s2, s2_bar: std_logic;
	signal s3, s3_bar: std_logic;
	signal s4, s4_bar: std_logic;
	signal s5, s5_bar: std_logic;
    signal DFF1IN, DFF2IN, DFF3IN, DFF4IN, DFF5IN: std_logic;
begin
    DFF1IN <= s0 or s5;
    DFF2IN <= s1;
    DFF3IN <= s2 and Cout;
    DFF4IN <= (s3 and C) or (s2 and not(Cout) and C);
    DFF5IN <= (not(C) and not(Cout) and s2) or (s3 and not(C));

    DFF0: entity work.enARdFF_2(struct)
        port map(s0, Greset, '1', CLK, s0, s0_bar);
    
    DFF1: entity work.enARdFF_2(struct)
        port map(s0, DFF1IN, '1', CLK, s1, s1_bar);
        
    DFF2: entity work.enARdFF_2(struct)
        port map(s0, DFF2IN, '1', CLK, s2, s2_bar);
    
    DFF3: entity work.enARdFF_2(struct)
        port map(s0, DFF3IN, '1', CLK, s3, s3_bar);

    DFF4: entity work.enARdFF_2(struct)
        port map(s0, DFF4IN, '1', CLK, s4, s4_bar);
    
    DFF5: entity work.enARdFF_2(struct)
        port map(s0, DFF5IN, '1', CLK, s5, s5_bar);


    loadA <= (s0 or s1) and not(s4);
    loadB <= not(s4);
    decC <= s5 and not(s4);
    loadQ <= s2 and not(s4);
    loadC <= (s0 or s5) and not(s4);
    loadR <= (s1 or s3) and not(s4);
    LSHA <= s1 and not(s4);
    LSHR <= s1 and not(s4);
    LSHQ <= s2 and not(s4);
    RSel <= not(s0) and not(s4);
    
end ;
