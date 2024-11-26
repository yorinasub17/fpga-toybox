library ieee;
use ieee.std_logic_1164.all;

entity switch_to_led is
  port (
    btnU : in std_logic;
    btnR : in std_logic;
    btnD : in std_logic;
    btnL : in std_logic;
    btnC : in std_logic;
    led_0 : out std_logic;
    led_1 : out std_logic;
    led_2 : out std_logic;
    led_3 : out std_logic;
    led_4 : out std_logic);
end entity switch_to_led;

architecture RTL of switch_to_led is
begin
  led_0 <= btnU;
  led_1 <= btnR;
  led_2 <= btnD;
  led_3 <= btnL;
  led_4 <= btnC;
end architecture RTL;
