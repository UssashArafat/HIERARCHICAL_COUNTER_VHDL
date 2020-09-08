---------------------------------------------------------------
-- Company: CSUN
-- Semester: FALL 2020
-- Course: ECE524
-- Designer: Ussash Arafat

-- Project Name: LAB_01
-- Design Name: FIBONACCI_COUNTER
--              (8 bit fibonacci sequence with asynchronous reset 
--               and synchronous pasue)
-----------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FIBONACCI_COUNTER is
    Port ( CLOCK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           PAUSE : in STD_LOGIC;
           OUTPUT : out STD_LOGIC_VECTOR (7 downto 0));
end FIBONACCI_COUNTER;

architecture Behavioral of FIBONACCI_COUNTER is
signal COUNT,VALUE0,VALUE1: UNSIGNED(7 downto 0);
begin
process(CLOCK,RESET)
begin
    if(RESET='1') then
       COUNT <= (others=>'0');
       VALUE0 <= (others=>'0');
       VALUE1 <= "00000001";
    elsif (rising_edge(CLOCK)) then
        if(PAUSE='1') then
            COUNT <= COUNT;
        else
            VALUE0 <= VALUE1;
            VALUE1 <= COUNT;
        end if;
        
    end if;
    COUNT <= VALUE0+VALUE1;
end process;

OUTPUT <= std_logic_vector(COUNT);

end Behavioral;
