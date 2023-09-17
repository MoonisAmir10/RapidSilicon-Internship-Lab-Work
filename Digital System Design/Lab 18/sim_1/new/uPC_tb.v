`timescale 1ns / 1ps

// Define the inputs and outputs of the test bench
module tb_controller;

// Define the parameters for the test bench
parameter ROM_SIZE = 256; // size of microprogram memory
parameter PC_WIDTH = 8; // width of microprogram counter
parameter COND_WIDTH = 2; // width of conditional input

    reg clk, reset; // clock and reset signals
    reg [COND_WIDTH-1:0] cond; // conditional input from status register
    reg [PC_WIDTH-1:0] branch_addr; // branch address from instruction register
    wire [PC_WIDTH-1:0] mpc; // microprogram counter output
    wire [PC_WIDTH-1:0] rom_addr; // microprogram memory address input

    // Instantiate the controller module
    uPC_test uut (
        .clk(clk),
        .reset(reset),
        .cond(cond),
        .branch_addr(branch_addr),
        .mpc(mpc),
        .rom_addr(rom_addr)
    );

    // Define the initial values of the inputs
    initial begin
        clk = 0;
        reset = 1;
        cond = 0;
        branch_addr = 0;
    end

    // Define the clock signal with a period of 10 ns
    always begin
        #5 clk = ~clk;
    end

    // Define the stimulus for testing the controller behavior
    initial begin
        // Apply reset for 20 ns
        #20 reset = 0;

        // Test normal execution, mpc should increment by one every clock cycle
        #10 $display("Testing normal execution");
        #100 $display("mpc = %b", mpc);

        // Test conditional branch based on cond[0], mpc should branch to 8'hAA if cond[0] is 1, otherwise increment by one 
        #10 $display("Testing conditional branch based on cond[0]");
        cond = 2'b01;
        branch_addr = 8'hAA;
        #10 $display("cond = %b, branch_addr = %b", cond, branch_addr);
        #20 $display("mpc = %b", mpc);
                cond = 2'b00;
                #10 $display("cond = %b, branch_addr = %b", cond, branch_addr);
                #20 $display("mpc = %b", mpc);
        
                // Test conditional branch based on cond[1], mpc should branch to 8'hBB if cond[1] is 1, otherwise increment by one 
                #10 $display("Testing conditional branch based on cond[1]");
                cond = 2'b10;
                branch_addr = 8'hBB;
                #10 $display("cond = %b, branch_addr = %b", cond, branch_addr);
                #20 $display("mpc = %b", mpc);
                cond = 2'b00;
                #10 $display("cond = %b, branch_addr = %b", cond, branch_addr);
                #20 $display("mpc = %b", mpc);
        
                // Test inverse conditional branch based on cond[0], mpc should branch to 8'hCC if cond[0] is 0, otherwise increment by one 
                #10 $display("Testing inverse conditional branch based on cond[0]");
                cond = 2'b00;
                branch_addr = 8'hCC;
                #10 $display("cond = %b, branch_addr = %b", cond, branch_addr);
                #20 $display("mpc = %b", mpc);
                cond = 2'b01;
                #10 $display("cond = %b, branch_addr = %b", cond, branch_addr);
                #20 $display("mpc = %b", mpc);
        
                // Test inverse conditional branch based on cond[1], mpc should branch to 8'hDD if cond[1] is 0, otherwise increment by one 
                #10 $display("Testing inverse conditional branch based on cond[1]");
                cond = 2'b00;
                branch_addr = 8'hDD;
                #10 $display("cond = %b, branch_addr = %b", cond, branch_addr);
end
endmodule