`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2025 09:06:59 AM
// Design Name: 
// Module Name: pulse_interpreter
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


module pulse_interpreter(
    input morse_in,
    input spaceKey,
    input clock_1khz,
    input includeSpaces,
    input rst,
    output reg [2:0] pulse_event
    );
    //a dit is a high pulse less than 200ms. any duration about 25ms will be accepted
    parameter dash_time                 = 200;//amount of time high before interpreted as dash (debounce time not included)
    parameter inter_letter_space_time   = 500;//amount of time low before interpreted as inter letter space
    parameter inter_word_space_time     = 1600;//amount of time low before interpreted as inter word space
    parameter debounce_width = 30;
    parameter timer_width = 12;
    
    parameter MAX_TIMER_COUNT = (1 << timer_width) - 1; 
    
    
    parameter nothing                   = 0;
    parameter dit                       = 1;
    parameter dash                      = 2;
    parameter inter_letter_space        = 3;
    parameter inter_word_space          = 4;
    
    
    
    
    
    reg includeSpaces_registered;

    reg [debounce_width-1:0] morse_shift;

    wire debounced_morse;
    reg debounced_morse_d1; // For edge detection
    
    
    reg [debounce_width-1:0] spaceKey_shift;
    
    wire debounced_spaceKey;
    reg debounced_spaceKey_d1;
    
    

    reg [2:0] next_pulse_event;
    reg [timer_width-1:0] high_pulse_counter; // max ~10 seconds
    reg [timer_width-1:0] low_pulse_counter; // max ~10 seconds

    reg high_pulse_counter_enable;
    reg low_pulse_counter_enable;

    

    always @(posedge clock_1khz or posedge rst) begin
        if (rst) begin
            morse_shift <= 0;
            spaceKey_shift <= 0;
        end else begin
            morse_shift <= {morse_shift[debounce_width-2:0], morse_in};
            spaceKey_shift <= {spaceKey_shift[debounce_width-2:0], spaceKey};
        end
    end
    assign debounced_morse = &morse_shift;
    assign debounced_spaceKey = &spaceKey_shift;




    always @(posedge clock_1khz or posedge rst) begin
        if (rst) begin
            high_pulse_counter_enable <= 0;
            low_pulse_counter_enable <= 0;
            high_pulse_counter <= 0;
            low_pulse_counter <= 0;
            debounced_morse_d1 <= 0;
            debounced_spaceKey_d1 <= 0;
            next_pulse_event <= nothing;
            pulse_event <= nothing;

        end else begin
            includeSpaces_registered <= includeSpaces;
            
            debounced_morse_d1 <= debounced_morse; // Capture current state for next cycle's edge check
            debounced_spaceKey_d1 <= debounced_spaceKey;
            
            next_pulse_event <= nothing; // Default to nothing unless an event is triggered


            if (debounced_spaceKey && !debounced_spaceKey_d1) begin//if the btnD is pressed send a space.
                next_pulse_event <= inter_word_space;
            end
            
            else begin
                if (high_pulse_counter_enable) begin
                    high_pulse_counter <= high_pulse_counter + 1;
                    if (high_pulse_counter == MAX_TIMER_COUNT) begin
                        high_pulse_counter_enable <= 0;
                    end
                end else begin
                    high_pulse_counter <= 0;
                end
                
                if (low_pulse_counter_enable) begin
                    low_pulse_counter <= low_pulse_counter + 1;
                    if (low_pulse_counter == MAX_TIMER_COUNT) begin
                        low_pulse_counter_enable <= 0;
                    end
                end else begin
                    low_pulse_counter <= 0;
                end
    
    
                //Rising Edge Detect 
                if (debounced_morse && !debounced_morse_d1) begin
                    high_pulse_counter_enable <= 1;
                    low_pulse_counter_enable <= 0;
                    //No event is generated on a rising edge for Morse code interpretation
                end
    
                //Falling Edge Detect
                else if (!debounced_morse && debounced_morse_d1) begin
                    high_pulse_counter_enable <= 0;
                    low_pulse_counter_enable <= 1;
    
                    if (high_pulse_counter < dash_time) begin
                        next_pulse_event <= dit; // Short pulse
                    end else begin
                        next_pulse_event <= dash; // Long pulse
                    end
                end
                
                //Low Pulse Timeouts
                else if (low_pulse_counter_enable) begin
                    if (low_pulse_counter == inter_word_space_time && includeSpaces_registered) begin
                        // Priority to inter-word space if it hits the full duration
                        next_pulse_event <= inter_word_space;
                    end else if (low_pulse_counter == inter_letter_space_time) begin
                        // Less priority, but hits before inter-word space
                        next_pulse_event <= inter_letter_space;
                    end
                end
                
                
                //One-Shot Pulse Event Logic
                if (next_pulse_event != nothing) begin
                    pulse_event <= next_pulse_event; // Latch the new event
                end else begin
                    pulse_event <= nothing; // Clear it if no new event is present
                end
            
            end
        end
    end
endmodule
