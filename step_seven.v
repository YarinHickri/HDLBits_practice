module top_module( 
    input a, 
    input b, 
    output out );
    assign out = !(((!a)&b)|(a&(!b)));
    //     assign out = !(a^b);

    
endmodule

