library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity downcounter is
 Port (
    LC, EC, CLK: in std_logic;
    c: out std_logic
 );
end downcounter;

architecture struct of downcounter is
    signal COUNT: std_logic_vector(3 downto 0);
begin
    counter: entity work.LeftshiftReg_4b(rtl)
        port map(LC, EC, CLK, "0001", COUNT);

    c <= COUNT(3);
end ;
