%{
#include <stdio.h>
#include <string.h>
#include "parser.tab.h"
void Errors();
%}

%%

[0-9]+              { yylval=atoi(yytext); return INTEGER; }
"x"                 {return X;}
"+"                 { return SUM; }
"-"                 { return SUB; }
"*"                 { return MUL; }
"/"                 { return DIV; }
"("                 { return OBRACE; }
")"                 { return EBRACE; }
"^"                 { return DEGREE;}
"sqrt"              { return SQRT;}
"sin"               { return SIN;}
"cos"               { return COS;}
"ln"                { return LOG10;}
"e"                 { return EXP;}
=                   { return EOL; }
[ \t\n\r]+          ; /* skip whitespaces */
.                   { Errors();}

%%

void Errors(){
    printf("Something went wrong");
}