module task2_sync_ram (
    input  wire        clk,
    input  wire        rst,
    input  wire        we,
    input  wire [3:0]  addr,
    input  wire [7:0]  din,
    output reg  [7:0]  dout
);
    reg [7:0] mem [0:15];
    integer i;
    always @(posedge clk) begin
        if (rst) begin
            for (i=0; i<16; i=i+1) mem[i] <= 8'h00;
            dout <= 8'h00;
        end else begin
            if (we)
                mem[addr] <= din;
            dout <= mem[addr];
        end
    end
endmodule
