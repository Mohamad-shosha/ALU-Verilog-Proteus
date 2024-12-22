# 4-bit ALU Design with Verilog and Proteus

## Project Overview

This project implements a **4-bit Arithmetic Logic Unit (ALU)** using **Verilog** for hardware description and **Proteus** for simulation. The ALU performs basic **AND**, **XOR**, **ADD**, and **MULTIPLICATION** operations on 4-bit data, providing a fundamental understanding of digital systems and processor design.

## Project Components

- **Verilog Code**: Describes the functionality of the 4-bit ALU. The ALU can perform **AND**, **XOR**, **ADD**, and **MULTIPLICATION** based on control signals.
- **Proteus Simulation**: A schematic representation of the ALU, demonstrating its functionality with a testbench and simulation of inputs and outputs.
- **Testbench**: A Verilog testbench is used to test the ALU's functionality by providing various input values and checking the outputs.

## Key Features

- **4-bit ALU**: Capable of handling 4-bit data for arithmetic and logic operations.
- **Arithmetic Operations**: **Addition** and **Multiplication**.
- **Logic Operations**: **AND** and **XOR**.
- **Control Signals**: The ALU supports control signals to select the operation mode, such as selecting between arithmetic and logic operations.
- **Simulation**: The project includes a Proteus simulation that demonstrates how the ALU works in a real environment.

## Technologies Used

- **Verilog**: For hardware description and implementation of the ALU functionality.
- **Proteus**: For simulating the ALU and testing its operations in a schematic environment.
- **Testbench (Verilog)**: To verify and test the ALU design by providing a set of input signals and checking the expected results.

## Files Included

- **alu.v**: Verilog code for the 4-bit ALU.
- **testbench.v**: Verilog testbench to simulate and test the ALU design.
- **proteus.iss**: Proteus simulation file that shows the ALU circuit and allows interaction through the simulated environment.

## How to Run

1. **Compile the Verilog Code**:
   - Use any Verilog simulator (e.g., ModelSim or Vivado) to compile the **alu.v** file.
   
2. **Set Up Proteus Simulation**:
   - Open the **proteus.iss** file in **Proteus** to view the ALU circuit schematic.
   - You can interact with the simulation, providing inputs to the ALU and observing the outputs.

3. **Test the ALU**:
   - Provide different input values for the ALU operations (e.g., adding or multiplying two 4-bit numbers).
   - Use the testbench to simulate different scenarios and verify the ALU's correctness.

## Key Features

- **4-bit ALU**: Performs operations on 4-bit input values.
- **Arithmetic Operations**:
  - **Addition** (A + B)
  - **Subtraction** (A - B)
  - **Multiplication** (A * B)
- **Logical Operations**:
  - **AND** (A & B)
  - **OR** (A | B)
  - **XOR** (A ^ B)
  - **XNOR** (A ~^ B)
  - **NOT** (~A)
  - **NOR** (~|A)
- **Shift Operations**:
  - **Left Shift** (A << 1)
  - **Right Shift** (A >> 1)
- **Bitwise Operations**:
  - **AND all bits** of A (`&A`)
  - **OR all bits** of A (`|A`)
  - **XOR all bits** of A (`^A`)
  - **NAND** (~&A)

## Technologies Used

- **Verilog**: Hardware description language used for designing the ALU.
- **Proteus**: Circuit simulation tool used to visualize and test the ALU behavior.
- **Testbench (Verilog)**: Used for simulating and verifying the ALU functionality by applying test inputs.

## File Structure

- **alu.v**: Verilog code for the 4-bit ALU.
- **testbench.v**: Verilog testbench for simulating and verifying the ALU's operations.
- **proteus.iss**: Proteus simulation file demonstrating the ALU behavior in a schematic environment.

## ALU Verilog Code

```verilog
module ALU(input [3:0] A, B, OP, output reg [3:0] alu_out);
    always @(*) begin
        case(OP)
            4'b0000 : alu_out = 0;        // Zero output
            4'b0001 : alu_out = A + B;    // Add
            4'b0010 : alu_out = A - B;    // Subtract
            4'b0011 : alu_out = A & B;    // AND
            4'b0100 : alu_out = A | B;    // OR
            4'b0101 : alu_out = ~A;       // NOT A
            4'b0110 : alu_out = ~|A;      // NOR (NOT OR of A)
            4'b0111 : alu_out = A ^ B;    // XOR
            4'b1000 : alu_out = A ~^ B;   // XNOR
            4'b1001 : alu_out = A << 1;   // Left Shift A by 1
            4'b1010 : alu_out = A >> 1;   // Right Shift A by 1
            4'b1011 : alu_out = &A;       // AND all bits of A
            4'b1100 : alu_out = |A;       // OR all bits of A
            4'b1101 : alu_out = ~&A;      // NAND (NOT AND of A)
            4'b1110 : alu_out = ^A;       // XOR all bits of A
            4'b1111 : alu_out = 4'b1111;  // Constant output 4'b1111
            default : alu_out = 0;        // Default case
        endcase
    end
endmodule


```verilog
module ALU (input [3:0] A, B, input [2:0] ALUOp, output reg [3:0] result);

    always @(A, B, ALUOp) begin
        case (ALUOp)
            3'b000: result = A & B;   // AND
            3'b001: result = A ^ B;   // XOR
            3'b010: result = A + B;   // ADD
            3'b011: result = A * B;   // MULTIPLICATION
            default: result = 4'b0000; // Default case
        endcase
    end
endmodule
```
