// AUM SHEE GANESHAAYA NAMAH||
// Ripple-Carry-Adder
// ok tested
module top_env;
    reg [7:0] A, B;
    reg C_in;
    wire [7:0] sum;
    wire C_out;

    ripple_carry_adder my_adder(A, B, C_in, sum, C_out);

    initial begin
      $display("TIME \t EVENT\n");
      $display("%4d \t Starting Simulation...", $time);
      #200;
      $display("%4d \t Ending Simulation...", $time);
      $finish;
    end

    initial begin
      C_in <= 0;
      A <=200; B<=34; #1 $display("%4d \t %3d (%b) + %3d (%b) = %3d (%b %b)", $time, A, A, B, B, sum, C_out, sum);
      A <= 56; B<=74; #1 $display("%4d \t %3d (%b) + %3d (%b) = %3d (%b %b)", $time, A, A, B, B, sum, C_out, sum);
      A <=123; B<=-1; #1 $display("%4d \t %3d (%b) + %3d (%b) = %3d (%b %b)", $time, A, A, B, B, sum, C_out, sum);
      A <= 72; B<=98; #1 $display("%4d \t %3d (%b) + %3d (%b) = %3d (%b %b)", $time, A, A, B, B, sum, C_out, sum);
      A <=254; B<=30; #1 $display("%4d \t %3d (%b) + %3d (%b) = %3d (%b %b)", $time, A, A, B, B, sum, C_out, sum);
    end

endmodule

module ripple_carry_adder(A, B, C_in, sum, C_out);
    input [7:0] A, B;
    input C_in;
    output wire [7:0] sum;
    output wire C_out;

    wire [6:0] carry;

    // instantiate 8 full adders
    full_adder FA0(A[0], B[0], C_in, sum[0], carry[0]);
    full_adder FA1(A[1], B[1], carry[0], sum[1], carry[1]);
    full_adder FA2(A[2], B[2], carry[1], sum[2], carry[2]);
    full_adder FA3(A[3], B[3], carry[2], sum[3], carry[3]);
    full_adder FA4(A[4], B[4], carry[3], sum[4], carry[4]);
    full_adder FA5(A[5], B[5], carry[4], sum[5], carry[5]);
    full_adder FA6(A[6], B[6], carry[5], sum[6], carry[6]);
    full_adder FA7(A[7], B[7], carry[6], sum[7], C_out);

endmodule

module full_adder(a, b, c_in, sum, c_out);
    input a,b, c_in;
    output wire sum, c_out;
    assign sum = a^b^c_in;
    assign c_out = a&b | b&c_in | c_in&a;
endmodule