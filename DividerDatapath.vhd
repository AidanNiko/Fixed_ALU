library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DividerDatapath is
 Port (
    CLK: in std_logic;
    OperandA, OperandB: in std_logic_vector(3 downto 0);
    loadA, loadB, loadR, loadQ, loadC: in std_logic;
    LSHR, LSHA, LSHQ: in std_logic;
    RSel, decC: in std_logic;
    Cout, C: out std_logic;
    REMQUO: out std_logic_vector(7 downto 0)
 );
end DividerDatapath;

architecture rtl of DividerDatapath is
    signal ROUT, AOUT, BOUT, QOUT, RMUXOUT, notBOUT, adderOUT: std_logic_vector(3 downto 0);
    signal ASout: std_logic;
    signal signalCout: std_logic;

begin

    notBOUT <= not(BOUT);

    RReg: entity work.ALShiftReg_4b(struct)
        port map(loadR, LSHR, CLK, ASout, RMUXOUT, ROUT);

    AReg: entity work.fromALShiftReg_4b(struct)
        port map(loadA, LSHA, CLK, OperandA, AOUT, ASout);

    BReg: entity work.Reg_4b(struct)
        port map(loadB, CLK, OperandB, BOUT);

    QReg: entity work.ALShiftReg_4b(struct)
        port map(loadQ, LSHQ, CLK, signalCout, "0000", QOUT);

    adder: entity work.FullAdder_4b(rtl)
        port map(ROUT, notBOUT, '1', adderOUT, signalCout);

    counter: entity work.downcounter(struct)
        port map(loadC, decC, CLK, C);

    RMUX: entity work.MUX2to1_4b(struct)
        port map("0000", adderOUT, RSel, RMUXOUT);
    
    Cout <= signalCout;
    REMQUO(7 downto 4) <= ROUT;
    REMQUO(3 downto 0) <= QOUT;

end ;
