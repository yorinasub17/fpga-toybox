# fpga-toybox
A collection of toy projects for learning FPGA programming.

## Target hardware

All projects are implemented to target [Basys 3 by
Digilent](https://digilent.com/reference/programmable-logic/basys-3/start), using Vivado Design Suite 2024.2.

## Projects

- `hello-world-vhdl`: A hello world FPGA project that simply hooks up the 5 buttons on the Basys 3 to 5 LEDs.
- `programming-led-vhdl`: FSM circuit that implements a toggled LED, where pressing the center button on the Basys 3
  board toggles the LED. Utilizes two flip flops to buffer the input so that it doesn't rapidly toggle the LED state
  while the button is held.
