# 🎛 8-bit Microcontroller for Artix-7 100T FPGA Trainer Board

**A custom 8-bit microcontroller implemented in VHDL for the Artix-7 100T FPGA trainer board.**

---

## 📌 Overview

This project implements a custom 8-bit microcontroller in VHDL, designed to run on the Artix-7 100T FPGA trainer board. The microcontroller is built to be simple and educational, providing a hands-on experience in digital design and FPGA programming. It includes basic components such as an ALU, registers, and a simple instruction set.

---

## 🧪 Features

- **8-bit ALU**: Performs basic arithmetic and logical operations.
- **Registers**: Includes general-purpose registers for data storage.
- **Instruction Set**: A simple set of instructions for control and data manipulation.
- **Clocked Operation**: Synchronized with the FPGA's clock for reliable timing.

---

## 📂 Project Structure

```bash
Microcontroller/
├── README.md # Project documentation
├── constrs_1/ # Constraints for FPGA implementation
├── sources_1/ # VHDL source files for the microcontroller
├── Instructions.txt # Text file with instructions for use
└── Microcontroller documentation.pdf # Detailed documentation in PDF format
```

---

## 🚀 How to Run

1. **Clone the repository**:
   ```bash
   git clone https://github.com/ralu2004/Microcontroller.git
   cd Microcontroller
   ```
2. **Open the project in your preferred FPGA development environment (e.g., Xilinx Vivado).**
3. **Add the source files:**
   - Include all files from the sources_1/ directory.
4. **Add the constraints:**
   - Include all files from the constrs_1/ directory.
5. **Compile the design:**
   - Run the synthesis and implementation processes.
6. **Program the FPGA:**
   - Load the bitstream onto the Artix-7 100T FPGA trainer board.
7. **Test the microcontroller:**
   - Follow the instructions in Instructions.txt to test the microcontroller's functionality.

---

## 📄 Documentation

- **Instructions.txt:** Provides step-by-step instructions for setting up and testing the microcontroller.
- Microcontroller **documentation.pdf**: A detailed PDF document explaining the design and functionality of the microcontroller.

---

## 📄 License

This project is licensed under the MIT License.

---

## 📬 Contact

GitHub profile: https://github.com/ralu2004
