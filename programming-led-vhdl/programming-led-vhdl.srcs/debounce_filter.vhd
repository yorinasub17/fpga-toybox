library ieee;
use ieee.std_logic_1164.all;

entity debounce_filter is
  -- DEBOUNCE_LIMIT should be set to target bounce time / clock period
  -- E.g., if target time is 10ms and period is 40ns, then DEBOUNCE_LIMIT = 10_000_000 / 40 = 250_000
  generic (DEBOUNCE_LIMIT : integer := 20);
  port (
    clk       : in std_logic;
    bouncy    : in std_logic;
    debounced : out std_logic);
end entity debounce_filter;

architecture main of debounce_filter is
  signal count : integer range 0 to DEBOUNCE_LIMIT := 0;
  signal state : std_logic := '0';
begin
  process (clk) begin
    if rising_edge(clk) then
      if (bouncy /= state and count < DEBOUNCE_LIMIT-1) then
        count <= count+1;
      elsif count = DEBOUNCE_LIMIT-1 then
        state <= bouncy;
        count <= 0;
      else
        count <= 0;
      end if;
    end if;
  end process;

  debounced <= state;
end architecture main;
