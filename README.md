# ALU in Verilog

## Overview

In this project, I implemented an **Arithmetic Logic Unit (ALU)** in Verilog to perform a variety of arithmetic and logical operations on two N-bit inputs. My goal was to design a **parameterized module** that supports operations such as addition, subtraction, AND, OR, set-less-than (SLT), XOR, and NOR, controlled by a 3-bit signal.

For example, with `N=4`, inputs `a=0110` and `b=0111`, and `control=000 (ADD)`, the output is `out=1101` with `overflow=0`.

The operations are handled using a `case` statement and include `overflow` and `zero` flags for arithmetic and condition checking. A **testbench** verifies functionality for all control combinations using specified input values.

---

##  Module: ALU

### ✅ What I Did
I designed a **parameterized ALU** to perform multiple operations on N-bit inputs.

### ⚙️ Parameters
- `N`: Bit width of inputs and output (default: 4)

### 📥 Inputs
- `a[N-1:0]`: First N-bit input  
- `b[N-1:0]`: Second N-bit input  
- `control[2:0]`: 3-bit control signal to select the operation

### 📤 Outputs
- `out[N-1:0]`: N-bit result of the operation  
- `overflow`: Set for ADD/SUB if carry/borrow occurs  
- `zero`: Set if output is zero

### 🔍 How It Works
Defined operations using localparams:

- `000`: ADD → `out = a + b`, `overflow = carry`
- `001`: SUB → `out = a - b`, `overflow = borrow`
- `010`: AND → `out = a & b`
- `011`: OR  → `out = a | b`
- `100`: SLT → `out = (a < b) ? 1 : 0`
- `101`: XOR → `out = a ^ b`
- `110`: NOR → `out = ~(a | b)`

The `zero` flag is asserted when `out == 0`.

---

## 🧪 Testbench: ALU_tb

### ✅ What I Did
Created a testbench to verify the ALU’s behavior.

### 🧭 How It Works
- Instantiates a 4-bit ALU (`N=4`)
- Inputs: `a=0110`, `b=0111`
- Iterates `control` from 0 to 6, running each for 10 ns
- Additional test with `a=0000`, `b=0000` to check `zero` flag
- Uses `$display` to log `a`, `b`, `control`, `out`, `overflow`, and `zero`
- Ends simulation with `$finish`

---



## 🧰 Purpose
To ensure the ALU correctly performs all supported operations and appropriately sets the `overflow` and `zero` flags.

---

## 📁 Files

- `ALU.v`: Verilog module for the ALU  
- `ALU_tb.v`: Testbench for simulation

---



## 📉 Simulation Waveform

![Screenshot 2025-06-30 131349](https://github.com/user-attachments/assets/ab049c59-56b6-4e1d-bc67-8e8575754888)

---

## 🖥️ Console Output

![Screenshot 2025-06-30 131409](https://github.com/user-attachments/assets/5ceb9ead-8389-4ac9-9170-af0e026c4b0f)

---
