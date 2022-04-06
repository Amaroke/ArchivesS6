type token =
  | EOF
  | OPEN
  | CLOSE
  | LBRACKET
  | RBRACKET
  | EMPTYLIST
  | SEMICOLON
  | LET
  | DOT
  | IN
  | REC
  | NEG
  | ASSIGN
  | COLONCOLON
  | COLONEQUAL
  | PLUS
  | MINUS
  | GET
  | TIMES
  | SET
  | GREATERTHAN
  | LESSTHAN
  | EQUALS
  | IF
  | THEN
  | ELSE
  | INCR
  | FUNCTION
  | COMMA
  | MATCH
  | RAISE
  | TRY
  | WITH
  | PIPE
  | FST
  | SND
  | ID of (string)
  | INT of (int)
  | TRUE
  | FALSE
  | TEE
  | BANG
  | REF

val input :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Expr.expr
