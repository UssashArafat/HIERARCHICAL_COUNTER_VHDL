---------------------------------------------------------------
-- Company: CSUN
-- Semester: FALL 2020
-- Course: ECE524
-- Designer: Ussash Arafat

-- Project Name: LAB_01
-- Design Name: TB_COUNTER
--              (Tesetbench for the Top level design)
-----------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_COUNTER is
end TB_COUNTER;

architecture Behavioral of TB_COUNTER is
component COUNTER is
    Port ( CLOCK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           PAUSE : in STD_LOGIC;
           DIRECTION : in STD_LOGIC;
           CONTROL : in STD_LOGIC_VECTOR (2 downto 0);
           OUTPUT : out STD_LOGIC_VECTOR (7 downto 0));
end component COUNTER;
signal CLOCK,RESET,PAUSE,DIRECTION: STD_LOGIC;
signal CONTROL: STD_LOGIC_VECTOR (2 downto 0);
signal OUTPUT: STD_LOGIC_VECTOR (7 downto 0);
begin
UUT: COUNTER port map (CLOCK=>CLOCK, RESET=>RESET, PAUSE=>PAUSE, DIRECTION=>DIRECTION, CONTROL=>CONTROL, OUTPUT=>OUTPUT);

process
begin
CLOCK <= '0';
wait for 5ns;
CLOCK <= '1';
wait for 5ns;
end process;

process
begin
RESET <= '0';
wait for 60 ns;
RESET <= '1';
wait for 80ns;
RESET <= '0';
wait for 2185ns;
end process;

process
begin
CONTROL <= "000";
wait for 2400ns;
CONTROL <= "001";
wait for 2400ns;
CONTROL <= "010";
wait for 2400ns;
CONTROL <= "011";
wait for 2400ns;
CONTROL <= "100";
wait for 2100ns;
CONTROL <= "101";
wait for 2400ns;
end process;

process
begin
PAUSE <= '0';
wait for 800ns;
PAUSE <= '1';
wait for 160ns;
PAUSE <= '0';
wait for 800ns;
PAUSE <= '1';
wait for 160ns;
end process;

process
begin
DIRECTION <= '1';
wait for 1200ns;
DIRECTION <= '0';
wait for 1200 ns;
end process;
end Behavioral;

