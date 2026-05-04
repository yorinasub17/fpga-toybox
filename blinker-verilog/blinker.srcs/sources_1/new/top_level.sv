// Author: Yoriyasu Yano
//
// Top level entity of LED blinker.
// - Blinks all LEDs on the board at a selected rate.
// - Supports 4 hard coded blink rates, selected by a 2 switch sequence on the Basys 3 board.
// - Selected blink rate is displayed on 7-segment display, in clock cycles per blink (NOT Hz).
// - Assumes 100MHz clock rate.
// - BTNC is used as a global asynchronous reset for the circuit.

module top_level(input  logic       CLK,
                 input  logic       BTNC,
                 input  logic[15:0] SW,
                 output logic[15:0] LED,
                 output logic[6:0]  SEG,
                 output logic[3:0]  AN);

  assign LED = SW;

endmodule
