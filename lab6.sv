module lab6 ();

    function logic [7:0] decoder3to8 (logic en_b, logic [2:0] in);
        casex({en_b, in})
            4'b1xxx: return 8'b11111111;
            4'b0000: return 8'b11111110; 
            4'b0001: return 8'b11111101; 
            4'b0010: return 8'b11111011; 
            4'b0011: return 8'b11110111; 
            4'b0100: return 8'b11101111; 
            4'b0101: return 8'b11011111; 
            4'b0110: return 8'b10111111; 
            4'b0111: return 8'b01111111; 

        endcase
    endfunction

    function logic [2:0] encoder8to3 (logic en_b, logic [7:0] in_b); 
        casex({en_b, in_b})
            9'b1xxxxxxxx: return 3'b111; 
            9'b00xxxxxxx: return 3'b000; 
            9'b010xxxxxx: return 3'b001; 
            9'b0110xxxxx: return 3'b010; 
            9'b01110xxxx: return 3'b011; 
            9'b011110xxx: return 3'b100; 
            9'b0111110xx: return 3'b101; 
            9'b01111110x: return 3'b110; 
            9'b011111110: return 3'b111; 

        endcase
    endfunction

    logic [2:0] in, out;
    logic       clk;

    assign out = encoder8to3(clk, decoder3to8(clk, in)); 

    initial begin
        clk = 1'b1;
        in  = 3'b111;
        forever #5 clk = ~clk;
    end

    always @ (posedge clk)
        in++;

    initial
        #80 $finish();

endmodule