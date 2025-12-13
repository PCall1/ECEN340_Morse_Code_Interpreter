`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2025 11:00:19 PM
// Design Name: 
// Module Name: morse_code_interpreter_top_tb
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


module morse_code_interpreter_top_tb(

    );
    parameter period = 10;
    reg clk = 0; 
    reg rst = 0;
    reg more_code_in = 0;
    
    wire [6:0] seg;
    wire [3:0] an;
    wire dp;
    wire [4:0] JA;
    wire [15:0] led;
    
    
    
    /*
    module morse_code_interpreter_top (
    input clk,
    input btnC,
    input btnR,
    
    output [6:0] seg,
    output [3:0] an,
    output dp,
    output [4:0] JA,
    output [15:0] led
    );
    
    
    */
    
    
    morse_code_interpreter_top U1 (
    .clk(clk),
    .btnC(rst),
    .btnR(more_code_in),
    
    .seg(seg),
    .an(an),
    .dp(dp),
    .JA(JA),
    .led(led)
    );
    
    
    
    initial forever #(period/2) clk = ~clk;  

    initial begin
    
    rst = 1;
    #(period *1) 
    rst = 0;
    #(period *1) 
    
    
    
    //send H
    more_code_in = 1;//dit
    #(6 * period)
    more_code_in = 0;
    #(2 * period)
    
    more_code_in = 1;//dit
    #(6 * period)
    more_code_in = 0;
    #(2 * period)
    
    more_code_in = 1;//dit
    #(6 * period)
    more_code_in = 0;
    #(2 * period)
    
    more_code_in = 1;//dit
    #(6 * period)
    more_code_in = 0;
    #(2 * period)
    
    
    more_code_in = 0;//inter letter space
    #(20 * period)
    
    
    //send T
    more_code_in = 1;//dash
    #(8 * period)
    more_code_in = 0;
    #(2 * period)
    
    
    more_code_in = 0;//inter letter space
    #(20 * period)

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        
    $finish;
    end
    
    
    
    
    
endmodule
