
module shifter(
input clk,rst,flag,stop,
output reg [3:0]out
);


always @(posedge clk) begin
    if (stop) begin
    end
    else if (rst) begin
        out = 4'b0000;
    end
    else begin
        if (flag) begin
            if (out == 4'b0000) begin
                out = 4'b0001;
            end 
            else begin
                out = (out<< 1);
            end
        end
        else begin
            if (out == 4'b0000) begin
                out = 4'b1000;
            end
            else begin
                out = (out >> 1);
            end
        end
    end
end



endmodule