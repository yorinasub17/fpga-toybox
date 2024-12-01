timeunit 1ns;
timeprecision 1ps;

module toggleled_tb();

  logic clk;
  logic sw_0;
  logic btnC;
  logic led_0;

  debounced_toggleled dut(clk, sw_0, btnC, led_0);

  always
    begin
      clk = 1; #5;
      clk = 0; #5;
    end

  initial begin
    sw_0 = 0; btnC = 0; #10;
    sw_0 = 1; #10;
    sw_0 = 0; #10;
    assert (led_0 == 0) $display("led reset check passed");
    else
      $error("led did not reset on reset switch");

    // Should not update because not enough time passed
    btnC = 1; #20;
    btnC = 0; #20;
    assert (led_0 == 0) $display("led toggle on bouncy rejected");
    else
      $error("led toggled on bouncy button press");

    // Now keep on enough time, 20ms
    btnC = 1; #20_000_000;
    btnC = 0; #20_000_000;
    assert (led_0 == 1) $display("led toggle on check passed");
    else
      $error("led did not toggle on button press");

    btnC = 1; #20_000_000;
    btnC = 0; #20_000_000;
    assert (led_0 == 0) $display("led toggle off check passed");
    else
      $error("led did not toggle off button press");

    $finish;
  end
endmodule
