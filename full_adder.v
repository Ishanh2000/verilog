// AUM SHREE GANESHAAYA NAMAH||
// Full_Adder

module top_env;
    // what if there exist more than one top_envs?
    reg a, b, c_in;
    wire sum, c_out;
    full_adder my_adder(a, b, c_in, sum, c_out);

    initial begin
      $display("ncnc");
    end

    initial begin
      $display("TIME \t EVENT\n");
      $display("%4d \t Starting Simulation...", $time);
      #200
      $display("%4d \t Ending Simulation...", $time);
      $finish;
    end

    initial begin
        $display("ncnc");
      // testing
      a = 0; b = 0; c_in = 0; #1 $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #13
      a = 0; b = 0; c_in = 1; #1 $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10 // 0+0+1=1
      a = 0; b = 1; c_in = 0; #1 $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10
      a = 0; b = 1; c_in = 1; #1 $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10
      a = 1; b = 0; c_in = 0; #1 $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10
      a = 1; b = 0; c_in = 1; #1 $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10
      a = 1; b = 1; c_in = 0; #1 $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #10
      a = 1; b = 1; c_in = 1; #1 $display("%4d \t %b + %b + %b = %b %b", $time, a, b, c_in, c_out, sum); #1010$display("%4d \t Ending Simulation...", $time); $finish;
    end
    
endmodule

module full_adder(a, b, c_in, sum, c_out);
    input a, b, c_in;
    output wire sum, c_out;
    assign sum = a ^ b ^ c_in;
    assign c_out = a&b | b&c_in | c_in&a;
endmodule