---------------------------------------------------------------
-- Company: CSUN
-- Semester: FALL 2020
-- Course: ECE524
-- Designer: Ussash Arafat

-- Project Name: LAB_01
-- Design Name: JOHNSON_COUNTER
--              (8 bit johnson counter with asynchronous reset, 
--               synchronous pause and direction controls)
-----------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity JOHNSON_COUNTER is
    Port ( CLOCK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           PAUSE : in STD_LOGIC;
           DIRECTION : in STD_LOGIC;
           OUTPUT : out STD_LOGIC_VECTOR (7 downto 0));
end JOHNSON_COUNTER;

architecture Behavioral of JOHNSON_COUNTER is
signal COUNT: unsigned (7 downto 0);
begin
process(CLOCK,RESET)
begin
    if(RESET='1') then
    COUNT <= (others=>'0');
    elsif (rising_edge(CLOCK)) then
        if(PAUSE='1') then
            COUNT <= COUNT;
        elsif(DIRECTION = '1') then
            COUNT(0) <= not COUNT(7);
            COUNT(1) <= COUNT(0);
            COUNT(2) <= COUNT(1);
            COUNT(3) <= COUNT(2);
            COUNT(4) <= COUNT(3);
            COUNT(5) <= COUNT(4);
            COUNT(6) <= COUNT(5);
            COUNT(7) <= COUNT(6);
        else
            COUNT(0) <= COUNT(1);
            COUNT(1) <= COUNT(2);
            COUNT(2) <= COUNT(3);
            COUNT(3) <= COUNT(4);
            COUNT(4) <= COUNT(5);
            COUNT(5) <= COUNT(6);
            COUNT(6) <= COUNT(7);
            COUNT(7) <= not COUNT(0);
        end if;
    end if;
end process;

OUTPUT <= std_logic_vector(COUNT);

end Behavioral;
