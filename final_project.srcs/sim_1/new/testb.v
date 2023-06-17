`timescale 1ns/1ns

module testbench;
reg clk=0;
reg [3:0]btn=4'b0000;
wire [3:0] led;
wire [11:0] ar;

blackjack  test(.clk(clk),.sw(sw),.btn(btn),.led(led),.ar(ar));

 initial
 begin         // Time = 0
#20
  btn= 4'd8;
#20;
  btn= 4'd2;
#20;
  btn= 4'd4;
#20;
  btn= 4'd1;
#20;
  btn= 4'd0;
#20;
  btn= 4'd8;
#20;
  btn= 4'd2;
#20;
  btn= 4'd8;
#20;
  btn= 4'd2;
#20;
  btn= 4'd8;
#20;
  btn= 4'd2;
#20;
  btn= 4'd8;
#20;
  btn= 4'd2;
#20;
  btn= 4'd8;
#20;
  btn= 4'd2;
#20;
  btn= 4'd4;
#20;
  btn= 4'd1;
#20;
  btn= 4'd0;
#20;
  btn= 4'd0;
#20;
  btn= 4'd4;
#20;
  btn= 4'd1;
#20;
  btn= 4'd8;
#20;
  btn= 4'd1;
#20;
  btn= 4'd8;
#20;
  btn= 4'd2;
#20;
  btn= 4'd0;
#80;
$finish;
 end
 always 
 begin
	#8  clk= ~clk;
 end

 endmodule