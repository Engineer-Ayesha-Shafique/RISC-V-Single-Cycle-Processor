![logo](https://riscv.org/wp-content/uploads/2018/06/RISC-V-Logo-2.png)
_________________

# RISC-V Single Cycle RV32I core

This is a Single Cycle processor running the RV32I implementation, hence a 32-bit CPU, written in __SystemVerilog__. It was made for learning purposes, it's not intended for production. Developed and Tested on [ModelSim](https://www.mentor.com/company/higher_ed/modelsim-student-edition)

## RISC-V reference

I recommend 100% to read the [RISC-V Reference Manual](https://github.com/riscv/riscv-isa-manual/releases/download/Ratified-IMAFDQC/riscv-spec-20191213.pdf), maybe not complete but those sections mentioning the RV32I implementation.

## Architecture

The architecture was heavily inspired by the 32-bit [Single Cycle MIPS processor](https://media.cheggcdn.com/media/b82/b820d7ac-b4c9-4dd7-af10-e3b3fbe250ff/phpPVaajI) explained in [Digital Design and Computer Architecture book](https://www.amazon.com/Digital-Design-Computer-Architecture-Harris/dp/0123944244/ref=pd_lpo_1?pd_rd_w=SEXjq&content-id=amzn1.sym.116f529c-aa4d-4763-b2b6-4d614ec7dc00&pf_rd_p=116f529c-aa4d-4763-b2b6-4d614ec7dc00&pf_rd_r=82ZAPW9VP21TKQM08AAT&pd_rd_wg=9EFiQ&pd_rd_r=75b9df90-d341-4fb2-b6dd-8ef3d3fa4219&pd_rd_i=0123944244&psc=1). Note that instruction and data are stored in separate memories.


### Simulator
For learning assembly language, I highly recommend using this simulator:
[08.12.2020] https://www.kvakil.me/venus/
This simulator has two parts: <br/>
- Editor - here we can write our code. When you click "Simulator" the code will be compiled[?] automatically.
- Simulator - here you can test the code and check the results
In the `Editor`  part I entered the code: <br/>
```
addi x1, x1, 0x1
addi x2, x1, 0x1
```
If you click `Reset`, the effect will be the same as a page refresh [?]. It means that all registers will be in factory state and we will go back to the first line of code.
`Step` is of course next code line, and `Prev` means the previous code line.
If you click `Dump` then at the bottom of the page in the `console output` field will appear machine code, which is executed by the processor.
```
00108093
00108113
```
If you click `Run`  all code will be executed. In this case, the x1 and x2 registers will change

On the left side you can see register numbers (from 0 to 31) with their mnemonics. The contents of registers are displayed in hexadecimal, this is the default. If you want to change it, in this part of page, at the bottom you have drop-down list `Display Settings`. There you can choose how you want to display the numbers: hexadecimal, decimal, unsigned or ASCII. In this part of page you have two bookmarks: `Registers` (I just described this part) and `Memory`. If you switch to the `Memory` tab, then you can see what is in the memory part: Text, Data, Heap or Stack. The default is Text.

Very important thing. If you go from the `Simulator` tab to the `Editor` it will be the same as clicking on the `Reset` button, so all registers will return to the factory state.

### Documentation
The documentation consists of three documents:
1. User-Level ISA Specification <br/>
There is the user-level ISA specification. The most important thing is that it discusses the basic instructions and core elements. Here are highlighted instructions for RV32I, RV32E, RV64I and RV128I. What ISA means is in [Terms needing explanation](#terms).
Link v2.2 [13.12.2020]: https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf
2. Privileged ISA specification <br/>
It describes the elements of the processor, which are related to the management of priority levels. It's used to how to start the operating system. Also are defined here as interrupt handling or physical memory management.
Link v1.10 [13.12.2020]: https://riscv.org/wp-content/uploads/2017/05/riscv-privileged-v1.10.pdf
3. Debug specification <br/>
Describes a standard, that enables debugging.
Link 0.13.2 [13.12.2020]: https://riscv.org/wp-content/uploads/2019/03/riscv-debug-release.pdf


