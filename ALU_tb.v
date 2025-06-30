`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 12:49:42
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
parameter N=4;
reg [N-1:0]a,b;
reg [2:0]control;
wire [N-1:0]out;
wire overflow,zero;
ALU DUT(a,b,control,out,overflow,zero);
initial begin
a=4'b0110;
b=4'b0111;
control_generate();
a=0;b=0;
control_generate();
$finish;
end

task control_generate;
begin
for(integer i=0; i<7 ;i=i+1)
begin
control=i;
#10;
$display("a=%b b=%b control=%b out=%b overflow=%b zero=%b",a,b,control,out,overflow,zero);
end
end
endtask

endmodule
