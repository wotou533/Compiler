%{
    #include "node.h"
    #include "stdio.h"
    #define YYDEBUG 1
    #define YYERROR_VERBOSE

    Node *RootNode; /* the top level root node of our final AST */

    extern int yylex();
    void yyerror(const char *s) { printf("ERROR: %sn", s); }
%}

/* Represents the many different ways we can access our data */

%union {
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


/* Define our terminal symbols (tokens). This should
   match our tokens.l lex file. We also define the node type
   they represent.
 */
%token <string> INT CHAR FLOAT DOUBLE IF ELSE WHILE
%token <str> TIDENTIFIER TINTEGER TDOUBLE TCHAR
%token <token> TCEQ TCNE TCLT TCLE TCGT TCGE TEQUAL
%token <token> TLPAREN TRPAREN TLBRACE TRBRACE TCOMMA TDOT TSEMICOLON
%token <token> TPLUS TMINUS TMUL TDIV

/* Define the type of node our nonterminal symbols represent.
   The types refer to the %union declaration above. Ex: when
   we call an ident (defined by union type ident) we are really
   calling an (NIdentifier*). It makes the compiler happy.
 */
%type <expr> expr
//%type <block> program stmts block
%type <stmt> stmt matched_stmt open_stmt
//%type <token> comparison


/* Operator precedence for mathematical operators */
%left TPLUS TMINUS
%left TMUL TDIV
%left TEQUAL

%start start

%%

start : INT TIDENTIFIER TLPAREN TRPAREN comp_stmt { RootNode = $<stmt>5; }
      ;

comp_stmt : TLBRACE stmts TRBRACE { $<stmt>$ = $<stmt>2; }
          ;

stmts : stmt stmts { $<stmt>$ = $<stmt>2;
                     std::vector<Node*>::iterator it;
                     it = $<stmt>$->Children.begin();
                     $<stmt>$->Children.insert(it, $<stmt>1); }
      | /* empty */ { $<stmt>$ = new Node("COMP_STMT"); }
      ;

stmt : matched_stmt { $<stmt>$ = $<stmt>1; }
     | open_stmt { $<stmt>$ = $<stmt>1; }
     ;

matched_stmt : IF TLPAREN expr TRPAREN matched_stmt ELSE matched_stmt {
                                    $<stmt>$ = new Node("STMT", "IF");
                                    $<stmt>3->NodeInfo = "CONDITION";
                                    $<stmt>5->NodeInfo = "IF BRANCH";
                                    $<stmt>7->NodeInfo = "ELSE BRANCH";
                                    $<stmt>$->Children.push_back($<stmt>3);
                                    $<stmt>$->Children.push_back($<stmt>5);
                                    $<stmt>$->Children.push_back($<stmt>7); }
             | type args_list TSEMICOLON {
                                    $<stmt>$ = new Node("STMT", "DECL");
                                    $<stmt>$->Children.push_back($<type>1);
                                    $<stmt>$->Children.push_back($<args_list>2); }
             | expr TSEMICOLON { $<stmt>$ = new Node("STMT", "EXPR");
                                 $<stmt>$->Children.push_back($<expr>1); }
             | comp_stmt { $<stmt>$ = $<stmt>1; }
             ;

open_stmt : IF TLPAREN expr TRPAREN stmt {
                                    $<stmt>$ = new Node("STMT", "IF");
                                    $<stmt>3->NodeInfo = "CONDITION";
                                    $<stmt>5->NodeInfo = "IF BRANCH";
                                    $<stmt>$->Children.push_back($<stmt>3);
                                    $<stmt>$->Children.push_back($<stmt>5); }
          | IF TLPAREN expr TRPAREN matched_stmt ELSE open_stmt {
                                    $<stmt>$ = new Node("STMT", "IF");
                                    $<stmt>3->NodeInfo = "CONDITION";
                                    $<stmt>5->NodeInfo = "IF BRANCH";
                                    $<stmt>7->NodeInfo = "ELSE BRANCH";
                                    $<stmt>$->Children.push_back($<stmt>3);
                                    $<stmt>$->Children.push_back($<stmt>5);
                                    $<stmt>$->Children.push_back($<stmt>7); }
          ;

type : INT     { $<type>$ = new Node("TYPE", "int"); }
     | CHAR    { $<type>$ = new Node("TYPE", "char"); }
     | FLOAT   { $<type>$ = new Node("TYPE", "float"); }
     | DOUBLE  { $<type>$ = new Node("TYPE", "double"); }
     ;

args_list : decl_assign_expr { $<args_list>$ = new Node("ARGS_LIST");
                               $<args_list>$->Children.push_back($<expr>1); }
          | decl_assign_expr TCOMMA args_list {
                               $<args_list>$ = $<args_list>3;
                               std::vector<Node*>::iterator it;
                               it = $<args_list>$->Children.begin();
                               $<args_list>$->Children.insert(it, $<expr>1); }
          ;

decl_assign_expr : identifier TEQUAL expr {
                               $<expr>$ = new Node("EXPR", "DECL_ASSIGN");
                               $<expr>$->Children.push_back($<identifier>1);
                               $<expr>$->Children.push_back($<expr>3); }
                 ;

expr : expr_alg TCEQ expr_alg { $<expr>$ = new Node("EXPR", "COMP_EQL");
                                  $<expr>$->Children.push_back($<expr>1);
                                  $<expr>$->Children.push_back($<expr>3); }
       | expr_alg TCLT expr_alg { $<expr>$ = new Node("EXPR", "COMP_LT");
                                  $<expr>$->Children.push_back($<expr>1);
                                  $<expr>$->Children.push_back($<expr>3); }
       | expr_alg TCGT expr_alg { $<expr>$ = new Node("EXPR", "COMP_GT");
                                  $<expr>$->Children.push_back($<expr>1);
                                  $<expr>$->Children.push_back($<expr>3); }
       | expr_alg TCLE expr_alg { $<expr>$ = new Node("EXPR", "COMP_LE");
                                  $<expr>$->Children.push_back($<expr>1);
                                  $<expr>$->Children.push_back($<expr>3); }
       | expr_alg TCGE expr_alg { $<expr>$ = new Node("EXPR", "COMP_GE");
                                  $<expr>$->Children.push_back($<expr>1);
                                  $<expr>$->Children.push_back($<expr>3); }
       | identifier TEQUAL expr { $<expr>$ = new Node("EXPR", "ASSIGN");
                                  $<expr>$->Children.push_back($<expr>1);
                                  $<expr>$->Children.push_back($<expr>3); }
       | expr_alg { $<expr>$ = $<expr>1; }
       ;

expr_alg : term TPLUS expr_alg { $<expr>$ = new Node("EXPR", "ADD");
                                 $<expr>$->Children.push_back($<term>1);
                                 $<expr>$->Children.push_back($<expr>3); }
         | term TMINUS expr_alg { $<expr>$ = new Node("EXPR", "MINUS");
                                  $<expr>$->Children.push_back($<term>1);
                                  $<expr>$->Children.push_back($<expr>3); }
         | term { $<expr>$ = $<expr>1; }
         ;

term : factor TMUL term { $<expr>$ = new Node("EXPR", "MUL");
                          $<expr>$->Children.push_back($<factor>1);
                          $<expr>$->Children.push_back($<term>3); }
     | factor TDIV term { $<expr>$ = new Node("EXPR", "DIV");
                          $<expr>$->Children.push_back($<factor>1);
                          $<expr>$->Children.push_back($<term>3); }
     | factor { $<term>$ = $<term>1; }
     ;

factor : TLPAREN expr TRPAREN { $<expr>$ = new Node("EXPR", "PARENED");
                                $<expr>$->Children.push_back($<expr>2); }
       | identifier { $<factor>$ = $<expr>1; }
       | TINTEGER { $<factor>$ = new Node("VAL", $1); }
       ;

identifier : TIDENTIFIER { $<identifier>$ = new Node("VAR", $1); }
           ;

%%
