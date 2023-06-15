`timescale 1ns/1ns

module testbench;
reg clk;
reg [3:0]btn;
wire [3:0] led;
wire [11:0] ar;
reg [6:0] a,b,c,d;

blackjack  test(.num3(a),.num2(b),.num1(c),.num0(d),.clk(clk),.btn(btn),.led(led),.ar(ar));

 initial
 begin
  clk= 1;	           // Time = 0
   a=3;b=2;c=1;d=0;
   #250
   a=1;b=0;c=1;d=0;
   #250
$finish;
 end
 always 
 begin
	#25  clk= ~clk;
 end

 endmodule