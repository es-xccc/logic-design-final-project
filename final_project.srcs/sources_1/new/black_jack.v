`timescale 1ns/1ns
module blackjack( input clk,  input [3:0] btn, output reg [3:0] led=4'b0000, output reg [11:0] ar);
    reg rst=0;
    wire clk_div;
    clk_div clk_div_0(
    .clk    (clk),
    .rst    (rst),
    .clk_div    (clk_div)
    );
    reg [6:0]num3=0,num2=0,num1=0,num0=0;
    reg [6:0]rand;
    parameter boom=7'b0010101;

    reg [6:0] point_1=7'b0000000;
    reg [6:0] point_2=7'b0000000;
    reg state=3'b00; //000:P1,P2(o);  001:P1,P2(x),  010:P2,P1(o);  011:P2,P1(x);  100:finish
    reg [6:0] p10=0, p11=0, p20=0, p21=0;
    always @(posedge clk_div)begin
                    rand <= rand % 7'd10 + 7'd1;
                    if(point_1 > boom)begin
                            led[1]=1;
                            led[0]=1;
                    end
                    if(point_2 > boom)begin
                            led[3]=1;
                            led[2]=1;
                    end
                    if(p10 && p20)begin
                            if(point_1 > point_2)begin
                                    led[3]=1;
                                    led[2]=1;
                            end
                            else if(point_1 < point_2)begin
                                    led[1]=1;
                                    led[0]=1;
                            end
                            else begin
                                    led[3]=1;
                                    led[2]=1;
                                    led[1]=1;
                                    led[0]=1;
                            end
                    end
                            
    end
    always @(posedge btn[3],posedge btn[2],posedge btn[1],posedge btn[0]) begin
            if(btn[3])begin
                    point_1 = point_1 + rand;
                    num3 = (point_1 - point_1 % 7'd10) / 7'd10;
                    num2 = point_1 % 7'd10;
                    p10 = 0;
            end
            else if(btn[2])begin
                    p10 = 1;
                    end
             else if(btn[1])begin
             point_2 = point_2 + rand;
                    num1 = (point_2 - point_2 % 7'd10) / 7'd10;
                    num0 = point_2 % 7'd10;
                    p20 = 1;
                    end
            else if(btn[0])begin
            p20 = 1;
            end
            end
    /*always @(posedge btn[3]) begin
                    point_1 = point_1 + rand;
                    num3 = (point_1 - point_1 % 7'd10) / 7'd10;
                    num2 = point_1 % 7'd10;
                    p10 = p10 + 7'd1;
    end
    always @(posedge btn[2]) begin
                    p11 = p11 + 7'd1;
    end
    always @(posedge btn[1]) begin
                    point_2 = point_2 + rand;
                    num1 = (point_2 - point_2 % 7'd10) / 7'd10;
                    num0 = point_2 % 7'd10;
                    p20 = p20 + 7'd1;
    end
    always @(posedge btn[0]) begin
                    p21 = p21 + 7'd1;
    end
*/
        reg [3:0] cou=4'd0;
        always @(posedge clk_div) begin
            case(cou)
                4'd0:begin
                    cou <= (cou + (4'd1)) % (4'd4);
                    case(num3)
                        7'd0:
                            ar<=12'b100000010100;
                        7'd1:
                            ar<=12'b111000010111;
                        7'd2:
                            ar<=12'b101000001100;
                        7'd3:
                            ar<=12'b101000000101;
                        7'd4:
                            ar<=12'b110000000111;
                        7'd5:
                            ar<=12'b100001000101;
                        7'd6:
                            ar<=12'b110001000100;
                        7'd7:
                            ar<=12'b101000010111;
                        7'd8:
                            ar<=12'b100000000100;
                        7'd9:
                            ar<=12'b100000000111;
                    endcase
                    end
                4'd1:begin
                    cou <= (cou + (4'd1)) % (4'd4);
                    case(num2)
                        7'd0:
                            ar<=12'b000100010000;
                        7'd1:
                            ar<=12'b011100010011;
                        7'd2:
                            ar<=12'b001100001000;
                        7'd3:
                            ar<=12'b001100000001;
                        7'd4:
                            ar<=12'b010100000011;
                        7'd5:
                            ar<=12'b000101000001;
                        7'd6:
                            ar<=12'b010101000000;
                        7'd7:
                            ar<=12'b001100010011;
                        7'd8:
                            ar<=12'b000100000000;
                        7'd9:
                            ar<=12'b000100000011;
                    endcase
                end
                    
                4'd2:begin
                    cou <= (cou + (4'd1)) % (4'd4);
                    case(num1)
                        7'd0:
                            ar<=12'b000010010100;
                        7'd1:
                            ar<=12'b011010010111;
                        7'd2:
                            ar<=12'b001010001100;
                        7'd3:
                            ar<=12'b001010000101;
                        7'd4:
                            ar<=12'b010010000111;
                        7'd5:
                            ar<=12'b000011000101;
                        7'd6:
                            ar<=12'b010011000100;
                        7'd7:
                            ar<=12'b001010010111;
                        7'd8:
                            ar<=12'b000010000100;
                        7'd9:
                            ar<=12'b000010000111;
                    endcase
                end
                4'd3:begin
                    cou <= (cou + (4'd1)) % (4'd4);
                    case(num0)
                        7'd0:
                            ar<=12'b000000110100;
                        7'd1:
                            ar<=12'b011000110111;
                        7'd2:
                            ar<=12'b001000101100;
                        7'd3:
                            ar<=12'b001000100101;
                        7'd4:
                            ar<=12'b010000100111;
                        7'd5:
                            ar<=12'b000001100101;
                        7'd6:
                            ar<=12'b010001100100;
                        7'd7:
                            ar<=12'b001000110111;
                        7'd8:
                            ar<=12'b000000100100;
                        7'd9:
                            ar<=12'b000000100111;
                    endcase
                end
            endcase
        end

 endmodule