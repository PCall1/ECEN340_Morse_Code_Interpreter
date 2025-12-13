`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2025 05:50:01 PM
// Design Name: 
// Module Name: translate_morse_tb
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


module translate_morse_tb(

    );
    
    /*
    input clk,
    input rst,
    input [1:0] pulse_event,
    output reg [4:0] letter,
    output reg shift
    
    */
    
    parameter period = 10;
    reg clk = 0; 
    reg rst = 0;
    reg [2:0] pulse_event = 0;
    wire shift;
    wire [4:0] letter;
    
    
    parameter nothing                   = 0;
    parameter dit                       = 1;
    parameter dash                      = 2;
    parameter inter_letter_space        = 3;
    parameter inter_word_space          = 4;
    
    
    
    
    translate_morse U1 (
        .clk(clk),
        .rst(rst),
        .pulse_event(pulse_event),
        .letter(letter),
        .shift(shift)
    );
    
    
    
    
    
    initial forever #(period/2) clk = ~clk;  
    
    
    initial begin
    
    rst = 1;
    #(period *1) 
    rst = 0;
    #(period *1) 
    
    pulse_event = 0;
    #(period *5)
    
    pulse_event = dit;#(period);pulse_event = 0;#(period)//dit dit dit dit should be the letter H
    pulse_event = dit;#(period);pulse_event = 0;#(period)
    pulse_event = dit;#(period);pulse_event = 0;#(period)
    pulse_event = dit;#(period);pulse_event = 0;#(period)
    
    pulse_event = inter_letter_space;#(period);pulse_event = 0;#(period)
    pulse_event = inter_word_space;#(period);pulse_event = 0;#(period)
    pulse_event = inter_word_space;#(period);pulse_event = 0;#(period)
    pulse_event = inter_word_space;#(period);pulse_event = 0;#(period)
    pulse_event = inter_letter_space;#(period);pulse_event = 0;#(period)
    
    #(period *5)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        
    $finish;
end
    
    
    
endmodule
