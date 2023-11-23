#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

//Globals
#define n 100 
char InfixExpr[n];
nInfix = 0;
char PostfixExpr[n];
nPostfix = 0;

//hooks cheker
void factor() { 	
   	if (isdigit(InfixExpr[nInfix])) {
   		PostfixExpr[nPostfix++] = InfixExpr[nInfix++];
    } else if (InfixExpr[nInfix] == '(') {
       	nInfix++;
   	    expr();
        if (InfixExpr[nInfix] == ')') {
 	        nInfix++;
        } else {
             perror("Error with hooks");
             exit(0);
       	}
    } else {
    	perror("Unknown simbol");
    	exit(0);
    }
}

//Multipl and division
void MultiplAndDivision() {
   if (InfixExpr[nInfix] == '*' || InfixExpr[nInfix] == '/') {
     	char oper = InfixExpr[nInfix++];
   	    factor();
        MultiplAndDivision();
        PostfixExpr[nPostfix++] = oper;
    }
} 

void term() {
    factor(); 
    MultiplAndDivision();
}

//Addition and subtraction
void AddandSub() { 
    if (InfixExpr[nInfix] == '+' || InfixExpr[nInfix] == '-') {
        char oper = InfixExpr[nInfix++];
        term();
        AddandSub();
        PostfixExpr[nPostfix++] = oper;
    }
}

void expr() {
    term();	   
    AddandSub();
}

void parse() {
    expr();
    printf("Postfix expretion: %s\n", PostfixExpr);
}

/*
Broadcast scheme

factor -> expr
	| digit { post[index] := digit || index++ }

term -> factor MultiplAndDivision
MultiplAndDivision -> *factor { post[index] := ‘*’ || index++ } MultiplAndDivision
	| / factor { post[index] := ‘/’ || index++ } MultiplAndDivision
	| e

expr -> term AddandSub
AddandSub -> + term { post[index] := ‘+’  || index++} AddandSub
	| - term { post[index] := ‘-’ || index++ } AddandSub
	| e
 
parse → expr { print(expr) }
*/

int main() {
    printf("Infix expretion: ");
    scanf("%s", InfixExpr);
    parse();
}
