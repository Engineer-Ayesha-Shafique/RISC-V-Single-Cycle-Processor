rm -r build
mkdir build
/home/dell/Downloads/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14/bin/riscv64-unknown-elf-as -c -o build/asm_code.o ../../sim/asm_code.s -march=rv32i -mabi=ilp32
/home/dell/Downloads/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14/bin/riscv64-unknown-elf-gcc -o build/asm_code.elf build/asm_code.o -T linker.ld -nostdlib -march=rv32i -mabi=ilp32
/home/dell/Downloads/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14/bin/riscv64-unknown-elf-objcopy -O binary --only-section=.data* --only-section=.text* build/asm_code.elf build/asm_code.bin
python3 maketxt.py build/asm_code.bin > build/asm_code.txt
/home/dell/Downloads/riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14/bin/riscv64-unknown-elf-objdump -S -s build/asm_code.elf > build/asm_code.dump

cp "build/asm_code.txt" "../../inst.mem"