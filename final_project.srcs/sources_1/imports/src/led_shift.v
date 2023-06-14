//do not modify this module
module led_shift(
    input   clk   ,
    input   [3:0] btn   ,
    output [3:0] led
    );
    reg direction=0, temp=0, aaah=0;
    wire    clk_div ;
    
    shifter s0(
    .clk    (clk_div),
	.rst	(0),
    .flag   (direction),
    .out    (led),
    .stop   (aaah)
    );
    
    clk_div clk_div_0(
    .clk    (clk),
    .rst    (rst),
    .clk_div    (clk_div)
    );
    
    
    always @(btn)begin
        if(btn==4'b0010)begin
            direction=~direction;
        end
    end
endmodule
