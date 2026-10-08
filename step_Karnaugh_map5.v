module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos 
); 
assign out_pos = c & (~a | d) & (~b | d);
    assign out_sop = (c&d ) | (c & ~a & ~b );

endmodule
