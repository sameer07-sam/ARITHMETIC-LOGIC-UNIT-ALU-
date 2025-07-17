// ALU module declaration with inputs A, B, ALU_Sel and output ALU_Out
module ALU (
    input [3:0] A,         // 4-bit input operand A
    input [3:0] B,         // 4-bit input operand B
    input [2:0] ALU_Sel,   // 3-bit control signal to select ALU operation
    output reg [3:0] ALU_Out  // 4-bit output from ALU (registered output)
);

// Combinational always block that triggers whenever inputs change
always @(*) begin
    // Case block to select operation based on ALU_Sel value
    case (ALU_Sel)
        3'b000: ALU_Out = A + B;        // If ALU_Sel is 000 -> Perform addition: A + B
        3'b001: ALU_Out = A - B;        // If ALU_Sel is 001 -> Perform subtraction: A - B
        3'b010: ALU_Out = A & B;        // If ALU_Sel is 010 -> Perform bitwise AND: A & B
        3'b011: ALU_Out = A | B;        // If ALU_Sel is 011 -> Perform bitwise OR: A | B
        3'b100: ALU_Out = ~A;           // If ALU_Sel is 100 -> Perform bitwise NOT on A: ~A
        default: ALU_Out = 4'b0000;     // If none match, output default 0
    endcase
end

endmodule  // End of ALU module
