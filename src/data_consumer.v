module data_consumer # (parameter DW=128)
(
    input           clk, resetn,

    input[DW-1:0]   axis_rx1_tdata,
    input[DW/8-1:0] axis_rx1_tkeep,
    input           axis_rx1_tlast,
    input           axis_rx1_tvalid,
    output reg      axis_rx1_tready,

    input[DW-1:0]   axis_rx2_tdata,
    input[DW/8-1:0] axis_rx2_tkeep,
    input           axis_rx2_tlast,
    input           axis_rx2_tvalid,
    output reg      axis_rx2_tready

    );

always @(posedge clk) begin
    axis_rx1_tready <= 1;
    axis_rx2_tready <= 1;
end

endmodule
