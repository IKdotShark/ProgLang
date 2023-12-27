%{
#include <stdio.h>
#include <string.h>
#include "parser.tab.h"
void Errors();
%}

%%

[0-9]+(\.[0-9]+)?   { yylval.num = atof(yytext); return NUMBER; }
"x"                 { return X; }
"+"                 { return SUM; }
"-"                 { return SUB; }
"*"                 { return MUL; }
"/"                 { return DIV; }
"("                 { return LPAREN; }
")"                 { return RPAREN; }
"sin"               { return SIN; } /* cos(x) */
"cos"               { return COS; } /* -sin(x) */
"ln"                { return LN; } /* 1/x */
"tan"               { return TAN; } /* 1/cos^2(x) */
"ctan"              { return CTAN; } /* -1/sin^2(x) */
"^"                 { return DEGREE; } /* x^a = a * x^(a-1) */
"\n"                { return EOL; }
[ \t]               { }
.                   { Errors(); }

%%

void Errors(){
    printf("Something went wrong");
}

int yywrap() {
    return 1;
}
