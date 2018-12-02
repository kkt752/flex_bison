%{
#include<stdio.h>
#include<string.h>
#include "First.tab.h"
void yyerror(const char *);
%}
%option nounput yylineno	

%%

[ \t\n]                     { /* DO NOTHING */ }
"//".*                     { /* DO NOTHING */ }
[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]      { /* DO NOTHING */ }
[/][*]                     { fprintf(stderr, "Unterminated comment"); }

"mainprog"			{ return MAINPROG; }
"var"				{ return VAR; }
"array"				{ return ARRAY; }
"of"				{ return OF; }
"function"				{ return FUNCTION; }
"procedure"			{ return PROCEDURE; }
"begin"				{ return BEGIN_R; }
"end"				{ return END_R; }
"if"				{ return IF; }
"then"				{ return THEN; }
"else"				{ return ELSE; }
"nop"				{ return NOP; }
"while"				{ return WHILE; }
"return"				{ return RETURN; }
"print"      			{ return PRINT; }
"int"				{ yylval.I = 1; return INT; }
"float"				{ yylval.I = 2; return FLOAT; }


[a-zA-Z][a-zA-Z0-9]*                      yylval.varName = yytext;  return ID;

[0-9]+|-[0-9]+                                                  yylval.I = atoi(yytext); return Integer;

([0-9]+)\.[0-9]+|-([0-9]+)\.[0-9]+                                  yylval.F = atof(yytext);  return Float;



"+"				{ return OP01; }
"-"				{ return OP02; }
"*"				{ return OP03; }
"/"				{ return OP04; }
"<"				{ return OP05; }
">"				{ return OP06; }
">="				{ return OP07; }
"<="				{ return OP08; }
"=="				{ return OP09; }
"!="				{ return OP10; }
"!"				{ return OP11; }
";"				{ return SEMICOL_T; }
"."				{ return DOT_T; }
","				{ return COMMA_T; }
"="				{ return EQU_T; }
"("				{ return SMALLPL_T; }
")"				{ return SMALLPR_T; }
"["				{ return BIGPL_T; }
"]"				{ return BIGPR_T; }
":"				{ return COL_T; }




%%

int yywrap(void)
{
  return 1;
}
