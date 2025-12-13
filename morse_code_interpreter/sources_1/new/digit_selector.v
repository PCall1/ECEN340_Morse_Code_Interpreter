`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 10:34:42 AM
// Design Name: 
// Module Name: digital_selector
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


module digit_selector(
    input clk,
    input rst,
    output reg [3:0] digit_sel
    );
    
    always @(posedge clk or posedge rst)
    begin
        if (rst) begin
            digit_sel = 4'b1110;
        end
        else begin
            case (digit_sel)
            4'b1110: digit_sel = 4'b1101;
            4'b1101: digit_sel = 4'b1011;
            4'b1011: digit_sel = 4'b0111;
            4'b0111: digit_sel = 4'b1110;
            default: digit_sel = 4'b1110;
            endcase
        end
    end
endmodule
