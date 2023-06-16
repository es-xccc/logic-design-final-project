`timescale 1ns/1ns
module blackjack( input clk, input [3:0] btn, output reg [3:0] led, output reg [11:0] ar);
    reg [6:0]num3,num2,num1,num0;
    reg [4:0]rand;
    parameter min=4'b0001;
    parameter max=4'b1010;
    parameter boom=5'b10101;
 
    always @(posedge clk) begin
        rand <= rand % 5'd10 +5'd1;
    end

    reg [4:0] point_1=5'b00;
    reg [4:0] point_2=5'b00;
    reg state=3'b00; //000:P1,P2(o);  001:P1,P2(x),  010:P2,P1(o);  011:P2,P1(x);  100:finish
  
    always @(*) begin
        case(state)
            3'b000: begin
                if(btn[0]) begin 
                    point_1=point_1+rand;
                    num3 = point_1 - point_1 % 5'd10;
                    num2 = point_1 % 5'd10;
                    
                    if(point_1<=boom) begin  
                        state=3'b010;
                    end
                    else begin
                        state=3'b100;
                    end
                end
                else if(btn[1]) begin state=3'b011; end
            end
            
             3'b001: begin
                if(btn[0]) begin 
                    point_1=point_1+rand;
                    if(point_1<=boom) begin  
                        state=3'b010;
                    end
                    else begin
                        state=3'b100;
                    end
                end
                else if(btn[1]) begin state=3'b100; end
            end
            
            3'b010: begin
                if(btn[2]) begin 
                    point_2=point_2+rand;
                    num1 = point_1 - point_1 % 5'd10;
                    num0 = point_1 % 5'd10;
                    if(point_2<=boom) begin  
                        state=3'b000;
                    end
                    else begin
                        state=3'b100;
                    end
                end
                else if(btn[3]) begin state=3'b001; end
            end
            
            3'b011: begin
                if(btn[2]) begin 
                    num1 = point_1 - point_1 % 5'd10;
                    num0 = point_1 % 5'd10;
                    if(point_2<=boom) begin  
                        state=3'b000;
                    end
                    else begin
                        state=3'b100;
                    end
                end
                else if(btn[3]) begin state=3'b100; end
            end
        endcase
        end
        
        
        always @(state) begin
             if (state == 3'b100) begin
                 if (point_1 > point_2 && point_1<=boom) begin
                    led[3] = 1;
                 end
                 else if (point_1 < point_2 &&point_2<=boom) begin
                    led[1] = 1;
                 end
                 else begin
                    led[3] = 1;
                    led[1] = 1;
                 end
             end
        end

        reg [3:0] cou=4'd0;
        always @(posedge clk) begin
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
                            ar<=12'b100001001101;
                        7'd6:
                            ar<=12'b110001000100;
                        7'd7:
                            ar<=12'b111000010111;
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
                            ar<=12'b000101001001;
                        7'd6:
                            ar<=12'b010101000000;
                        7'd7:
                            ar<=12'b011100010011;
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
                            ar<=12'b000011001101;
                        7'd6:
                            ar<=12'b010011000100;
                        7'd7:
                            ar<=12'b011010010111;
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
                            ar<=12'b000001101101;
                        7'd6:
                            ar<=12'b010001100100;
                        7'd7:
                            ar<=12'b011000110111;
                        7'd8:
                            ar<=12'b000000100100;
                        7'd9:
                            ar<=12'b000000100111;
                    endcase
                end
            endcase
        end

 endmodule