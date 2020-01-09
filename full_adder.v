// AUM SHREE GANESHAAYA NAMAH||

module top_env;
    reg a, b, c_in;
    wire c_out, sum;
    full_adder my_adder(a, b, c_in, c_out, sum);

    always @(c_out or sum) begin
      $display("time=%d: %b + %b + %b = %b, carry = %b", $time, a, b, c_in, sum, c_out);
    end

    initial begin
      #200
      $finish;
    end

    initial begin
      // test cases
      a = 0; b = 0; c_in = 0; #5
      a = 0; b = 1; c_in = 0; #5
      a = 1; b = 0; c_in = 1; #5
      a = 1; b = 1; c_in = 1;
    end
endmodule

module full_adder(a, b, c_in, c_out, sum);
    input a, b, c_in;
    output wire c_out, sum;
    assign c_out = (a & b) | (b & c_in) | (c_in & a);
    assign sum = a ^ (b ^ c_in);
endmodule