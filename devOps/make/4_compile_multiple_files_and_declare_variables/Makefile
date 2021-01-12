COMPILE = gcc
C_FLAG = -c
O_FLAG = -o
INCLUDE = -I
REMOVE = rm -rf 

calculator : calculator.o my_math.o
	$(COMPILE) calculator.o my_math.o $(O_FLAG) calculator

calculator.o : calculator.c 
	$(COMPILE) $(C_FLAG) calculator.c $(O_FLAG) calculator.o $(INCLUDE).

my_math.o : my_math.c
	$(COMPILE) $(C_FLAG) my_math.c $(O_FLAG) my_math.o $(INCLUDE).

clean : 
	$(REMOVE) *.o calculator
