library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CompleteAdder is
 Port (
    OperandA, OperandB: in std_logic_vector(3 downto 0);
    sum: out std_logic_vector(7 downto 0);
    cout, v: out std_logic
 );
end CompleteAdder;

architecture rtl of CompleteAdder is
    signal adderSUM: std_logic_vector(3 downto 0);
    signal adderCarryOut: std_logic;
    signal dPP, dGG: std_logic;
    signal CLAcarry: std_logic_vector(4 downto 0);
	 component FullAdder_4b
		 port(
		 A, B: in std_logic_vector(3 downto 0);
		 Cin: in std_logic;
		 sum: out std_logic_vector(3 downto 0);
		 Cout: out std_logic
	 );
	end component;
	component carrylookahead
		port(
			P, G: in std_logic_vector(3 downto 0);
			Cin: in std_logic;
			PP, GG : out std_logic;
			Carry : out std_logic_vector(4 downto 0)
		);
	end component;
begin

	 sum(7 downto 4) <= "0000";
    sum(3 downto 0) <= adderSUM;

    cout <= adderCarryOut;
    v <= CLAcarry(4) xor CLAcarry(3);
	 
    adder: FullAdder_4b
        port map(OperandA, OperandB, '0', adderSUM, adderCarryOut);

    carrylookahead_1: carrylookahead
        port map(OperandA, OperandB, '0', dPP, dGG, CLAcarry);

end ;
