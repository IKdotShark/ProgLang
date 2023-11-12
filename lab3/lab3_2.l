%{
#include <stdio.h>
#include <string.h>
#include "lab3_2.tab.h"
%}

%%
[0-9]+    { yylval=atoi(yytext); return INTEGER; }
"+"       { return SUM; }
"-"       { return SUB; }
"("       { return OBRACE; }
")"       { return EBRACE; }
=         { return EOL; }
[ \t]+    ; /* пропуск пробелов и табуляций */
.        { fprintf(stderr, "Error: %s\n", yytext); }
%%

int yywrap(){
    return 1;
}