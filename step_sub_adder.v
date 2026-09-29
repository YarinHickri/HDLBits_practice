module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire first;
    wire [31:0] b_xor;
    assign b_xor = b^{32{sub}};
    add16 one(.a(a[15:0]), .b(b_xor[15:0]), .cin(sub), .cout(first), .sum(sum[15:0])); 
    add16 two(.a(a[31:16]), .b(b_xor[31:16]), .cin(first), .sum(sum[31:16])); 

endmodule

