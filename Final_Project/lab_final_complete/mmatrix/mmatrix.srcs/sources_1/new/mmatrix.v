`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2023 09:52:55 AM
// Design Name: 
// Module Name: mmatrix
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


module mmatrix(
    input [31:0]matrix_a,
    input [31:0]matrix_b,
    input clk,
    input reset,
    input mm_start,
    input mm_ack_i,
   // input mm_data_in,
    output  mm_done,
    output  mm_idle,
    output reg [31:0]matrix_o
    );
    
    reg [3:0]count_0,count_1;
    reg [4:0]count_data;
    reg [31:0]matrix_0[0:15];
    reg [31:0]matrix_1[0:15];
    wire [61:0]matrix_mm_0;
    wire [61:0]matrix_mm_1;
    wire [61:0]matrix_mm_2;
    wire [61:0]matrix_mm_3;
    wire [61:0]matrix_adder;
    //reg matrix_full;
    reg complete;
    reg [1:0]state;
    
    
    parameter init = 3'd0;
   // parameter cal = 3'd1;
    parameter out_data = 3'd1;
    parameter end_mm = 3'd2;
    
   assign mm_idle = (mm_start || !complete)? 1'd0:1'd1;
   assign mm_done = (state == end_mm)?1'd1:1'd0;
    
   always@ (posedge clk, negedge reset)begin
        if(!reset)begin
            complete <= 1'd1;
        end
        else begin
            if(mm_start)begin
                complete <= 1'd0;
            end
            else if(mm_done)begin
                complete <= 1'd1;
            end
        
        end
    end
    
    always@ (posedge clk, negedge reset)begin
        if(!reset)begin
            count_data<=5'd0;
        end
        else begin
            if(mm_start)begin
                if(count_data <= 5'd15)begin
                    matrix_0[count_data]<=matrix_a;
                    count_data <= count_data + 5'd1;                
                end
                else begin
                    matrix_1[count_data-5'd16]<=matrix_b;
                    count_data <= count_data + 5'd1;
                end
            end
        end
    end
    
    assign matrix_mm_0 = matrix_0[count_0] * matrix_1[count_1]; 
    assign matrix_mm_1 = matrix_0[count_0 + 4'd1] * matrix_1[count_1 + 4'd4]; 
    assign matrix_mm_2 = matrix_0[count_0 + 4'd2] * matrix_1[count_1 + 4'd8]; 
    assign matrix_mm_3 = matrix_0[count_0 + 4'd3] * matrix_1[count_1 + 4'd12]; 
    assign matrix_adder = (matrix_mm_0 + matrix_mm_1) + (matrix_mm_2 + matrix_mm_3);
    
    always@ (posedge clk, negedge reset)begin
        if(!reset)begin
             state<=2'd0;
             count_0<=4'd0;
             count_1<=4'd0;
        end
        else begin
            case(state)
                init: begin
                    if(count_data==5'd31)begin
                        state<=out_data;
                    end
                end
                
                out_data:begin
                    if(mm_ack_i)begin
                        matrix_o <= matrix_adder;
                        
                        if(count_1==4'd3)begin
                            if(count_0 == 4'd12)begin
                                state<=end_mm;
                            end
                            else begin
                                count_0<=count_0+4'd4;
                                count_1<=4'd0;
                            end
                        end
                        else begin
                            count_1<=count_1+4'd1;
                        end
                        
                    end
                end
                
                end_mm:begin
                    matrix_o<=32'd0;
                    count_0<=4'd0;
                    count_1<=4'd0;
                    state<=init;
                end
                
                default:begin
                    matrix_o<=32'd0;
                    count_0<=4'd0;
                    count_1<=4'd0;
                    state<=init;
                end
            endcase
         end
    end
    
    
    
endmodule
