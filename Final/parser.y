%{
#include <stdio.h>
#include <math.h>
#include <string.h>

char* _sin();    
char* _cos();
char* _ln();
char* _tan();
char* _CTAN();

extern int yylex();
void yyerror(const char *s);
%}

%union {
    double num;
}

%token <num> NUMBER
%token SIN COS LN TAN CTAN SUM SUB MUL DIV LPAREN RPAREN EOL X DEGREE

%type <num> expression

%left SUM SUB
%left MUL DIV

%%
commands:
    | commands command
    ;

command:
    EOL
    | expression EOL { printf("Result: %f\n", $1); }
    | derivative_command EOL
    ;

expression:
    NUMBER
    | expression SUM expression { $$ = $1 + $3; }
    | expression SUB expression { $$ = $1 - $3; }
    | expression MUL expression { $$ = $1 * $3; }
    | expression DIV expression { $$ = $1 / $3; }
    | X { $$ = 0; /* Просто игнорировать x */ }
    | LPAREN expression RPAREN { $$ = $2; }
    ;

derivative_command:
     SIN LPAREN X RPAREN { printf("Derivative: %s\n", _sin()); }
    |  COS LPAREN X RPAREN { printf("Derivative: %s\n", _cos()); }
    |  LN LPAREN X RPAREN { printf("Derivative: %s\n", _ln()); }
    |  TAN LPAREN X RPAREN { printf("Derivative: %s\n", _tan()); }
    |  CTAN LPAREN X RPAREN { printf("Derivative: %s\n", _CTAN()); }
    ;


%%

int main() {
    printf("Input simple function with x:\n");
    return yyparse();
}

char* _sin() {
    static char result[50];
    strcpy(result, "cos(x)");
    return result;
}

char* _cos() {
    static char result[50];
    strcpy(result, "-sin(x)");
    return result;
}

char* _ln() {
    static char result[50];
    strcpy(result, "1/x");
    return result;
}

char* _tan() {
    static char result[50];
    strcpy(result, "1/cos^2(x)");
    return result;
}

char* _CTAN() {
    static char result[50];
    strcpy(result, "-1/sin^2(x)");
    return result;
}

void yyerror(const char *s) { 
    fprintf(stderr, "Error: %s\n", s); 
}
