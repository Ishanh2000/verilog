// AUM SHREE GANESHAAYA NAMAH||
// Full_Adder
// && vs &, other operators
module top_env;
    reg a, b, c_in;
    wire sum, c_out;
    full_adder my_adder(a, b, c_in, sum, c_out);
    integer s = 05;
    initial begin
      $display("TIME \t EVENT\n");
      $display("%4d \t Starting Simulation...", $time);
      #200
      $display("%4d \t Ending Simulation...", $time);
      $finish;
    end

    always @(s) begin
      $display("%4d \t s = %3d", $time, s);
    end

    // initial begin
    //   // testing (exhaustive)
    //   a = 0; b = 0; c_in = 0; #1 $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10
    //   a = 0; b = 0; c_in = 1; #1 $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10
    //   a = 0; b = 1; c_in = 0; #1 $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10
    //   a = 0; b = 1; c_in = 1; #1 $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10
    //   a = 1; b = 0; c_in = 0; #1 $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10
    //   a = 1; b = 0; c_in = 1; #1 $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10
    //   a = 1; b = 1; c_in = 0; #1 $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10
    //   a = 1; b = 1; c_in = 1; #1 $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum);
    // end

    initial begin
      #1 s++; // s = 6, t = 1
      #1 s++; // s = 7, t = 2 
      #1 s++; s--; // s = 7, t = 3 -- confused
      #1 s++; // s = 8, t = 4 
      #1 s++; // s = 9, t = 5 
      #1 s++; // s = 10, t = 6 
    end
    
endmodule

module full_adder(a, b, c_in, sum, c_out);
    input a, b, c_in;
    output wire sum, c_out;
    assign sum = a ^ b ^ c_in;
    assign c_out = a&b | b&c_in | c_in&a;
endmodule