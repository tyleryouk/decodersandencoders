module lab6 ();

    function logic [7:0] decoder3to8 (logic en_b, logic [2:0] in);
        casex({en_b, in})
            4'b1xxx: return 8'b1111_1111;
// COMPLETE
        endcase
    endfunction

    function logic [2:0] encoder8to3 (// COMPLETE);
        casex({en_b, in_b})
            9'b1_xxxxxxxx: return 3'b111;
   // COMPLETE
        endcase
    endfunction

    logic [2:0] in, out;
    logic       clk;

    assign out = encoder8to3(// COMPLETE );

    initial begin
        clk = 1'b1;
        in  = 3'b111;
        forever #5 clk = ~clk;
    end

    always @ (posedge clk)
        // COMPLETE

    initial
        #80 $finish();

endmodule