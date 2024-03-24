`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/26/2023 04:57:23 AM
// Design Name: 
// Module Name: mmatrix_tb
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


module mmatrix_tb;

mmatrix m0(
    .matrix_a(matrix_a),
    .matrix_b(matrix_b),
    .clk(clk),
    .reset(reset),
    .mm_ack_i(mm_ack_i),
    .mm_start(mm_start),
    .mm_done(mm_done),
    .mm_idle(mm_idle),
    .matrix_o(matrix_o)
);

reg clk,reset;
parameter clk_f = 10;
reg mm_start,mm_ack_i;
reg [31:0]matrix_a,matrix_b;
wire [31:0]matrix_o;
wire mm_done,mm_idle;
reg [31:0]data[0:15];

always begin
    #(clk_f/2) clk<=1'd0;
    #(clk_f/2) clk<=1'd1;
end

integer i,j;

initial begin
    clk <= 1'd0;
    mm_ack_i <= 1'd0;
    #(clk_f*3) reset <= 1'd0;
    #(clk_f*3) reset <= 1'd1;  
    //#(clk_f/2)  
end

initial begin
    #(clk_f*6);
    for(i=0;i<=31;i=i+1)begin
        if(i<=15)begin
            #(clk_f)mm_start<=1'd1;
            matrix_a = i;
            #(clk_f)mm_start<=1'd0;
        end
        else begin
            #(clk_f)mm_start<=1'd1;
            matrix_b = i-16;
            #(clk_f)mm_start<=1'd0;
        end
    end
    #(clk_f*3);
    
    for(j=0;j<=15;j=j+1)begin
        #(clk_f)mm_ack_i <= 1'd1;
        #(clk_f)mm_ack_i <= 1'd0;
        data[j] <= matrix_o;
    end
    #(clk_f*3);
    
    for(i=0;i<=31;i=i+1)begin
        if(i<=15)begin
            #(clk_f)mm_start<=1'd1;
            matrix_a = i+1;
            #(clk_f)mm_start<=1'd0;
        end
        else begin
            #(clk_f)mm_start<=1'd1;
            matrix_b = i-15;
            #(clk_f)mm_start<=1'd0;
        end
    end
    #(clk_f*3);
    
    for(j=0;j<=15;j=j+1)begin
        #(clk_f)mm_ack_i <= 1'd1;
        #(clk_f)mm_ack_i <= 1'd0;
        data[j] <= matrix_o;
    end
    #(clk_f*3);
    $finish;
end

endmodule
