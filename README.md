Compilers:  
gcc
clang

Just compile the program
```
gcc program.c -o program
```

Compile with debug information
```
gcc -g program.c -o program
```

Enables all warnings, includes debugging information and optimizes the code for better performance
```
gcc -Wall -g -O2 program.c -o program
```

Compiles to assembly
```
gcc -S program.c
```


### Stack and Heap
Stack: stores local variables
Heap: dynamic memory for programmer to allocate

High address
Stack 
 ↓


 ↑
Heap
Low address

### To get the base address
1. With readelf (look for entry point address)
```readelf -a ./work
```
2. With gdb (look at Start Addr)
```
gdb ./work
break main
run
info proc mappings
```

### Read a binary
Show contents of data section
```
objdump -s -j .rodata work # or
readelf -x .rodata work
```

### Converting
With python:
HEX TO BIN
```
bin(0x7f)                       # '0b1111111'
"{0:08b}".format(0x7f)          # '01111111'
"{0:016b}".format(0x7f)          # '0000000001111111'
```

HEX TO ASCII
```
hex_str = '7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00 03 00 3e 00 01 00 00 00 60 10 00 00 00 00'
hex_str = hex_str.replace(' ', '')
bytearray.fromhex(hex_str).decode(encoding='ascii')
```

ASCII TO HEX
```
ord('A') # 65
hex(65)  # 0x41

ascii_str = 'Hello'
' '.join(format(ord(c), '02x') for c in ascii_str)
```
