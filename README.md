Compilers:  
gcc
clang

Just compile the program
```
gccprogram.c -o program
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
