module meta_data # (parameter DW=128)
(
    input   clk, resetn,

    output   reg  [DW-1:0]    axis_meta1_tdata,
    output   reg              axis_meta1_tvalid,
    input                     axis_meta1_tready,

    // Our output stream
    output   reg  [DW-1:0]    axis_meta2_tdata,
    output   reg              axis_meta2_tvalid,
    input                     axis_meta2_tready
);


always @(posedge clk) begin
    if (resetn == 0) begin
        axis_meta1_tvalid <= 0;
        axis_meta2_tvalid <= 0;
    end
    axis_meta1_tvalid <= 1;
    axis_meta1_tdata <= 1638;

    axis_meta2_tvalid <= 1;
    axis_meta2_tdata <= 1638;

end

endmodule

