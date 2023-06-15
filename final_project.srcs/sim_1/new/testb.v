`timescale 1ns/1ns

module testbench;
reg clk;
reg [3:0]btn;
wire [3:0]ledd;
wire[11:0] ar;


led_shift  test(.clk(clk),.btn(btn),.led(ledd),.ar(ar));

 initial
 begin
  clk= 1;	           // Time = 0

 end
 always 
 begin
	#25  clk= ~clk;
 end

 initial
 begin

   #250;		              // Time = 125
$finish;
 end

 endmodule