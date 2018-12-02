%left "==" "!="
%left '<' '>' "<=" ">="
%left '+' '-'
%left '*' '/'
%right '!'

%{

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "SymbolTable.h"
#define VAR_MAX_NUM 1000000

void yyerror(char *);
int yylex(void);
int yylineno;
char* yytext;

void install (char *sym_name)
{
	symrec *s;
	s = putsym(sym_name);
}


%}

%union{
	char * varName;
	int I;
	float F;
}
%token <varName> ID;
%token <I> Integer;
%token <F> Float;


%token MAINPROG;
%token VAR;
%token ARRAY;
%token OF;
%token FUNCTION;
%token PROCEDURE;
%token BEGIN_R;
%token END_R;
%token IF;
%token THEN;
%token ELSE;
%token NOP;
%token WHILE;
%token RETURN;
%token PRINT;
%token INT;
%token FLOAT;

%token OP01;
%token OP02;
%token OP03;
%token OP04;
%token OP05;
%token OP06;
%token OP07;
%token OP08;
%token OP09;
%token OP10;
%token OP11;

%token SEMICOL_T;
%token DOT_T;
%token COMMA_T;
%token EQU_T;
%token SMALLPL_T;
%token SMALLPR_T;
%token BIGPL_T;
%token BIGPR_T;
%token COL_T;

%%

program:
	MAINPROG ID SEMICOL_T declarations subprogram_declarations compound_statement
	{
		print_sym_table();
	}
	;
	

declarations:
	declarations VAR identifier_list COL_T type SEMICOL_T
	{
		
	}
	| 
	;

identifier_list:
	ID
	{
		install($1);
	}
	| identifier_list COMMA_T ID
	{
		install($3);
	}
	;

type:
	standard_type
	| ARRAY BIGPL_T Integer BIGPR_T OF INT { set_type("INTARR"); }
	| ARRAY BIGPL_T Integer BIGPR_T OF FLOAT { set_type("FLOATARR"); }
	;

standard_type:
	INT { set_type("INTEGER"); }
	| FLOAT { set_type("FLOAT"); }
	;

subprogram_declarations:
	subprogram_declaration subprogram_declarations
	| 
	;

subprogram_declaration:
	subprogram_head declarations compound_statement
	;

subprogram_head:
	FUNCTION ID arguments COL_T standard_type SEMICOL_T
	| PROCEDURE ID arguments SEMICOL_T
	;

arguments:
	SMALLPL_T parameter_list SMALLPR_T
	| 
	;

parameter_list:
	identifier_list COL_T type
	|
	identifier_list COL_T type SEMICOL_T parameter_list
	;

compound_statement:
	BEGIN_R statement_list END_R
	;

statement_list:
	statement
	| statement SEMICOL_T statement_list
	;

statement:
	variable EQU_T expression
	| print_statement
	| procedure_statement
	| compound_statement
	| IF expression THEN statement ELSE statement
	| WHILE SMALLPL_T expression SMALLPR_T statement
	| RETURN expression
	| NOP
	;

print_statement:
	PRINT
	| PRINT SMALLPL_T expression SMALLPR_T
	;

variable:
	ID
	| ID BIGPL_T expression BIGPR_T
	;

procedure_statement:
	ID SMALLPL_T actual_parameter_expression SMALLPR_T
	;

actual_parameter_expression:
	| expression_list
	;


expression_list:
	expression
	| expression COMMA_T expression_list
	;

expression:
	simple_expression
	| simple_expression relop simple_expression
	;

simple_expression:
	term
	| term addop simple_expression

 

term:
	factor
	| factor multop term
	;

factor:
	Integer
	| Float
	| variable
	| procedure_statement
	| OP11 factor
	| sign factor
	;


sign:
	OP01
	| OP02
	;

relop:
	OP06
	| OP07
	| OP05
	| OP08
	| OP09
	| OP10
	;

addop:
	OP01
	| OP02
	;

multop:
	OP03
	| OP04
	;
	
%%

void yyerror(char *s)
{
   fprintf(stderr, "%s at line %d in the source code at %s\n", s, yylineno, yytext);
}

int main (void) {
    yyparse();
}
