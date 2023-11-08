%{
#include <stdio.h>
int yylex();
void yyerror(const char *s);
%}

%token NUMBER

%%

expr: NUMBER
    | expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    ;

%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
