---------------------------------------------------------------
-- Company: CSUN
-- Semester: FALL 2020
-- Course: ECE524
-- Designer: Ussash Arafat

-- Project Name: LAB_01
-- Design Name: BINARY_COUNTER
--              (8 bit binary counter with asynchronous reset,
--               synchronous pause and direction controls)
-----------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BINARY_COUNTER is
    Port ( CLOCK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           PAUSE : in STD_LOGIC;
           DIRECTION : in STD_LOGIC;
           OUTPUT : out STD_LOGIC_VECTOR (7 downto 0));
end BINARY_COUNTER;

architecture Behavioral of BINARY_COUNTER is
signal COUNT: UNSIGNED (7 downto 0);
begin
process(CLOCK,RESET)
begin
    if(RESET='1') then
    COUNT <= (others=>'0');
    elsif (rising_edge(CLOCK)) then
        if(PAUSE='1') then
            COUNT <= COUNT;
        elsif(DIRECTION = '1') then
            COUNT <= COUNT + 1;
        else
            COUNT <= COUNT - 1;
        end if;
    end if;
end process;

OUTPUT <= std_logic_vector(COUNT);

end Behavioral;
