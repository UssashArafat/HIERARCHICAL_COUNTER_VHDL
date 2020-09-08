---------------------------------------------------------------
-- Company: CSUN
-- Semester: FALL 2020
-- Course: ECE524
-- Designer: Ussash Arafat

-- Project Name: LAB_01
-- Design Name: COUNTER
--             (Top level design of a counter consist of a 32 bit slowdown counter, 6 diffrerent types of counters and 8x1 MUX)
--               CONTROL     COUNTER
--              ========    ========
--               001          BCD
--               010          GRAY
--               011          RING
--               100         JOHNSON
--               101        FIBONACCI
--           000,110,111     BINARY
-----------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity COUNTER is
    Port ( CLOCK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           PAUSE : in STD_LOGIC;
           DIRECTION : in STD_LOGIC;
           CONTROL : in STD_LOGIC_VECTOR (2 downto 0);
           OUTPUT : out STD_LOGIC_VECTOR (7 downto 0));
end COUNTER;

architecture Behavioral of COUNTER is

component SLOWDOWN_COUNTER is
    Port ( CLOCK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           SLOW_CLOCK : out STD_LOGIC);
end component SLOWDOWN_COUNTER;

component BINARY_COUNTER is
    Port ( CLOCK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           PAUSE : in STD_LOGIC;
           DIRECTION : in STD_LOGIC;
           OUTPUT : out STD_LOGIC_VECTOR (7 downto 0));
end component BINARY_COUNTER;

component BCD_COUNTER is
    Port ( CLOCK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           PAUSE : in STD_LOGIC;
           DIRECTION : in STD_LOGIC;
           OUTPUT : out STD_LOGIC_VECTOR (7 downto 0));
end component BCD_COUNTER;

component GRAY_COUNTER is
    Port ( CLOCK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           PAUSE : in STD_LOGIC;
           DIRECTION : in STD_LOGIC;
           OUTPUT : out STD_LOGIC_VECTOR (7 downto 0));
end component GRAY_COUNTER;

component RING_COUNTER is
    Port ( CLOCK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           PAUSE : in STD_LOGIC;
           DIRECTION : in STD_LOGIC;
           OUTPUT : out STD_LOGIC_VECTOR (7 downto 0));
end component RING_COUNTER;

component JOHNSON_COUNTER is
    Port ( CLOCK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           PAUSE : in STD_LOGIC;
           DIRECTION : in STD_LOGIC;
           OUTPUT : out STD_LOGIC_VECTOR (7 downto 0));
end component JOHNSON_COUNTER;

component FIBONACCI_COUNTER is
    Port ( CLOCK : in STD_LOGIC;
           RESET : in STD_LOGIC;
           PAUSE : in STD_LOGIC;
           OUTPUT : out STD_LOGIC_VECTOR (7 downto 0));
end component FIBONACCI_COUNTER;

component MUX is
    Port ( INPUT_0 : in STD_LOGIC_VECTOR (7 downto 0);
           INPUT_1 : in STD_LOGIC_VECTOR (7 downto 0);
           INPUT_2 : in STD_LOGIC_VECTOR (7 downto 0);
           INPUT_3 : in STD_LOGIC_VECTOR (7 downto 0);
           INPUT_4 : in STD_LOGIC_VECTOR (7 downto 0);
           INPUT_5 : in STD_LOGIC_VECTOR (7 downto 0);
           CONTROL : in STD_LOGIC_VECTOR (2 downto 0);
           MUX_OUT : out STD_LOGIC_VECTOR (7 downto 0));
end component MUX;

signal INTERNAL_CLOCK: STD_LOGIC;
signal BINARY_MUX, BCD_MUX, GRAY_MUX, RING_MUX, JOHNSON_MUX, FIBONACCI_MUX : STD_LOGIC_VECTOR (7 downto 0);

begin
SLOWDOWN_CLOCK: SLOWDOWN_COUNTER port map (CLOCK=> CLOCK, RESET=>RESET, SLOW_CLOCK=>INTERNAL_CLOCK);
BINARY: BINARY_COUNTER port map (CLOCK=>INTERNAL_CLOCK, RESET=>RESET, PAUSE=>PAUSE, DIRECTION=>DIRECTION, OUTPUT=>BINARY_MUX);
BCD: BCD_COUNTER port map (CLOCK=>INTERNAL_CLOCK, RESET=>RESET, PAUSE=>PAUSE, DIRECTION=>DIRECTION, OUTPUT=>BCD_MUX);
GRAY: GRAY_COUNTER port map (CLOCK=>INTERNAL_CLOCK, RESET=>RESET, PAUSE=>PAUSE, DIRECTION=>DIRECTION, OUTPUT=>GRAY_MUX);
RING: RING_COUNTER port map (CLOCK=>INTERNAL_CLOCK, RESET=>RESET, PAUSE=>PAUSE, DIRECTION=>DIRECTION, OUTPUT=>RING_MUX);
JOHNSON: JOHNSON_COUNTER port map (CLOCK=>INTERNAL_CLOCK, RESET=>RESET, PAUSE=>PAUSE, DIRECTION=>DIRECTION, OUTPUT=>JOHNSON_MUX);
FIBONACCI: FIBONACCI_COUNTER port map (CLOCK=>INTERNAL_CLOCK, RESET=>RESET, PAUSE=>PAUSE, OUTPUT=>FIBONACCI_MUX);
MULTIPLEXER: MUX port map (INPUT_0=>BINARY_MUX, INPUT_1=>BCD_MUX, INPUT_2=>GRAY_MUX, INPUT_3=>RING_MUX, INPUT_4=>JOHNSON_MUX, INPUT_5=>FIBONACCI_MUX, CONTROL=>CONTROL, MUX_OUT=>OUTPUT); 
end Behavioral;
