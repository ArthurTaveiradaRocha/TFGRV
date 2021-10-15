`timescale 1 ns/10 ps
module core_tb();

    reg clock_i;
    reg reset_i;
    wire [31:0] rd_data_o;
    
    core UUT(
        .clock_i(clock_i),
        .reset_i(reset_i),
        .rd_data_o(rd_data_o));
    
    always #5 clock_i <= ~clock_i;

    // always #1000 reset <= ~reset;

    always 
    begin
        clock_i = 0;
        reset_i = 1;

        #12;

        reset_i = 0;

        #2000;
    end
endmodule