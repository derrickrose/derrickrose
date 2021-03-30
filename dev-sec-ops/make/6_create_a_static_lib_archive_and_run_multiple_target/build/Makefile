COMPILE = gcc
C_FLAG = -c -Wall
O_FLAG = -o
ARCHIVE = ar 
AR_FLAG = -rc
INCLUDE = -I../header
SRC = ../src
REMOVE = rm -rf 

## to say what is the default goal
.DEFAULT_GOAL := all

all : archive clean

archive : OBJS
	$(ARCHIVE) $(AR_FLAG) mymathlib.a my_math.o
	

OBJS : 
	$(COMPILE) $(C_FLAG) $(SRC)/*.c $(INCLUDE)

clean : 
	$(REMOVE) *.o calculator
	

	
clean_all :
	$(REMOVE) *.o *.a calculator