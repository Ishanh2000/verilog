// AUM SHREE GANESHAAYA NAMAH||

`define MAX_TIME_ALLOWED #200

module top_env;
    reg signed [7:0] a, b;
    wire signed [7:0] sum;
    full_adder FA1(a, b, sum);
    
    integer max_time_allowed = 100, i;

    initial begin
        $display("TIME \t EVENT\n");
        $display("%4d \t Starting Simulation...", $time);
        `MAX_TIME_ALLOWED
        #max_time_allowed
        for(i=0;i <= 8; i+=2) begin
            $display("for");
        end

        $display("%4d \t Ending Simulation...%d", $time, i);
        $finish;
    end

    integer arr_a[3:0] = {1,22,3,4};

    initial begin
        // testing
        // for(i = 0; i < 5;)

        a <= 20;     b <= 8'd34; #1      $display("%4d \t %3d (%b) + %3d (%b) = %3d (%b)", $time, a, a, b, b, sum, sum); #10
        a <= ~8'd56;     b <= 8'd74; #1      $display("%4d \t %3d (%b) + %3d (%b) = %3d (%b)", $time, a, a, b, b, sum, sum); #10
        a <= 8'd123;    b <= 8'd255; #1     $display("%4d \t %3d (%b) + %3d (%b) = %3d (%b)", $time, a, a, b, b, sum, sum); #10
        a <= 8'd72;     b <= 8'd98; #1      $display("%4d \t %3d (%b) + %3d (%b) = %3d (%b)", $time, a, a, b, b, sum, sum); #10
        a <= 8'd7;    b <= +8'd2; #1       $display("%4d \t %3d (%b) + %3d (%b) = %3d (%b)", $time, a, a, b, b, sum, sum);
    end
endmodule

module full_adder(a, b, sum);
    input signed[7:0] a, b;
    output wire [7:0] sum;
    assign sum = a + b;
endmodule

/*
Unsigned Simulation:

TIME     EVENT

   0     Starting Simulation...
   1      20 (00010100) +  34 (00100010) =  54 (00110110)
   2      56 (00111000) +  74 (01001010) = 130 (10000010)
   3     123 (01111011) + 255 (11111111) = 122 (01111010)
   4      72 (01001000) +  98 (01100010) = 170 (10101010)
   5     254 (11111110) +   2 (00000010) =   0 (00000000)
 200     Ending Simulation...

Signed Simulation:

 TIME     EVENT

   0     Starting Simulation...
   1      20 (00010100) +  34 (00100010) =  54 (00110110)
   2      56 (00111000) +  74 (01001010) = -126 (10000010)
   3     123 (01111011) + 255 (11111111) = 122 (01111010)
   4      72 (01001000) +  98 (01100010) = -86 (10101010)
   5     254 (11111110) +   2 (00000010) =   0 (00000000)
 200     Ending Simulation...
*/