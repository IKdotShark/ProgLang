CC = gcc
LEX = flex
YACC = bison
CFLAGS = -Wall -std=c99
LIBS = -lm

calculator: lex.yy.c parser.tab.c
	$(CC) $(CFLAGS) -o calculator lex.yy.c parser.tab.c $(LIBS)

lex.yy.c: lexer.l
	$(LEX) lexer.l

parser.tab.c: parser.y
	$(YACC) -d parser.y

clean:
	rm -f calculator lex.yy.c parser.tab.c parser.tab.h
