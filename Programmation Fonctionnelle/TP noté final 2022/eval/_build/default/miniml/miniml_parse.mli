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
  | ARROW
  | IN
  | REC
  | NEG
  | ASSIGN
  | CARET
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
  | LEN
  | MATCH
  | RAISE
  | TRY
  | WITH
  | PIPE
  | FST
  | SND
  | ID of (string)
  | STRING of (string)
  | BUILTIN of (string)
  | INT of (int)
  | TRUE
  | FALSE
  | TEE
  | BANG
  | REF

val input :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Expr.expr
