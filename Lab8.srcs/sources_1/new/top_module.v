module top_module(
input [3:0] JCC,
    input clk,
    output [15:0] led,
    output reg [3:0] JCR,
    output reg [6:0] seg
    );
    endmodule
=======
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
    output [6:0] seg,
    output [3:0] an
    );
    wire [6:0] seg1;
    wire [6:0] seg3;
    wire [6:0] seg4;
    bcdto7seg(1, seg1);
    bcdto7seg(3, seg3);
    bcdto7seg(4, seg4);
    display(clk, seg1, 7'b0111111, seg3, seg4, seg, an);
endmodule
>>>>>>> 48737695cbd5422eeca9f19c771411b08e05b466
