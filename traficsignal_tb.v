`timescale 1s / 1s
module traficsignal_tb;
reg [3:0] T;
reg rst,clk;
wire [2:0] RYG1,RYG2,RYG3,RYG4;
traficsignal A1 (RYG1,RYG2,RYG3,RYG4,T,rst,clk);
initial begin
        clk = 1'b0;
        rst = 1'b0;
end
always #5 clk = ~clk;
initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0,traficsignal_tb);
        $monitor("at time %t : clk = %b | rst = %b | T = %b | RYG1 = %b | RYG2 = %b | RYG3 = %b | RYG4 = %b",$time,clk,rst,T,RYG1,RYG2,RYG3,RYG4);
                rst = 1'b1 ; #10;
                rst = 1'b0 ; T = 4'b1 ; #10;
                T = 4'b0 ; #10;
                T = 4'b0010 ; #10;
                T = 4'b0100 ; #10;
                T = 4'b1000 ; #10;
        $finish;
end
endmodule