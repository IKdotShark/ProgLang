%{
#include "y.tab.h"
%}

%%
[0-9]+         { yylval = atoi(yytext); return NUMBER; }
[-+*/\n]       { return *yytext; }
[ \t]          ; // Пропустить пробелы и табуляции
.              { printf("Uncorrect simbol: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}
