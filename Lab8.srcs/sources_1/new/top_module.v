`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2018 01:54:59 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input clk,
    output reg [3:0] seg,
    output reg [1:0] ano
    );
    wire [3:0] seg1;
    wire [3:0] seg3;
    wire [3:0] seg4;
    bcdto7seg( 1, seg1);
    bcdto7seg( 3, seg3);
    bcdto7seg( 4, seg4);
    display(clk, seg1, {0,0,0,0,0,1}, seg3, seg4, seg, ano);
endmodule
