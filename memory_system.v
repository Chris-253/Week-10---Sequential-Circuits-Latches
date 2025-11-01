module memory_system(
    input  [7:0] data,
    input        store,
    input  [1:0] addr,
    output [7:0] memory
);

    // This should instantiate 4 instances of
    // byte_memory, and then demultiplex
    // data and store into the one selected by
    // addr

    wire [7:0] A_data;
    wire [7:0] B_data;
    wire [7:0] C_data;
    wire [7:0] D_data;

    wire A_store;
    wire B_store;
    wire C_store;
    wire D_store;

    wire [7:0] A_out;
    wire [7:0] B_out;
    wire [7:0] C_out;
    wire [7:0] D_out;

    // you will need 2 demultiplexers:
    // 1. Demultiplex data -> selected byte
    // 2. Demultiplex store -> selected byte
    Demultiplexer data_demux(
        .data(data),
        .sel(addr),
        .A(A_data),
        .B(B_data),
        .C(C_data),
        .D(D_data)
    );

    // Demux for the store line
    assign A_store = (addr == 2'b00) ? store : 1'b0;
    assign B_store = (addr == 2'b01) ? store : 1'b0;
    assign C_store = (addr == 2'b10) ? store : 1'b0;
    assign D_store = (addr == 2'b11) ? store : 1'b0;

    // Four byte memory blocks (8-bit D-Latch style)
    byte_memory byte0(.data(A_data), .store(A_store), .memory(A_out));
    byte_memory byte1(.data(B_data), .store(B_store), .memory(B_out));
    byte_memory byte2(.data(C_data), .store(C_store), .memory(C_out));
    byte_memory byte3(.data(D_data), .store(D_store), .memory(D_out));

    // and one multiplexer:
    // 1. Multiplex selected byte -> memory
    Multiplexer out_mux(
        .A(A_out),
        .B(B_out),
        .C(C_out),
        .D(D_out),
        .sel(addr),
        .out(memory)
    );

endmodule
