`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2025 02:06:07 PM
// Design Name: 
// Module Name: translate_morse
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


module translate_morse(
    input clk,
    input rst,
    input [2:0] pulse_event,
    output reg [4:0] letter,
    output reg shift
    );
    parameter Init = 31;
    parameter ShiftOut = 30;
    
    parameter Space = 0;
    parameter A = 1;
    parameter B = 2;
    parameter C = 3;
    parameter D = 4;
    parameter E = 5;
    parameter F = 6;
    parameter G = 7;
    parameter H = 8;
    parameter I = 9;
    parameter J = 10;
    parameter K = 11;
    parameter L = 12;
    parameter M = 13;
    parameter N = 14;
    parameter O = 15;
    parameter P = 16;
    parameter Q = 17;
    parameter R = 18;
    parameter S = 19;
    parameter T = 20;
    parameter U = 21;
    parameter V = 22;
    parameter W = 23;
    parameter X = 24;
    parameter Y = 25;
    parameter Z = 26;
    
    
    
    parameter nothing                   = 0;
    parameter dit                       = 1;
    parameter dash                      = 2;
    parameter inter_letter_space        = 3;
    parameter inter_word_space          = 4;
    
    
    
    
    reg [4:0] current_state;
    reg [4:0] next_state;
    
    reg [4:0] next_letter;
    reg next_shift;
    

    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= Init;
            letter <= 0;
            
        end
        else begin
            current_state   <= next_state;//latch next_state in this manner to sycronize this with the clock
            letter          <= next_letter;//latch next_letter in this manner to sycronize this with the clock
            
            shift <= next_shift;
        end
    
    end
    
    always @(*) begin
    
        next_state = current_state; // Default: Stay in current state (for Moore-style FSM)
        next_letter = letter;       // Default: Keep the last asserted letter
        next_shift = 0;          // *** FIX: Default to NO shift pulse ***
        
        
    
    
        case (current_state)
        //==========================================================================================================================
            Init: begin
                case (pulse_event)
                    nothing:                next_state = Init;
                    dit:                    next_state = E;
                    dash:                   next_state = T;
                    inter_letter_space: begin
                                            next_state = Init;
                                            //nothig to send out since it was already in init
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            A: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = R;
                    dash:                   next_state = W;
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            B: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = Init;//invalid a dit does not represent anything at this point
                    dash:                   next_state = Init;//invalid a dash does not represent anything at this point
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            C: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = Init;//invalid a dit does not represent anything at this point
                    dash:                   next_state = Init;//invalid a dash does not represent anything at this point
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            D: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = B;
                    dash:                   next_state = X;
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            E: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = I;
                    dash:                   next_state = A;
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            F: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = Init;//invalid a dit does not represent anything at this point
                    dash:                   next_state = Init;//invalid a dash does not represent anything at this point
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            G: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = Z;
                    dash:                   next_state = Q;
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            H: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = Init;//invalid a dit does not represent anything at this point
                    dash:                   next_state = Init;//invalid a dash does not represent anything at this point
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            I: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = S;
                    dash:                   next_state = U;
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            J: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = Init;//invalid a dit does not represent anything at this point
                    dash:                   next_state = Init;//invalid a dash does not represent anything at this point
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            K: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = C;
                    dash:                   next_state = Y;
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            L: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = Init;//invalid a dit does not represent anything at this point
                    dash:                   next_state = Init;//invalid a dash does not represent anything at this point
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            M: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = G;
                    dash:                   next_state = O;
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            N: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = D;
                    dash:                   next_state = K;
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            O: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = Init;//invalid a dit does not represent anything at this point
                    dash:                   next_state = Init;//invalid a dash does not represent anything at this point
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            P: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = Init;//invalid a dit does not represent anything at this point
                    dash:                   next_state = Init;//invalid a dash does not represent anything at this point
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            Q: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = Init;//invalid a dit does not represent anything at this point
                    dash:                   next_state = Init;//invalid a dash does not represent anything at this point
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            R: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = L;
                    dash:                   next_state = Init;//invalid a dash does not represent anything at this point
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            S: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = H;
                    dash:                   next_state = V;
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            T: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = N;
                    dash:                   next_state = M;
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            U: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = F;
                    dash:                   next_state = Init;//invalid a dash does not represent anything at this point
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            V: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = Init;//invalid a dit does not represent anything at this point
                    dash:                   next_state = Init;//invalid a dash does not represent anything at this point
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            W: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = P;
                    dash:                   next_state = J;
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            X: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = Init;//invalid a dit does not represent anything at this point
                    dash:                   next_state = Init;//invalid a dash does not represent anything at this point
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            Y: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = Init;//invalid a dit does not represent anything at this point
                    dash:                   next_state = Init;//invalid a dash does not represent anything at this point
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
        //==========================================================================================================================
            Z: begin
                case (pulse_event)
                    nothing:                next_state = current_state;
                    dit:                    next_state = Init;//invalid a dit does not represent anything at this point
                    dash:                   next_state = Init;//invalid a dash does not represent anything at this point
                    inter_letter_space: begin
                                            next_state = Init;
                                            next_letter = current_state;
                                            next_shift = 1;
                                        end
                    inter_word_space:   begin
                                            next_state = Init;
                                            next_letter = Space;
                                            next_shift = 1;
                                        end
                endcase
                end
                
                
        endcase
        
        
    end
    
    
endmodule
