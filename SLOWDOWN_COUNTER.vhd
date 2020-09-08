--------------------------------------------------------------------------------
-- Company: CSUN
-- Semester: FALL 2020
-- Course: ECE524
-- Designer: Ussash Arafat

-- Project Name: LAB_01
-- Design Name: SLOWDOWN_COUNTER
--              (This module converts 100MHZ clock to approximately 1MHz clock) 
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SLOWDOWN_COUNTER is
    Port ( CLOCK : in STD_LOGIC;
           RESET: in STD_LOGIC;
           SLOW_CLOCK : out STD_LOGIC);
end SLOWDOWN_COUNTER;

architecture Behavioral of SLOWDOWN_COUNTER is
signal COUNT: UNSIGNED(31 downto 0);
begin
process(CLOCK)
begin
    if(rising_edge(CLOCK)) then
        if(RESET='1') then
        COUNT <= (others=>'0');
        else
        COUNT <= COUNT + 1;
        end if;
    end if;
 end process;
 SLOW_CLOCK <= COUNT(2);
end Behavioral;
