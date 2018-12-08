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
    input [3:0] sw,
    input clk,
    output reg [15:0] led,
    output reg [3:0] JCC,
    output reg [6:0] seg
    );
    //reg [10:0] i;
    //assign JCC=sw;
    //assign led = JC;
    reg [3:0] col,run;
    reg [3:0] out;
    wire slclk;
    divider(clk, slclk);
    initial run=0;
    initial led=0;
//    always @(*)
//        begin
//            if(JCC[0]==1) led[0]=1;
//            else led[0]=0;
//            if(JCC[1]==1) led[1]=1;
//            else led[1]=0;
//            if(JCC[2]==1) led[2]=1;
//            else led[2]=0;
//            if(JCC[3]==1) led[3]=1;
//            else led[3]=0;
//            if(JCC[4]==1) led[4]=1;          
//        end

    initial JCC = 1;
    always @(posedge slclk) begin
        case(JCC)
            4'b0001: begin
//                case(JC)
//                    4'b0001: led = 16'b0000_0000_0100_0000; //6
//                    4'b0010: led = 16'b0000_0001_0000_0000; //8
//                    4'b0100: led = 16'b0000_0000_0010_0000; //5
//                    4'b1000: led = 16'b0000_0000_1000_0000; //7
//                    default: led = 0; 
//                endcase
//                if(led==0)
                case(JC)
                    4'b0001: out = 6; //6
                    4'b0010: out = 8; //8
                    4'b0100: out = 5; //5
                    4'b1000: out = 7; //7
                    default: out = 0; 
                endcase
                JCC = 4'b0010;
            end
            4'b0010: begin
                case(JC)
                    4'b0001: led = 16'b0000_0000_0000_0100;
                    4'b0010: led = 16'b0000_0000_0001_0000;
                    4'b0100: led = 16'b0000_0000_0000_0010;
                    4'b1000: led = 16'b0000_0000_0000_1000;
                    default: led = 0;
                endcase
                if(led==0)
                JCC = 4'b0100;
            end
            4'b0100: begin
                case(JC)
                    4'b0001: led = 16'b0100_0000_0000_0000;
                    4'b0010: led = 16'b1000_0000_0000_0001;
                    4'b0100: led = 16'b0010_0000_0000_0000;
                    4'b1000: led = 16'b1000_0000_0000_0000;
                    default: led = 0;
                endcase
                if(led==0)
                JCC = 4'b1000;
            end
            4'b1000: begin
                case(JC)
                    4'b0001: led = 16'b0000_0100_0000_0000;
                    4'b0010: led = 16'b0001_0000_0000_0000;
                    4'b0100: led = 16'b0000_0010_0000_0000;
                    4'b1000: led = 16'b0000_1000_0000_0000;
                    default: led = 0;
                endcase
                if(led==0)
                JCC = 4'b0001;
            end
            default : begin
                led=0;
            end
        endcase
        out=led;
    end

//    always @(posedge slclk)
//    begin
//        led=0;
//        JCC[run]=1;
//        if(JC[0]==0)
//        begin
//            if(run==0) out=6;
//            if(run==1) out=2;
//            //if(run==2) out=14;
//            //if(run==3) out=10;
//        end
//        if(JC[1]==0)
//        begin
//            if(run==0) out=8;
//            if(run==1) out=4;
//            //if(run==2) out=16;
//            //if(run==3) out=12;
//        end
//        if(JC[2]==0)
//        begin
//            if(run==0) out=5;
//            if(run==1) out=1;
//            //if(run==2) out=13;
//            if(run==3) out=9;
//        end
//        if(JC[3]==0)
//        begin
//            if(run==0) out=7;
//            if(run==1) out=3;
//            //if(run==2) out=15;
//            //if(run==3) out=11; 
//        end
//        JCC[run]=1;
//         if(run<=3)
//            run=run+1;
//         else
//            run=0;
//    end
    always @(out)
    begin
     case(out)
        4'b0000: seg=~7'b0111111;
        4'b0001: seg=~7'b0000110;
        4'b0010: seg=~7'b1011011;
        4'b0011: seg=~7'b1001111;
        4'b0100: seg=~7'b1100110;
        4'b0101: seg=~7'b1101101;
        4'b0110: seg=~7'b1111101;
        4'b0111: seg=~7'b0000111;
        4'b1000: seg=~7'b1111111;
        4'b1001: seg=~7'b1101111;
        default: seg=7'b1111111;
     endcase
    end
endmodule
