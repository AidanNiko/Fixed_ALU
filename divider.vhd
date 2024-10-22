library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divider is
 Port (
    OperandA, operandB: in std_logic_vector(3 downto 0);
    Greset, CLK: in std_logic;
    REMQUO: out std_logic_vector(7 downto 0)
 );
end divider;

architecture rtl of divider is
    signal loadA, loadB, loadR, loadQ, loadC, LSHR, LSHA, LSHQ, RSel, decC: std_logic;
    signal Cout, C: std_logic;
    signal invertedCLK: std_logic;
begin
    

    datapath: entity work.DividerDatapath(rtl)
        port map(CLK, OperandA, OperandB, loadA, loadB, loadR, loadQ, loadC, LSHR, LSHA, LSHQ, RSel, decC, Cout, C, REMQUO);
    
    controllogic: entity work.DividerControllogic(struct)
        port map(Greset, invertedCLK, Cout, C, loadA, loadB, loadR, loadQ, loadC, LSHR, LSHA, LSHQ, RSel, decC);
		  
	 invertedCLK <= not(CLK);
    
end ;
