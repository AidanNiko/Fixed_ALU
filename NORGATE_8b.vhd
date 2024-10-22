library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NORGATE_8b is
  Port (   
    IN1: in std_logic_vector(7 downto 0);
    OUTPUT1: out std_logic
  );
end NORGATE_8b;

architecture struct of NORGATE_8b is
begin
    OUTPUT1 <= not(IN1(0) or IN1(1) or IN1(2) or IN1(3) or IN1(4) or IN1(5) or IN1(6) or IN1(7));
end ;
