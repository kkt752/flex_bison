
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ID = 262,
     Integer = 263,
     Float = 264,
     MAINPROG = 265,
     VAR = 266,
     ARRAY = 267,
     OF = 268,
     FUNCTION = 269,
     PROCEDURE = 270,
     BEGIN_R = 271,
     END_R = 272,
     IF = 273,
     THEN = 274,
     ELSE = 275,
     NOP = 276,
     WHILE = 277,
     RETURN = 278,
     PRINT = 279,
     INT = 280,
     FLOAT = 281,
     OP01 = 282,
     OP02 = 283,
     OP03 = 284,
     OP04 = 285,
     OP05 = 286,
     OP06 = 287,
     OP07 = 288,
     OP08 = 289,
     OP09 = 290,
     OP10 = 291,
     OP11 = 292,
     SEMICOL_T = 293,
     DOT_T = 294,
     COMMA_T = 295,
     EQU_T = 296,
     SMALLPL_T = 297,
     SMALLPR_T = 298,
     BIGPL_T = 299,
     BIGPR_T = 300,
     COL_T = 301
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 36 "flex_bison.y"

	char * stringValue;
	int iValue;
	float fValue;



/* Line 1676 of yacc.c  */
#line 102 "flex_bison.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


