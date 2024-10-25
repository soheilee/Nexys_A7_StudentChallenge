//=============================================================================
//               ------->  Revision History  <------
//=============================================================================
//
//   Date     Who   Ver  Changes
//=============================================================================
// 23-Jul-24  SM     1  Initial creation
//=============================================================================

/*
    This module reads in an arbitrary data stream, based the one packet length,
    it switches the outputs into axis_out1 and axis_out2. 
    
*/
module data_switch# (
    parameter DW=128
    )
(
    input                      clk, resetn,
    input [31:0]               packet_size,
    input [31:0]               pp_group,
    input [31:0]               frame_size,
    output reg [15:0]          counter_tlast1,
    output reg [15:0]          counter_tlast2,
    output reg [15:0]          counter_ps,  //Counter for the path switch

    // The input stream
    input[DW-1:0]              axis_in_tdata,
    input                      axis_in_tvalid,
    output                     axis_in_tready,

    // Our output stream #1
    output  reg   [DW-1:0]     axis_out1_tdata,
    output  reg                axis_out1_tvalid,
    output  reg                axis_out1_tlast,
    input                      axis_out1_tready,

    // Our output stream #2
    output  reg   [DW-1:0]     axis_out2_tdata,
    output  reg                axis_out2_tvalid,
    output  reg                axis_out2_tlast,
    input                      axis_out2_tready



);

// The system is always ready to receive packages if not in reset
assign axis_in_tready = (resetn == 1);

// State machine defining when the output should be redirected to each one of the outputs.
// This is defined based on the packet length parameter.
reg output_path;
localparam FSM_OUTPUT_AXIS1 = 1;
localparam FSM_OUTPUT_AXIS2  = 0;
localparam FSM_PINGPONG_STATE = 0;
wire [31:0] frame_per_output;
wire [31:0] packet_per_output;
wire [31:0] tlast_enable_threshold;
assign frame_per_output = FRAME_SIZE/PACKET_SIZE;
assign packet_per_output = PP_GROUP*PACKET_SIZE;
assign tlast_enable_threshold = frame_per_output - packet_per_output;

always @(posedge clk) begin
    if (resetn == 0) begin
        counter_ps <=0;
    end
    else begin
        if(counter_ps==(packet_per_output-1)) begin
                counter_ps <=0;
                output_path <= ~output_path;
                if(output_path==0) begin
                    if(counter_tlast1 == frame_per_output)
                        counter_tlast1 <= 0;
                    else
                        counter_tlast1 <= counter_tlast1 +packet_per_output;
                end
                else begin
                    if(counter_tlast2 == frame_per_output)
                        counter_tlast2 <= 0;
                    else
                        counter_tlast2 <= counter_tlast2 +packet_per_output;
                end
                
            end
        else begin
            counter_ps <= counter_ps +1;
            
        end
    end
end

// The output is set to each output for the packet length defined by the parameters

always @* begin
    axis_out1_tdata  = 0;
    axis_out1_tvalid = 0;
    axis_out1_tlast  = 0;
    axis_out2_tdata  = 0;
    axis_out2_tvalid = 0;
    axis_out2_tlast  = 0;

    if(output_path) begin 
        axis_out1_tdata  = axis_in_tdata;
        axis_out1_tvalid = axis_in_tvalid;  
        if(counter_tlast1 > tlast_enable_threshold && counter_ps > packet_per_output-2) 
            axis_out1_tlast  = 1;
    end
    else begin
        axis_out2_tdata  = axis_in_tdata;
        axis_out2_tvalid = axis_in_tvalid;
        if(counter_tlast2 > tlast_enable_threshold && counter_ps > packet_per_output-2) 
            axis_out2_tlast  = 1;
    end
end

endmodule