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




module clk_1khz(
    input clk,
    input rst,
    output reg clock_1khz_output = 0
    );
    reg [19:0] clock_counter;
    //setup clock divider
    always @(posedge clk or posedge rst)
    begin
        if (rst) begin
            clock_counter <= 0;
            clock_1khz_output <= 0;
        end
        else begin
            clock_counter <= clock_counter +1;
            if (clock_counter == 50000) begin//divided by 100000 so 50000 high and low time to get a 1khz output
                clock_counter <= 0;
                clock_1khz_output = ~clock_1khz_output;
            end
        end
    end
    
endmodule