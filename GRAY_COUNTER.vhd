---------------------------------------------------------------
-- Company: CSUN
-- Semester: FALL 2020
-- Course: ECE524
-- Designer: Ussash Arafat

-- Project Name: LAB_01
-- Design Name: GRAY_COUNTER
--              (8 bit gray counter with asynchronous reset, 
--               synchronous pause and direction controls)
-----------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity GRAY_COUNTER is
    Port ( CLOCK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           PAUSE : in STD_LOGIC;
           DIRECTION : in STD_LOGIC;
           OUTPUT : out STD_LOGIC_VECTOR (7 downto 0));
end GRAY_COUNTER;

architecture Behavioral of GRAY_COUNTER is
signal BINARY_COUNT: UNSIGNED (7 downto 0);
signal COUNT: UNSIGNED (7 downto 0);
begin
process(CLOCK,RESET)
begin
    if(RESET='1') then
    BINARY_COUNT <= (others=>'0');
    elsif (rising_edge(CLOCK)) then
        if(PAUSE='1') then
            BINARY_COUNT <= BINARY_COUNT;
        elsif(DIRECTION = '1') then
            BINARY_COUNT <= BINARY_COUNT + 1;
        else
            BINARY_COUNT <= BINARY_COUNT -1 ;
        end if;
    end if;
end process;

COUNT(0) <= BINARY_COUNT(0) xor BINARY_COUNT(1);
COUNT(1) <= BINARY_COUNT(1) xor BINARY_COUNT(2);
COUNT(2) <= BINARY_COUNT(2) xor BINARY_COUNT(3);
COUNT(3) <= BINARY_COUNT(3) xor BINARY_COUNT(4);
COUNT(4) <= BINARY_COUNT(4) xor BINARY_COUNT(5);
COUNT(5) <= BINARY_COUNT(5) xor BINARY_COUNT(6);
COUNT(6) <= BINARY_COUNT(6) xor BINARY_COUNT(7);
COUNT(7) <= BINARY_COUNT(7);

OUTPUT <= std_logic_vector(COUNT);

end Behavioral;
