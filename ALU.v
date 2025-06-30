`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 12:21:40
// Design Name: 
// Module Name: ALU
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


module ALU #(parameter N=4)(input [N-1:0]a,b,input [2:0]control,output reg [N-1:0]out,output reg overflow ,output reg zero);
localparam ADD = 3'b000;
localparam SUB = 3'b001;
localparam AND = 3'b010;
localparam OR  = 3'b011;
localparam SLT = 3'b100;
localparam XOR = 3'b101;
localparam NOR = 3'b110;

wire [N-1:0]sum;
wire [N-1:0]diff;
wire carry;
wire borrow;
assign {carry,sum}=a+b;
assign {borrow,diff}=a-b;
always @(*)
begin
case(control)
ADD : begin
      out=sum;
      overflow=carry;
      end
SUB : begin
      out=diff;
      overflow=borrow;
      end
AND : begin
      out=a&b;
      overflow=0;
      end
OR : begin
     out=a|b;
     overflow=0;
     end
SLT : begin
      out=(a<b)?{{(N-1){1'b0}},1'b1}:0;
      overflow=0;
      end
XOR : begin
      out=a^b;
      overflow=0;
      end  
NOR : begin
     out=~(a|b);
     overflow=0;
     end  
default : begin out=0 ; overflow=0;end  
endcase
if(!out) zero=1;
else zero=0;
end
endmodule

