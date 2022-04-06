		  
%{
  open Expr ;;

%}
 
%token EOF
%token OPEN CLOSE
%token LBRACKET RBRACKET EMPTYLIST SEMICOLON
%token LET DOT IN REC
%token NEG ASSIGN
%token COLONCOLON COLONEQUAL
%token PLUS MINUS  GET
%token TIMES SET GET
%token GREATERTHAN LESSTHAN EQUALS
%token IF THEN ELSE  INCR
%token FUNCTION COMMA
%token MATCH RAISE TRY WITH PIPE FST SND
%token <string> ID
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

expr : 	LET ID EQUALS expr IN expr	{ Let($2, $4, $6) }
      | LET REC ID EQUALS expr IN expr	{ Letrec($3, $5, $7) }
      | FUNCTION ID DOT expr	{ Fun($2, $4) }	
      | IF expr THEN expr ELSE expr      { If($2, $4, $6) }
      | RAISE expr { Raise($2) }
      | TRY expr WITH ID DOT expr { Try($2,$4,$6) }
      | MATCH expr WITH EMPTYLIST DOT expr PIPE ID COLONCOLON ID DOT expr { Match($2,$6,$8,$10,$12) }
      | exp2 { $1 }


exp2 : exp2 EQUALS exp3		{ Eq($1, $3) }
       |  exp2 LESSTHAN exp3		{ Less($1, $3) }
       |  exp2 GREATERTHAN exp3		{ Greater($1, $3) }
       | exp3 { $1 }
 

exp3: exp3 PLUS exp4 		{ Plus($1, $3) }
  | exp3 MINUS exp4 		{ Minus($1, $3) }
  | exp4 { $1 }


exp4: | exp4 COLONCOLON exp_app { Cons($1, $3)}
         | exp_app { $1 }

exp_app: exp_app exp5 { App($1, $2) }
         | exp5 { $1 }

exp5: exp6 COMMA exp5 { Pair($1, $3) }
         | exp6 { $1 }

exp6 :    constant { $1 }
        | OPEN expr CLOSE	{ $2 }
	| EMPTYLIST { Nil }
        | LBRACKET exprlist RBRACKET { $2 }

exprlist : /* empty */ { Nil }
        | nonemptyexprlist { $1 }

nonemptyexprlist: expr { Cons($1, Nil) }
                | expr SEMICOLON nonemptyexprlist  { Cons($1, $3)}


constant : 
          INT			{ Num $1 }
	| TRUE			{ Bool true }
	| FALSE			{ Bool false }
        | ID			{ Var $1 }
        | TEE                   { Tee }
        | FST                   { Fst }
        | SND                   { Snd }
	| GET		{ Get }
	| INCR		{ Incr }
%%
