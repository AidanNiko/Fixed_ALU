library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity complement_8b is
 Port (
    IN1: in std_logic_vector(7 downto 0);
    OUT1: out std_logic_vector(7 downto 0)
 );
end complement_8b;

architecture struct of complement_8b is
    signal XOROUT: std_logic_vector(7 downto 0);
    signal cout: std_logic;
begin
	 adder: entity work.FullAdder_8b(rtl)
        port map("00000000", XOROUT, '1', OUT1, cout);
	 XOROUT <= "11111111" xor IN1;
end ;
