/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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
     INT = 258,
     CHAR = 259,
     FLOAT = 260,
     DOUBLE = 261,
     IF = 262,
     ELSE = 263,
     WHILE = 264,
     TIDENTIFIER = 265,
     TINTEGER = 266,
     TDOUBLE = 267,
     TCHAR = 268,
     TCEQ = 269,
     TCNE = 270,
     TCLT = 271,
     TCLE = 272,
     TCGT = 273,
     TCGE = 274,
     TEQUAL = 275,
     TLPAREN = 276,
     TRPAREN = 277,
     TLBRACE = 278,
     TRBRACE = 279,
     TCOMMA = 280,
     TDOT = 281,
     TSEMICOLON = 282,
     TPLUS = 283,
     TMINUS = 284,
     TMUL = 285,
     TDIV = 286,
     TREAD = 287,
     TWRITE = 288
   };
#endif
/* Tokens.  */
#define INT 258
#define CHAR 259
#define FLOAT 260
#define DOUBLE 261
#define IF 262
#define ELSE 263
#define WHILE 264
#define TIDENTIFIER 265
#define TINTEGER 266
#define TDOUBLE 267
#define TCHAR 268
#define TCEQ 269
#define TCNE 270
#define TCLT 271
#define TCLE 272
#define TCGT 273
#define TCGE 274
#define TEQUAL 275
#define TLPAREN 276
#define TRPAREN 277
#define TLBRACE 278
#define TRBRACE 279
#define TCOMMA 280
#define TDOT 281
#define TSEMICOLON 282
#define TPLUS 283
#define TMINUS 284
#define TMUL 285
#define TDIV 286
#define TREAD 287
#define TWRITE 288




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 15 "parser.y"
{
    Node *start;
    Node *stmt;
    Node *stmts;
    Node *comp_stmt;
    Node *type;
    Node *args_list;
    Node *factor;
    Node *term;
    Node *expr;
    Node *expr_alg;
    Node *identifier;
    char *str;
}
/* Line 1529 of yacc.c.  */
#line 130 "parser.hpp"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

