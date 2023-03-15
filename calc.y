/*
	Calculadora v.6 - Sistema de controle de erros de compilação - yyerror + linha
	Jucimar Jr
*/

%{

/* codigo em C */

#define YYSTYPE double
#include <stdio.h>
#include <string.h>

extern FILE* yyin;
extern int yylineno;
extern char *yytext;

//int yyerror(char *s, int linha, char *mensagem );
//int yyerror(char *msg, int error_line_number, char *error_msg);

void yyerror(char *s);
int yylex();
int yyparse();

int errors = 0;
char *teste;

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


int main(int argc, char *argv[])
{
	if (argc == 1)
    {
		yyparse();
    }

	if (argc == 2)
	{
    	yyin = fopen(argv[1], "r");
		
		printf("\nCompiling ... \n");
		
		yyparse();
	
		if ( errors == 0)
			printf("\nSuccess!\n");
	}

	return 0;
}


void yyerror(char *s)
{
	printf("Error: Line: %d  Msg:%s\n\n", yylineno, s);
	printf("Error2: Line: %d  Msg:%s\n\n", yylineno, teste);
}

/*
int yyerror(char *s, int linha, char *mensagem ) 
{ 

	if ( s != NULL ) 
		if ( mensagem != NULL )
			if ( linha < 10000)
				printf ("Linha: %d ---------> ERRO: %s %s \n", linha, s );
	
	return 0;
}
*/