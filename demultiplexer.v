module Demultiplexer(
    input  [7:0] data,
    input  [1:0] sel,
    output reg [7:0] A,
    output reg [7:0] B,
    output reg [7:0] C,
    output reg [7:0] D
);

    always @(*) begin
        A = 8'b00000000;
        B = 8'b00000000;
        C = 8'b00000000;
        D = 8'b00000000;

        case (sel)
            2'b00: A = data;
            2'b01: B = data;
            2'b10: C = data;
            2'b11: D = data;
        endcase
    end

endmodule
