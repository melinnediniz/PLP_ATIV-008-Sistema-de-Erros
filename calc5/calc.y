/*
	Calculadora v.5 - Sistema de controle de erros de compilação - introdução
	Jucimar Jr
*/

%{

/* codigo em C */

#define YYSTYPE double
#include <stdio.h>
extern FILE* yyin;

int errors = 0;

void yyerror(char *s);
int yylex(void);
int yyparse();

%}

%token NUMBER EOL
%token PLUS MINUS DIVIDE TIMES
%token P_LEFT P_RIGHT

%left PLUS MINUS
%left TIMES DIVIDE
%left P_LEFT P_RIGHT

%locations
%error-verbose

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
	|	P_LEFT EXPRESSION P_RIGHT {$$ = $2;}
	;


%%

void yyerror(char *s)
{
	printf("Error: %s\n", s);
}

int main(int argc, char *argv[])
{
	if (argc == 1)
    {
		yyparse();
    }

	if (argc == 2)
	{
    	yyin = fopen(argv[1], "r");
	
		yyparse();
	
		if ( errors == 0)
			printf("Success!\n");
	}

	return 0;
}
