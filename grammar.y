%{
	#include <ctype.h>
	#include <stdio.h>
	#define YYSTYPE double /* double type for Yacc stack */
	
	extern int yylex();
	void yyerror(char *msg);
%}

%token false
%token true
%token or
%token and
%token not

%%
lines	: lines bexpr '\n' { if($2 == 1){
			 printf("true(%g)\n", $2) ;
			 }
			 else{
			 printf("false(%g)\n", $2) ;
			 }
							}
		| lines '\n'
		| /* empty */
		;
		
bexpr	: bexpr or bterm	{ $$ = $1 || $3 }
		| bterm;
bterm	: bterm and bfactor { $$ = $1 && $3 }
		| bfactor;

bfactor	: not bfactor { $$ = !$2 }
		| '(' bexpr ')' { $$ = $2 }
		| true
		| false;
%%

#include "lex.yy.c"

void yyerror(char *msg){
	printf("Error de sintaxis");
	exit(0);
}

int main(){
	yyparse();
	return 0;
}