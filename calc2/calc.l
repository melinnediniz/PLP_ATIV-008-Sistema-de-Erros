/*
	Calculadora v.2 - trabalha com float
	Jucimar Jr
*/

%{
#define YYSTYPE double
#include "calc.tab.h" 
#include <stdlib.h>

void yyerror(char *s); 
%}

%%

[0-9]+("."[0-9]+)? 	{ yylval = atof(yytext); return NUMBER; }
[\n]				{ return EOL; }
[+]					{ return PLUS; }
[-]					{ return MINUS; }
[/]					{ return DIVIDE; }
[*]					{ return TIMES; }
[[:space:]]			;
.					{ yyerror("Undefined token\n"); }

%%

int yywrap()
{
	return 1;
}

