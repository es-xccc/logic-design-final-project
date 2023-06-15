//do not modify this module
module led_shift(
    input   clk   ,
    input   [3:0] btn   ,
    output [3:0] led,
    output [11:0] ar
    );
    reg direction=0, temp=0, aaah=0,current;
    reg [3:0] num=4'b0110;
    reg[1:0] sel=2'b00;
    wire    clk_div ,arr;
    parameter m1=2'b00,m2=2'b01,m3=2'b10,m4=2'b11;
    display display1(.clk(clk),.sel(sel),.num(num),.ar( arr));
    assign  ar=arr;
    always@(posedge clk)begin
    case(sel)
    m1:sel<=m2;
     m2:sel<=m3;
      m3:sel<=m4;
       m4:sel<=m1;
    endcase
    end
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
