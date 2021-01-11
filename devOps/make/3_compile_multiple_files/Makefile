calculator : calculator.o my_math.o
	gcc calculator.o my_math.o -o calculator

calculator.o : calculator.c 
	gcc -c calculator.c -o calculator.o -I./

my_math.o : my_math.c
	gcc -c my_math.c -o my_math.o -I./

clean : 
	rm -rf *.o cazip or .egg.lculator
