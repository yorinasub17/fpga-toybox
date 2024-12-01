library ieee;
use ieee.std_logic_1164.all;

entity debounced_toggleled is
  port (
    clk   : in std_logic;
    sw_0  : in std_logic;
    btnC  : in std_logic;
    led_0 : out std_logic);
end entity debounced_toggleled;

architecture main of debounced_toggleled is
  signal debounced_btn : std_logic;
begin
  debounced : entity work.debounce_filter
    generic map(
      DEBOUNCE_LIMIT => 1000000)
    port map(
      clk => clk,
      bouncy => btnC,
      debounced => debounced_btn);

  toggleled : entity work.toggleled
    port map(
      clk => clk,
      sw_0 => sw_0,
      btnc => debounced_btn,
      led_0 => led_0);
end architecture main;
