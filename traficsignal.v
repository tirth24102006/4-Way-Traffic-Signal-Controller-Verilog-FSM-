module traficsignal(RYG1,RYG2,RYG3,RYG4,T,rst,clk);
input rst,clk;
input [3:0] T;
output reg [2:0] RYG1,RYG2,RYG3,RYG4;
always @ (posedge clk) begin
        if (rst) begin
                RYG1 <= 3'b010;
                RYG2 <= 3'b010;
                RYG3 <= 3'b010;
                RYG4 <= 3'b010;
        end else begin
                if (T == 4'b0000) begin
                        RYG1 <= 3'b010;
                        RYG2 <= 3'b010;
                        RYG3 <= 3'b010;
                        RYG4 <= 3'b010; 
                end else begin
                        if (T[0] == 1'b1) begin
                                RYG1 <= 3'b001;
                                RYG2 <= 3'b100;
                                RYG3 <= 3'b100;
                                RYG4 <= 3'b100; 
                        end else if (T[1] == 1'b1) begin
                                RYG1 <= 3'b100;
                                RYG2 <= 3'b001;
                                RYG3 <= 3'b100;
                                RYG4 <= 3'b100; 
                        end else if (T[2] == 1'b1) begin
                                RYG1 <= 3'b100;
                                RYG2 <= 3'b100;
                                RYG3 <= 3'b001;
                                RYG4 <= 3'b100; 
                        end else if (T[3] == 1'b1) begin
                                RYG1 <= 3'b100;
                                RYG2 <= 3'b100;
                                RYG3 <= 3'b100;
                                RYG4 <= 3'b001; 
                        end else begin
                                RYG1 <= RYG1;
                                RYG2 <= RYG2;
                                RYG3 <= RYG3;
                                RYG4 <= RYG4; 
                        end
                end         
        end     
end
endmodule