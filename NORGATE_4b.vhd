library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NORGATE_4b is
  Port (   
    IN1: in std_logic_vector(3 downto 0);
    OUTPUT1: out std_logic
  );
end NORGATE_4b;

architecture rtl of NORGATE_4b is
begin
    OUTPUT1 <= not(IN1(0) or IN1(1) or IN1(2) or IN1(3));
end ;
