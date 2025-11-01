module Multiplexer(
    input  [7:0] A, 
    input  [7:0] B, 
    input  [7:0] C, 
    input  [7:0] D, 
    input  [1:0] sel,
    output reg [7:0] out
);

    always @(*) begin
        case (sel)
            2'b00: out = A;
            2'b01: out = B;
            2'b10: out = C;
            2'b11: out = D;
            default: out = 8'b00000000;
        endcase
    end

endmodule

