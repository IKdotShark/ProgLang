CC = gcc
FLEX = flex
BISON = bison
CFLAGS = -Wall

calculator: lex.yy.c parser.tab.c
	$(CC) $(CFLAGS) -o $@ $^ -lm

lex.yy.c: lexer.l
	$(FLEX) $<

parser.tab.c parser.tab.h: parser.y
	$(BISON) -d $<

clean:
	rm -f calculator lex.yy.c parser.tab.c parser.tab.h

.PHONY: clean
