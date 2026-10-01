CC=cc
CFLAGS=-Wall -g -DNDEBUG
LIBS=-ldl

all: ex29 libex29.so

libex29.o: libex29.c
	$(CC) -c libex29.c -o libex29.o -fPIC

libex29.so: libex29.o
	$(CC) -shared -o libex29.so libex29.o

ex29: ex29.c
	$(CC) $(CFLAGS) ex29.c -ldl -o ex29

clean:
	rm -f libex29.o libex29.so ex29
