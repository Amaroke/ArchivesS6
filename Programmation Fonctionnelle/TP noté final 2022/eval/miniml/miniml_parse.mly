		  
%{
  open Expr ;;

%}
 
%token EOF
%token OPEN CLOSE
%token LBRACKET RBRACKET EMPTYLIST SEMICOLON
%token LET DOT ARROW IN REC
%token NEG ASSIGN CARET
%token COLONCOLON COLONEQUAL
%token PLUS MINUS  GET
%token TIMES SET GET
%token GREATERTHAN LESSTHAN EQUALS
%token IF THEN ELSE  INCR
%token FUNCTION COMMA LEN
%token MATCH RAISE TRY WITH PIPE FST SND
%token <string> ID
%token <string> STRING
%token <string> BUILTIN
%token <int> INT
%token TRUE FALSE TEE BANG REF

%left LESSTHAN GREATERTHAN
%nonassoc EQUALS
%left PLUS MINUS
%left TIMES
%left SEMICOLON
%nonassoc apply

%start input
%type <Expr.expr> input

/* Grammar follows */
%%
input:	expr			{ $1 }

expr: expr1 SEMICOLON expr { Then($1,$3) }
      | expr1 { $1}

expr1 : 	LET ID EQUALS expr1 IN expr1	{ Let($2, $4, $6) }
  | LET OPEN id_list CLOSE EQUALS expr1 IN expr1	{ LetTuple($3, $6, $8) }
  | LET REC ID EQUALS expr1 IN expr1	{ Letrec($3, $5, $7) }
  | FUNCTION ID ARROW expr1	{ Fun($2, $4) }	
  | FUNCTION OPEN id_list CLOSE ARROW expr1	{ FunTuple($3, $6) }	
  | IF expr1 THEN expr1 ELSE expr1      { If($2, $4, $6) }
  | exp2 { $1 }

id_list: ID COMMA id_list { $1::$3}
         | ID { [$1] }

exp2 : exp2 EQUALS exp3		{ Eq($1, $3) }
       |  exp2 LESSTHAN exp3		{ Less($1, $3) }
       |  exp2 GREATERTHAN exp3		{ Greater($1, $3) }
       | exp3 { $1 }
 

exp3: exp3 PLUS exp4 		{ Plus($1, $3) }
  | exp3 MINUS exp4 		{ Minus($1, $3) }
  | exp3 CARET exp4 		{ Concat($1, $3) }
  | exp4 { $1 }

exp4: exp_app { $1 }

exp_app: exp_app exp5 { App($1, $2) }
         | exp5 { $1 }

exp5: exp6 COMMA exp_with_commas { Tuple($1::$3) }
  | exp6 { $1 }
                      
exp_with_commas: exp6 COMMA exp_with_commas { $1::$3 }
               | exp6 { [$1] }
                      
exp6 :    constant { $1 }
        | exp6 DOT LBRACKET expr RBRACKET  { Cell($1,$4)  }
        | OPEN expr CLOSE	{ $2 }
        | OPEN CLOSE	{ Unit }

constant : 
          INT			{ Num $1 }
        | STRING	{ String $1 }
	| TRUE			{ Bool true }
	| FALSE			{ Bool false }
        | ID			{ Var $1 }
        | BUILTIN                   { Builtin $1 }
%%
