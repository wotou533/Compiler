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
     FOR = 265,
     TIDENTIFIER = 266,
     TINTEGER = 267,
     TDOUBLE = 268,
     TCHAR = 269,
     TCEQ = 270,
     TCNE = 271,
     TCLT = 272,
     TCLE = 273,
     TCGT = 274,
     TCGE = 275,
     TEQUAL = 276,
     TLPAREN = 277,
     TRPAREN = 278,
     TLBRACE = 279,
     TRBRACE = 280,
     TCOMMA = 281,
     TDOT = 282,
     TSEMICOLON = 283,
     TPLUS = 284,
     TMINUS = 285,
     TMUL = 286,
     TDIV = 287,
     TREAD = 288,
     TWRITE = 289,
     TNOT = 290,
     TAND = 291,
     TOR = 292
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
#define FOR 265
#define TIDENTIFIER 266
#define TINTEGER 267
#define TDOUBLE 268
#define TCHAR 269
#define TCEQ 270
#define TCNE 271
#define TCLT 272
#define TCLE 273
#define TCGT 274
#define TCGE 275
#define TEQUAL 276
#define TLPAREN 277
#define TRPAREN 278
#define TLBRACE 279
#define TRBRACE 280
#define TCOMMA 281
#define TDOT 282
#define TSEMICOLON 283
#define TPLUS 284
#define TMINUS 285
#define TMUL 286
#define TDIV 287
#define TREAD 288
#define TWRITE 289
#define TNOT 290
#define TAND 291
#define TOR 292




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
#line 138 "parser.hpp"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

