%{
#include <stdio.h>
#include <string.h>
#include "lab3_2.tab.h"

int yylex(void);
void yyerror(const char *str);
int main(int argc, char **argv);
%}

%token INTEGER 
%token SUM SUB
%token OBRACE EBRACE
%token EOL
%token NUMBER

%%

calclist: /* nothing */
| calclist exp EOL { printf("= %d\n", $2); }
;

exp: factor
| exp SUM factor { $$ = $1 + $3; }
| exp SUB factor { $$ = $1 - $3; }
;

factor: INTEGER
| OBRACE exp EBRACE { $$ = $2; }
;

%%

void yyerror(const char *str){
    fprintf(stderr,"Error: %s\n",str);
}
