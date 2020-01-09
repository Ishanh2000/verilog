// AUM SHREE GANESHAAYA NAMAH||
// Experiment_1 - Design basic NAND, NOR, NOT (CMOS directly compatible) (>=2 inputs)

`define MAX_SIM_TIME #200 

module NAND_top_env;
    reg a = 1, b = 0;
    wire x;
    NAND_2 my_nand_2(a, b, x);

    always @(x) begin
      $display("%4d \t %b NAND %b = %b (Always)", $time, a, b, x);
    end

    // test cases
    initial begin
      a = 0; b = 0; // 1
      #1 $display("%4d \t %b NAND %b = %b", $time, a, b, x);
      a = 0; b = 1; // 1
      #1 $display("%4d \t %b NAND %b = %b", $time, a, b, x);
      a = 1; b = 0; // 1
      #1 $display("%4d \t %b NAND %b = %b", $time, a, b, x);
      a = 1; b = 1; // 0
      #1 $display("%4d \t %b NAND %b = %b", $time, a, b, x);
    end

    initial begin
      $display("TIME \t EVENT\n");
      $display("%4d \t Starting Simulation...", $time);
      `MAX_SIM_TIME
      $display("%4d \t Endinging Simulation...", $time);
      $finish;
    end
endmodule

module NAND_2(a, b, x);
    input a, b;
    output wire x;
    assign x = ~(a & b);
endmodule