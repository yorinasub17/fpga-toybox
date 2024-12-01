timeunit 1ns;
timeprecision 1ps;

module toggleled_tb();

  logic clk;
  logic sw_0;
  logic btnC;
  logic led_0;

  toggleled dut(clk, sw_0, btnC, led_0);

  always
    begin
      clk = 1; #5;
      clk = 0; #5;
    end

  initial begin
    sw_0 = 0; btnC = 0; #10;
    sw_0 = 1; #10;
    sw_0 = 0; #10;
    btnC = 1; #20;
    btnC = 0; #20;
    btnC = 1; #20;
    btnC = 0; #20;
    btnC = 1; #20;
    btnC = 0; #20;
    #10;
    $finish;
  end 
endmodule
