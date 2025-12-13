`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 10:32:25 AM
// Design Name: 
// Module Name: clk_gen
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


module clock_display_refresh(
    input clk,
    input rst,
    output clk_div
    );
    reg [25:0] count;
    
    always @(posedge clk or posedge rst)
    begin
        if (rst) begin
            count <= 0;
        end
        else begin
            count <= count +1;
        end
    end
    
    assign clk_div = count[18];//divide the clock by 2^26. The 25th bit is the result of the divition
    
endmodule