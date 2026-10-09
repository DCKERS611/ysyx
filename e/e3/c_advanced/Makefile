CC = cc
CFLAGS = -Wall -g -DNDEBUG
EX20_CFLAGS = -Wall -g -o0 -D -DNDEBUG

.PHONY: all clean test
all: ex1 ex3 ex19 ex22_main ex24 ex25

ex1: ex1.c
	$(CC) $(CFLAGS) ex1.c -o ex1

ex3: ex3.c
	$(CC) $(CFLAGS) ex3.c -o ex3

ex19: ex19.o object.o
	$(CC) $(EX19_CFLAGS) ex19.o object.o -o ex19

ex19.o: ex19.c ex19.h object.h
	$(CC) $(EX19_CFLAGS) -c ex19.c -o ex19.o

object.o: object.c object.h
	$(CC) $(EX19_CFLAGS) -c object.c -o object.o

test: ex19
	sh ./test_ex19.sh ./ex19

ex22.o: ex22.c ex22.h dbg.h
	$(CC) $(CFLAGS) -c ex22.c -o ex22.o

ex22_main: ex22_main.c ex22.o ex22.h dbg.h 
	$(CC) $(CFLAGS) ex22_main.c ex22.o -o ex22_main

ex24: dbg.h ex24.c
	$(CC) $(CFLAGS) ex24.c -o ex24 

ex25: dbg.h ex25.c
	$(CC) $(CFLAGS) ex25.c -o ex25

ex31: ex31.c
	$(CC) $(CFLAGS) ex31.c -o ex31

clean:
	rm -f ex1 ex3 ex4 ex5 ex6 ex18 ex19 ex19.o object.o ex20 ex22_main ex22.o \
		ex24 ex25 ex31
