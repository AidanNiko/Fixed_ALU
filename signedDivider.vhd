library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity signedDivider is
 Port (
    OperandA, OperandB: in std_logic_vector(3 downto 0);
    Greset, CLK: in std_logic;
    REMQUO: out std_logic_vector(7 downto 0)
 );
end signedDivider;

architecture struct of signedDivider is
    signal signXOR: std_logic;
    signal Acomp, Bcomp, AMUXOUT, BMUXOUT, QUOcomp: std_logic_vector(3 downto 0);
    signal REMQUOMUXOUT, REMQUOcomp, DIVIDEROUT: std_logic_vector(7 downto 0);
begin

    Divider: entity work.divider(rtl)
        port map(AMUXOUT, BMUXOUT, Greset, CLK, DIVIDEROUT);

    QUOcomplementer: entity work.complement_4b(struct)
        port map(DIVIDEROUT(3 downto 0), QUOcomp);
		  
	  signXOR <= OperandA(3) xor OperandB(3);

    Acomplementer: entity work.complement_4b(struct)
        port map(OperandA, Acomp);
    
    Bcomplementer: entity work.complement_4b(struct)
        port map(OperandB, Bcomp);
    
    AMUX: entity work.MUX2to1_4b(struct)
        port map(OperandA, Acomp, OperandA(3), AMUXOUT);

    BMUX: entity work.MUX2to1_4b(struct)
        port map(OperandB, Bcomp, OperandB(3), BMUXOUT);

    REMQUOcomp(7 downto 4) <= DIVIDEROUT(7 downto 4);
    REMQUOcomp(3 downto 0) <= QUOcomp;

    REMQUOMUX: entity work.MUX2to1_8b(rtl)
        port map(DIVIDEROUT, REMQUOcomp, signXOR, REMQUOMUXOUT);

    REMQUO <= REMQUOMUXOUT;

end ;
