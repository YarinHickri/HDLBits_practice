`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire first, second ;
    assign first = a & b;
    assign second = c & d;
    assign out = first|second;
    assign out_n = !(first|second);
   
endmodule
