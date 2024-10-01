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


Stack: stores local variables
Heap: dynamic memory for programmer to allocate

High address
Stack 
 ↓


 ↑
Heap
Low address

To get the base address
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
