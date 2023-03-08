/*
	Calculadora v.2 - Trabalha com float
	Jucimar Jr
*/

%{
#define YYSTYPE double
#include <stdio.h>

void yyerror(char *s);
int yylex(void);
int yyparse();
%}

%token NUMBER EOL
%token PLUS MINUS DIVIDE TIMES

%left PLUS MINUS
%left TIMES DIVIDE

%%

STATEMENT:
	STATEMENT EXPRESSION EOL {$$ = $2; printf("Resultado: %f\n", $2);}
	|
	;

EXPRESSION:
	NUMBER {$$ = $1;}
	|	EXPRESSION PLUS EXPRESSION {$$ = $1 + $3;}
	|	EXPRESSION MINUS EXPRESSION {$$ = $1 - $3;}
	|	EXPRESSION TIMES EXPRESSION {$$ = $1 * $3;}
	|	EXPRESSION DIVIDE EXPRESSION {$$ = $1 / $3;}
	;


%%

void yyerror(char *s)
{
	printf("Error: %s\n", s);
}

int main(int argc, char *argv[])
{
	yyparse();
	return 0;
}
