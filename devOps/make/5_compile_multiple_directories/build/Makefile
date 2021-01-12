COMPILE = gcc
C_FLAG = -c -Wall
O_FLAG = -o
INCLUDE = -I..\header
SRC = ..\src
REMOVE = rm -rf 

calculator : OBJS
	$(COMPILE) calculator.o my_math.o $(O_FLAG) calculator
	

OBJS : 
	$(COMPILE) $(C_FLAG) $(SRC)\*.c $(INCLUDE)

clean : 
	$(REMOVE) *.o calculator