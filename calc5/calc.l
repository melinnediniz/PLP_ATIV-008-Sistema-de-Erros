/*
	Calculadora v.5 - Sistema de controle de erros de compilação - introdução
	Jucimar Jr
*/

%{
#define YYSTYPE double
#include "calc.tab.h" 
#include <stdlib.h>

%}

%option case-insensitive
%option yylineno 

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
.           {}
%%


