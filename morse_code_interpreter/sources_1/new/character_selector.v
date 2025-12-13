`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 10:56:50 AM
// Design Name: 
// Module Name: hex_num_gen
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

//selects the character to be outputed to the display and shifts new characters in
module character_selector(
    input [3:0] digit_sel,//input to select which digit is going to be outputed
    input [4:0] char_num,//input character to replace char_number[0]
    input shift,//shift the outputs on the posedge of shift
    input rst,//reset to reset all digits to off.
    output reg [4:0] char_num_output//character that is selected and send the the display.
    );
    
    reg [19:0] digits;
    
    always @(posedge rst or negedge shift) begin
        if (rst) begin
            digits = 0;
        end else if (!shift) begin
            digits <= {digits[14:0], char_num};
        end
    end
    
    always @(*)
    begin
    case (digit_sel)
        4'b1110: char_num_output <= digits[4:0];
        4'b1101: char_num_output <= digits[9:5];
        4'b1011: char_num_output <= digits[14:10];
        4'b0111: char_num_output <= digits[19:15];
        default: char_num_output <= digits[4:0];
        endcase
    end
    
    
    
endmodule