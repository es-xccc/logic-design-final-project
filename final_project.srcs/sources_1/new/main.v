module main(btn, led);
input [3:0] btn;
output [3:0] led;
reg num [3:0];


clk_div clk_div_0(.clk(clk), .rst(rst), .clk_div(clk_div));
endmodule
