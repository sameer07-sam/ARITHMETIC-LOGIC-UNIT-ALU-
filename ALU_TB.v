// Testbench module for the ALU to verify all operations
module tb_ALU;

reg [3:0] A, B;               // Declare 4-bit registers for inputs A and B
reg [2:0] ALU_Sel;            // Declare 3-bit register for control signal
wire [3:0] ALU_Out;           // Wire to observe ALU output

// Instantiate the ALU module (Unit Under Test)
ALU uut (
    .A(A),                    // Connect A of testbench to A of ALU
    .B(B),                    // Connect B of testbench to B of ALU
    .ALU_Sel(ALU_Sel),        // Connect ALU_Sel of testbench to ALU
    .ALU_Out(ALU_Out)         // Connect output from ALU to ALU_Out wire
);

// Initial block for test sequence
initial begin
    // Display headers for output
    $display("A     B     ALU_Sel  Result");

    // Monitor changes in signals and print them continuously
    $monitor("%b  %b     %b       %b", A, B, ALU_Sel, ALU_Out);

    // Test Case 1: Addition
    A = 4'b0101; B = 4'b0011; ALU_Sel = 3'b000; #10;  // 5 + 3 = 8

    // Test Case 2: Subtraction
    A = 4'b0101; B = 4'b0011; ALU_Sel = 3'b001; #10;  // 5 - 3 = 2

    // Test Case 3: Bitwise AND
    A = 4'b0101; B = 4'b0011; ALU_Sel = 3'b010; #10;  // 0101 & 0011 = 0001

    // Test Case 4: Bitwise OR
    A = 4'b0101; B = 4'b0011; ALU_Sel = 3'b011; #10;  // 0101 | 0011 = 0111

    // Test Case 5: Bitwise NOT (only A is used)
    A = 4'b0101; B = 4'b0011; ALU_Sel = 3'b100; #10;  // ~0101 = 1010

    $finish; // End of simulation
end

endmodule  // End of testbench
