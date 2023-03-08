/*
	Calculadora v.4 - Lê de arquivos ou linha de comando
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
[(]					{ return P_LEFT;}
[)]					{ return P_RIGHT;}
[[:space:]]			;
.					{ yyerror("Undefined token\n"); }

%%

int yywrap()
{
	return 1;
}

