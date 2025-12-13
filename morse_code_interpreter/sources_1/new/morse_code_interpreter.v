`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2025 10:27:18 AM
// Design Name: 
// Module Name: 
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


module morse_code_interpreter_top (
    input clk,
    input btnL,
    input btnC,
    input btnR,
    input btnD,
    input [15:0] sw,
    input [4:0] JB, // input from other FPGA
    
    output [6:0] seg,
    output [3:0] an,
    output dp,
    output [4:0] JA,
    output led
    );
    
    
    
    //selects which source is talking.
    wire d_out;
    wire src_sw_rst;
    reg source_talking;
    reg source_talking_d1;
    
    assign rst = btnC || (source_talking ^ source_talking_d1);
    assign JA[0] = btnR;
    
    assign d_out_raw = btnR || JB[0];
    assign led = ~source_talking;
    
    reg [4:0] d_out_shift;
    
    always @(posedge btnC or posedge clock_1khz) begin
        if (btnC) begin
            source_talking <= 0;
        end
        else begin
            if (JB[0]) begin
                source_talking <= 0;
            end
            else if (btnR) begin
                source_talking <= 1;
            end
        
            d_out_shift <= {d_out_shift[3:0], d_out_raw};
            source_talking_d1 <= source_talking;
        end

        
        
    end
    
    assign d_out = d_out_shift[4];
    
    
    
    
    
    
//    source_sel s1 (
//    .ext_rst(btnC),
//    .b(BtnR),
//    .ext(btnL),   // make btnL for local tests; make JB[0] for ext cmmunication input
//    .rst(src_sw_rst),
//    .d_out(d_out),
//    .led(led)
//    );
    
    
//    wire clock_1khz;
//    assign clock_1khz = clk;
    clk_1khz U1 (
        .clk(clk),
        .rst(btnC),
        .clock_1khz_output(clock_1khz)
    );
    
    
//    wire clk_display_refresh;
//    assign clk_display_refresh = clk;
    clock_display_refresh U2 (
        .clk(clk),
        .rst(rst),
        .clk_div(clk_display_refresh)
    );

    

    
    wire [2:0] output_pulse_event;
    pulse_interpreter U3 (
        .morse_in(d_out),
        .spaceKey(btnD),
        .includeSpaces(sw[15]),
        .clock_1khz(clock_1khz),
        .rst(rst),
        .pulse_event(output_pulse_event)
    );
    
    
    wire [4:0] letter;
    wire shift_letters;
    translate_morse U4 (
        .clk(clock_1khz),
        .rst(rst),
        .pulse_event(output_pulse_event),
        .letter(letter),
        .shift(shift_letters)
    );
    

    digit_selector U5 (//instantiate digit selector
    .clk(clk_display_refresh),
    .rst(rst),
    .digit_sel(an)
    );
    
    
    wire [4:0] selected_letter;
    character_selector U6 (//instantiate char_num generator
    .digit_sel(an),
    .char_num(letter),
    .shift(shift_letters),
    .rst(rst),
    .char_num_output(selected_letter)
    );
    
    
    //module to display on screen given the selected character on the display
    sseg_display U7 (
    .seg(seg),
    //.an(an),
    .dp(dp),
    .char_num(selected_letter)
    );
    
    
endmodule