module top_module( 
    input a, b,
    output cout, sum );
    assign cout = (a+b)/2;
    assign sum = (a+b) %2;

endmodule

