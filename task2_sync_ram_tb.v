`timescale 1ns/1ps
module tb_task2_sync_ram;
    reg clk, rst, we;
    reg [3:0] addr;
    reg [7:0] din;
    wire [7:0] dout;

    task2_sync_ram uut (.clk(clk), .rst(rst), .we(we), .addr(addr), .din(din), .dout(dout));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1; we = 0; addr = 4'd0; din = 8'h00; #12;
        rst = 0; #8;
        we = 1; addr = 4'd0; din = 8'hAA; #10;
        addr = 4'd1; din = 8'hBB; #10;
        we = 0; addr = 4'd0; #10;
        addr = 4'd1; #10;
        $stop;
    end
endmodule
