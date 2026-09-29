module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire first;
    wire [15:0] second,third;
    add16 one( .a(a[15:0]), .b(b[15:0]), .cin(1'b0), .cout(first),.sum(sum[15:0]));
    add16 two( .a(a[31:16]), .b(b[31:16]), .cin(1'b0),.sum(second));
    add16 three( .a(a[31:16]), .b(b[31:16]), .cin(1'b1),.sum(third));

    always@(*)
        case(first)
            1'b0:sum[31:16] = second;
            1'b1:sum[31:16] = third;
                endcase
endmodule
