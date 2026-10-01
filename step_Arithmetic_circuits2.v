module top_module( 
    input a, b, cin,
    output cout, sum );
    assign sum = (a +b + cin)%2;
        assign cout = (a +b + cin)/2;

endmodule

