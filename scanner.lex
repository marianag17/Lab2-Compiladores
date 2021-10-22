/*%{
#define NOT 251
#define OR 252 
#define AND 253
#define BOOLEAN 26
%} */

TRUE true
FALSE false
OR or
AND and
NOT not

%%
[ \t]		; { /* Espacios en blanco */ }
{TRUE}	{ 
				yylval = 1;
				return true; 
			}
{FALSE}	{ 
				yylval = 0;
				return false; 
			}
{OR} {return or;}
{AND} {return and;}
{NOT} {return not;}
[\)\(*/\n]	return yytext[0];
.		printf("Error\n");
%%

int yywrap(void)
{
	return 0;
}

/* main(){
	int token;
	token = yylex();
	while (token){
		printf("%d\n", token);
		token = yylex();
	}
} */