`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2018 01:46:31 PM
// Design Name: 
// Module Name: display
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


module display(
    input clk,
    input [6:0] seg, 
    input [6:0] seg1,
    input [6:0] seg2,
    input [6:0] seg3,
    input [6:0] seg4,
    output reg [3:0] ano
    );
    wire [1:0] led_actived_counter;
    reg [19:0] refresh_counter;
    always @ (posedge clk) begin
        refresh_counter <= refresh_counter + 1;
    end
    always @ (*) begin
        case (led_actived_counter)
            2'b00 : begin // Deactive LED2, LED3, LED4
                    ano = 4'b0111;
                end
            2'b01 : begin // Deactive LED1, LED3, LED4
                    ano = 4'b1011;
                end
            2'b10 : begin
                    ano = 4'b1101; // Deactive LED1, LED2, LED4
                end
            2'b11 : begin
                    ano = 4'b1110; // Deactive LED1, LED2, LED3
                end
        endcase
    end
endmodule
