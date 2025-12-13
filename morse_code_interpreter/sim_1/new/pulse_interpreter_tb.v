`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2025 04:56:48 PM
// Design Name: 
// Module Name: pulse_interpreter_tb
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


module pulse_interpreter_tb(

    );
    
    parameter period = 10;
    reg clk = 0; 
    reg morse_in = 0;
    reg rst = 0;
    wire [2:0] pulse_event;
    
    pulse_interpreter U1 (.morse_in(morse_in), .clock_1khz(clk), .rst(rst), .pulse_event(pulse_event));
    
    initial forever #(period/2) clk = ~clk;  
    
    initial begin
    
    rst = 1;
    #(period *1) 
    rst = 0;
    #(period *1) 
    /*//use these settings for testing
    parameter dash_time                 = 2;//amount of time high before interpreted as dash
    parameter inter_letter_space_time   = 5;//amount of time low before interpreted as inter letter space
    parameter inter_word_space_time     = 16;//amount of time low before interpreted as inter word space
    parameter debounce_width = 1;
    */
    
    
    
    
    
    
        morse_in = 0;
        
        #(period *10) 
        
        morse_in = 1;
        
        #(period *5) 
        
        morse_in = 0;//dit
        
        #(period *10) 
        
        morse_in = 0;
        
        #(period *40) 
        
        morse_in = 1;
        
        #(period *30) 
        
        morse_in = 0;//dash
        
        #(period *10) 
        
        morse_in = 0;
        
        #(period *500) //interletter space
        
        morse_in = 1;
        
        #(period *10) 
        
        morse_in = 0;
        
        #(period *10) 
    
        $finish;
    end
    
    
    
    
    
    
    
    
    
   
endmodule
