library ieee;
use ieee.std_logic_1164.all;

entity toggleled is
  port (
    clk   : in std_logic;
    sw_0  : in std_logic;
    btnC  : in std_logic;
    led_0 : out std_logic);
end entity toggleled;

architecture main of toggleled is
  signal state, nextstate, statebuf: std_logic;
begin
  -- FSM registers
  process(clk, sw_0) begin
    if sw_0 = '1' then statebuf <= '0';
    elsif rising_edge(clk) then
      if btnC = '0' then
        statebuf <= state;
      end if;
    end if;
  end process;

  process(clk, sw_0) begin
    if sw_0 = '1' then state <= '0';
    elsif rising_edge(clk) then
      if btnC = '1' then
        state <= nextstate;
      end if;
    end if;
  end process;

  -- next state logic
  nextstate <= statebuf xor btnC;

  -- output logic
  led_0 <= statebuf;
end architecture main;
