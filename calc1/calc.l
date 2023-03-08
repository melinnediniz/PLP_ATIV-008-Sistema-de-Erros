/*
	Calculadora v.1 - trabalha apenas com inteiros
	Jucimar Jr
*/

%{
#include "calc.tab.h" 
#include <stdlib.h>

void yyerror(char *s); 

%}

%%
[0-9]+		{ yylval = atoi(yytext); return NUMBER; }
[\n]		{ return EOL; }
[+]			{ return PLUS; }
[-]			{ return MINUS; }
[/]			{ return DIVIDE; }
[*]			{ return TIMES; }
[[:space:]]	;
.			{ yyerror("Undefined token\n"); }

%%

int yywrap()
{
	return 1;
}

