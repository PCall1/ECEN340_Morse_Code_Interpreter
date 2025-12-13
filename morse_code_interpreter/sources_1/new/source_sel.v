`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2025 10:20:51 AM
// Design Name: 
// Module Name: source_sel
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module source_sel(
    input b,
    input ext_b,
    input clk,
    input ext_rst,
    
    output rst,
    output d_out,
    output led
    );
    

    wire src_sw_rst;
    reg source_talking;
    reg source_talking_d1;
    
    assign rst = ext_rst || (source_talking ^ source_talking_d1);
    
    assign d_out_raw = b || ext_b;
    assign led = source_talking;
    
    reg [4:0] d_out_shift;
    
    always @(posedge ext_rst or posedge clk) begin
        if (ext_rst) begin
            source_talking <= 0;
        end
        else begin
            if (ext_b) begin
                source_talking <= 0;
            end
            else if (b) begin
                source_talking <= 1;
            end
        
            d_out_shift <= {d_out_shift[3:0], d_out_raw};
            source_talking_d1 <= source_talking;
        end

        
        
    end
    
    assign d_out = d_out_shift[4];
    
endmodule




