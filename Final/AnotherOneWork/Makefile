CC = gcc
FLEX = flex
BISON = bison
CFLAGS = -Wall

test: lex.yy.c parser.tab.c
	$(CC) $(CFLAGS) -o $@ $^ -lm

lex.yy.c: lexer.l
	$(FLEX) $<

parser.tab.c parser.tab.h: parser.y
	$(BISON) -d $<

clean:
	rm -f test lex.yy.c parser.tab.c parser.tab.h

.PHONY: clean