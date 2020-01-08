// AUM SHREE GANESHAAYA NAMAH||
// Example done in class (Full Adder)

module top_env;
    reg a, b, c_in;
    wire c_out, sum;
    full_adder my_adder(a, b, c_in, c_out, sum);

    initial begin
      $display("TIME \t EVENT\n");
      $display("%4d \t Stating Simulation...", $time);
      #200 // max allowed time
      $display("%4d \t Ending Simulation...", $time);
      $finish;
    end
    
    always @(sum) begin
      $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum);
    end

    initial begin
      // test cases
      a = 0; b = 0; c_in = 0; #1 // $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10
      a = 0; b = 0; c_in = 1; #1 // $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10
      a = 0; b = 1; c_in = 0; #1 // $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10
      a = 0; b = 1; c_in = 1; #1 // $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10
      a = 1; b = 0; c_in = 0; #1 // $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10
      a = 1; b = 0; c_in = 1; #1 // $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10
      a = 1; b = 1; c_in = 0; #1 // $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10
      a = 1; b = 1; c_in = 1; // #1 $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum);
    end

endmodule

module full_adder(a, b, c_in, c_out, sum);
    input a, b, c_in;
    output wire c_out, sum;
    assign c_out = (a & b) | (b & c_in) | (c_in & a);
    assign sum = a ^ b ^ c_in;
    // assign sum <= a;
endmodule

/*
   0     Stating Simulation... //
   1     0 + 0 + 0 = 0 0 //
  12     0 + 0 + 1 = 0 1 //
  23     0 + 1 + 0 = 0 1
  34     0 + 1 + 1 = 1 0 //
  45     1 + 0 + 0 = 0 1 //
  56     1 + 0 + 1 = 1 0 //
  67     1 + 1 + 0 = 1 0
  78     1 + 1 + 1 = 1 1 //
 200     Ending Simulation... //
*/