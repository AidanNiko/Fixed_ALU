library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity complement_4b is
 Port (
    IN1: in std_logic_vector(3 downto 0);
    OUT1: out std_logic_vector(3 downto 0)
 );
end complement_4b;

architecture struct of complement_4b is
    signal XOROUT: std_logic_vector(3 downto 0);
    signal cout: std_logic;
begin
    XOROUT <= "1111" xor IN1;
    
    adder: entity work.FullAdder_4b(rtl)
        port map("0000", XOROUT, '1', OUT1, cout);
end ;
