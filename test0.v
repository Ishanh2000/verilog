// AUM SHREE GANESHAAYA NAMAH||
// Testing and Practice
module top_env;
    reg [7:0] a, b;
    wire [7:0] x;

    gate my_gate(a, b, x);

    initial begin
      $display("TIME \t EVENT\n");
      $display("%4d \t Starting Simulation...");
      #300
      $display("%4d \t Starting Simulation...");
      $finish;
    end

    initial begin
      // test cases
      $
    end
endmodule

module gate(a, b, x);

endmodule