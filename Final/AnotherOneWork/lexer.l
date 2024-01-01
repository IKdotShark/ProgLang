%{
#define YYSTYPE int
extern int yylval;
#include <stdio.h>
#include <string.h>
#include "parser.tab.h"
%}

%%
time				    { return TIME; }
motion			        { return MOTION; }
detected|not_detected	{ yylval=!strcmp(yytext,"detected");return DETECTION; }
on|off			        { yylval=!strcmp(yytext,"on");return STATE; }
degrees			        { return DEGREES; }
pc				        { return PC; }
music                   { return MUSIC; }
track                   { return TRACK; }
program			        { return PROGRAM; }
[0-9]+ 			        { yylval=atoi(yytext); return NUMBER; }
check				    { return CHECK; }
heater			        { return HEATER; }
danger                  { return DANGER; }
[\t]+                   {   }
\n;
%%