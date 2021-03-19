#Example make file for building our awesome c code
CC=gcc
CFLAGS=-I.

PREFIX=/usr/bin

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

helloworld: helloworld.o
	$(CC) -o helloworld helloworld.o

.PHONY: clean
clean:
	rm -f helloworld helloworld.o

.PHONY: install
install: helloworld
	mkdir -p $(DESTDIR)$(PREFIX)
	cp $< $(DESTDIR)$(PREFIX)/helloworld

.PHONY: uninstall
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/helloworld
