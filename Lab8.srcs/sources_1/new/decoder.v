//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2018 11:22:01 AM
// Design Name: 
// Module Name: decoder
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


module decoder(
    input [3:0] JC,
    input clk,
    output reg [15:0] led,
    output reg [3:0] JCC
    );
    wire slclk;
    divider(clk, slclk);
    initial led = 0;
    initial JCC = 1;
    
    always @(posedge slclk) begin
        case(JCC)
            4'b0001: begin
                JCC = 4'b0010;
            end
            4'b0010: begin
                JCC = 4'b0100;
            end
            4'b0100: begin
                JCC = 4'b1000;
            end
            4'b1000: begin
                JCC = 4'b0001;
            end
            default : begin
                JCC = 4'b0001;
            end
        endcase
    end
    
    always @(posedge slclk) begin
        case(JC)
            4'b0001: begin
                case(JCC)
                    4'b0001: led = 16'b0000_0000_0000_0001;
                    4'b0010: led = 16'b0000_0000_0001_0000;
                    4'b0100: led = 16'b0000_0001_0000_0000;
                    4'b1000: led = 16'b0001_0000_0000_0000;
                endcase
            end
            4'b0010: begin
                case(JCC)
                    4'b0001: led = 16'b0000_0000_0000_0010;
                    4'b0010: led = 16'b0000_0000_0010_0000;
                    4'b0100: led = 16'b0000_0010_0000_0000;
                    4'b1000: led = 16'b0010_0000_0000_0000;
                endcase
            end
            4'b0100: begin
                case(JCC)
                    4'b0001: led = 16'b0000_0000_0000_0100;
                    4'b0010: led = 16'b0000_0000_0100_0000;
                    4'b0100: led = 16'b0000_0100_0000_0000;
                    4'b1000: led = 16'b0100_0000_0000_0000;
                endcase
            end
            4'b1000: begin
                case(JCC)
                    4'b0001: led = 16'b0000_0000_0000_1000;
                    4'b0010: led = 16'b0000_0000_1000_0000;
                    4'b0100: led = 16'b0000_1000_0000_0000;
                    4'b1000: led = 16'b1000_0000_0000_0000;
                endcase
            end
            default: led = 0;
        endcase
    end
      
endmodule
