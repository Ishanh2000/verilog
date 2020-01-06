// AUM SHREE GANESHAAYA NAMAH||

module top_env;
    reg [2:0] in;
    wire [1:0] out;
    new_module my_module(in, out);
    initial begin
            $display("TIME \t EVENT\n");
            $display("%4d \t Starting Simulation...", $time);
        #5
            in <= 3'b010; #1
            $display("%h", in);
            // $display("%4d \t %b, %b, %b \t %b, %b", $time, _a, _b, _c, _x, _y);
        // #10
        //     _a <= 0; _b <= 0; _c <= 1; #1
        //     $display("%4d \t %b, %b, %b \t %b, %b", $time, _a, _b, _c, _x, _y);
        // #10
        //     _a <= 0; _b <= 1; _c <= 0; #1
        //     $display("%4d \t %b, %b, %b \t %b, %b", $time, _a, _b, _c, _x, _y);
        // #10
        //     _a <= 0; _b <= 1; _c <= 1; #1
        //     $display("%4d \t %b, %b, %b \t %b, %b", $time, _a, _b, _c, _x, _y);
        // #10
        //     _a <= 1; _b <= 0; _c <= 0; #1
        //     $display("%4d \t %b, %b, %b \t %b, %b", $time, _a, _b, _c, _x, _y);
        // #10
        //     _a <= 1; _b <= 0; _c <= 'x; #1
        //     $display("%4d \t %b, %b, %b \t %b, %b", $time, _a, _b, _c, _x, _y);
        // #10
        //     _a <= 1; _b <= 1; _c <= 0; #1
        //     $display("%4d \t %b, %b, %b \t %b, %b", $time, _a, _b, _c, _x, _y);
        // #10
        //     _a <= 1; _b <= 1; _c <= 1; #1
        //     $display("%4d \t %b, %b, %b \t %b, %b", $time, _a, _b, _c, _x, _y);
        // #10    
            $display("%4d \t Ending Simulation...", $time);
        // $finish;
    end
endmodule

module new_module(in, out);
    input [2:0] in;
    output wire [1:0] out;
    // and or
    assign out[1] = in[2] & in[1] & in[0];
    assign out[0] = in[2] | in[1] | in[0];
endmodule