%{
#include <string>
#include "node.h"
#include "parser.hpp"
extern "C" int yywrap() { }
%}

ws								[ \f\v\t]
digit							[0-9]
hex								[0-9A-Fa-f]
letter							[A-Z_a-z]
simple_escape_sequence			(\\\'|\\\"|\\\?|\\\\|\\a|\\b|\\f|\\n|\\r|\\t|\\v)
octal_escape_sequence			(\\[0-7]|\\[0-7][0-7]|\\[0-7][0-7][0-7])
hexadecimal_escape_sequence		(\\x{hex}+)
escape_sequence					({simple_escape_sequence}|{octal_escape_sequence}|{hexadecimal_escape_sequence})
universal_character_name		(\\u{hex}{hex}{hex}{hex}|\\U{hex}{hex}{hex}{hex}{hex}{hex}{hex}{hex})
non_digit						({letter}|{universal_character_name})
identifier						({non_digit}({non_digit}|{digit})*)

%%

int                     return INT;
char                    return CHAR;
float                   return FLOAT;
double                  return DOUBLE;
if                      return IF;
else                    return ELSE;
while                   return WHILE;

\n						 		|
{ws}+                         ;
{identifier}                 yylval.str = yytext; return TIDENTIFIER;
[+-]?[0-9]+\.[0-9]*          yylval.str = yytext; return TDOUBLE;
[+-]?[0-9]+                  yylval.str = yytext; return TINTEGER;
'(\\)?.?'               yylval.str = yytext; return TCHAR;
[/][*](.|\n)*[*][/]     /* Skip multi-line comments. */;
\/\/.*                  /* Skip single-line comments. */;

"="                     return TEQUAL;
"=="                    return TCEQ;
"!="                    return TCNE;
"<"                     return TCLT;
"<="                    return TCLE;
">"                     return TCGT;
">="                    return TCGE;
"("                     return TLPAREN;
")"                     return TRPAREN;
"{"                     return TLBRACE;
"}"                     return TRBRACE;
"."                     return TDOT;
","                     return TCOMMA;
"+"                     return TPLUS;
"-"                     return TMINUS;
"*"                     return TMUL;
"/"                     return TDIV;
";"                     return TSEMICOLON;

.                       printf("Unknown token!\n"); yyterminate();

%%