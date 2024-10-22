library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX2to1 is
    port(
        IN1, IN2: in std_logic;
        Sel: in std_logic;
        OUT1: out std_logic
    );
end MUX2to1;

architecture struct OF MUX2to1 is
begin
    OUT1 <= ((IN1 and not(Sel)) or (IN2 and Sel));
end struct;