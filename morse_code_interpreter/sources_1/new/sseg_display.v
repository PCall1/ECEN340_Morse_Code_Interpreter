`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2025 10:00:17 AM
// Design Name: 
// Module Name: 7 seg display
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


module sseg_display(
    output reg [6:0] seg,
    //output [3:0] an,//not used
    output dp,
    input [4:0] char_num
    );
    always @(char_num) begin
        case (char_num)
            5'd0: seg = 7'b1111111; //print a space
            5'd1:  seg = 7'b0001000; // A (A,B,C,E,F,G)
            5'd2:  seg = 7'b0000011; // B (Note: Identical to '8')
            5'd3:  seg = 7'b1000110; // C (A,D,E,F)
            5'd4:  seg = 7'b0100001; // D (Note: Identical to '0')
            5'd5:  seg = 7'b0000110; // E (A,D,E,F,G)
            5'd6:  seg = 7'b0001110; // F (A,E,F,G)
            5'd7:  seg = 7'b0010000; // G (Note: Identical to '5')
            5'd8:  seg = 7'b0001011; // H (B,C,E,F,G)
            5'd9:  seg = 7'b1001111; // I (E,F)
            5'd10:  seg = 7'b1100001; // J (B,C,D,E)
            5'd11: seg = 7'b0001010; // K (C,E,F,G)
            5'd12: seg = 7'b1000111; // L (D,E,F)
            5'd13: seg = 7'b0101010; // M (A,B,E,F)
            5'd14: seg = 7'b0101011; // N (A,B,C,E,F) (Note: Visually similar to '0'/D/O)
            5'd15: seg = 7'b0100011; // O (Note: Identical to '0' and 'D')
            5'd16: seg = 7'b0001100; // P (A,B,E,F,G)
            5'd17: seg = 7'b0011000; // Q (A,B,C,F,G)
            5'd18: seg = 7'b0101111; // R (E,G) (lowercase 'r')
            5'd19: seg = 7'b0010010; // S (Note: Identical to '5' and 'G')
            5'd20: seg = 7'b0000111; // T (D,E,F,G) (lowercase 't')
            5'd21: seg = 7'b1100011; // U (C,D,E) (lowercase 'u')
            5'd22: seg = 7'b1010101; // V (C,D,E) (Note: 'u' with bottom segment, 'v')
            5'd23: seg = 7'b0010101; // W (Note: Identical to 'J')
            5'd24: seg = 7'b1101011; // X (Note: Identical to 'H')
            5'd25: seg = 7'b0010001; // Y (B,C,D,F,G)
            5'd26: seg = 7'b0100100; // Z (Note: Identical to '2')
    
            // Default: All segments OFF
            default: seg = 7'b1111111;
        endcase
    end
endmodule
