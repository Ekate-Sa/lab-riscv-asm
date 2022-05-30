.PHONY: clean

dump_name=esa_lab1.dump
executable_name=esa_lab1.elf

default: $(dump_name) $(executable_name)

%.elf : main.c
	@riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 $< -o $@

%.dump: %.elf
	@riscv64-unknown-elf-objdump -D $< > $@

clean:
	@rm -f $(dump_name)
	@rm -f $(executable_name)