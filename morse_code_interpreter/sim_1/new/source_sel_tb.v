`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2025 11:38:17 AM
// Design Name: 
// Module Name: source_sel_tb
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


module source_sel_tb(
    );
    
    parameter period = 10;
    reg clk = 0; 
    reg b = 0;
    reg ext = 0;
    reg ext_rst = 0;
    
    wire d_out;
    wire rst;
    wire led;
    
    source_sel SR1 (
    .b(b),
    .ext(ext),
    .clk(clk),
    .ext_rst(ext_rst),
    
    .d_out(d_out),
    .rst(rst),
    .led(led)
    );
    
    initial forever #(period/2) clk = ~clk;  
    
    initial begin
    
    ext_rst = 1;
    
    #(period * 1)
    
    ext_rst = 0;
    
    #(period * 1)
    b = 1;
    
    #(period * 10)
    b = 0;
    
    /////////////////////////////////////////
    //this transition should give a rst pulse
    #(period * 10)
    b = 1;
    #(period * 10)
    b = 0;
    
    #(period * 10)
    ext = 1;
    /////////////////////////////////////////
    
    #(period * 20)
    ext = 0;
    
    
    
    
        $finish;
    end
    
    
    
    
    
    
    
    
    
   
endmodule
