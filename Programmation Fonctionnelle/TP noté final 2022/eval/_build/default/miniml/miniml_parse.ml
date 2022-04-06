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

open Parsing;;
let _ = parse_error;;
# 3 "miniml/miniml_parse.mly"
  open Expr ;;

# 57 "miniml/miniml_parse.ml"
let yytransl_const = [|
    0 (* EOF *);
  257 (* OPEN *);
  258 (* CLOSE *);
  259 (* LBRACKET *);
  260 (* RBRACKET *);
  261 (* EMPTYLIST *);
  262 (* SEMICOLON *);
  263 (* LET *);
  264 (* DOT *);
  265 (* ARROW *);
  266 (* IN *);
  267 (* REC *);
  268 (* NEG *);
  269 (* ASSIGN *);
  270 (* CARET *);
  271 (* COLONCOLON *);
  272 (* COLONEQUAL *);
  273 (* PLUS *);
  274 (* MINUS *);
  275 (* GET *);
  276 (* TIMES *);
  277 (* SET *);
  278 (* GREATERTHAN *);
  279 (* LESSTHAN *);
  280 (* EQUALS *);
  281 (* IF *);
  282 (* THEN *);
  283 (* ELSE *);
  284 (* INCR *);
  285 (* FUNCTION *);
  286 (* COMMA *);
  287 (* LEN *);
  288 (* MATCH *);
  289 (* RAISE *);
  290 (* TRY *);
  291 (* WITH *);
  292 (* PIPE *);
  293 (* FST *);
  294 (* SND *);
  299 (* TRUE *);
  300 (* FALSE *);
  301 (* TEE *);
  302 (* BANG *);
  303 (* REF *);
    0|]

let yytransl_block = [|
  295 (* ID *);
  296 (* STRING *);
  297 (* BUILTIN *);
  298 (* INT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\004\000\004\000\005\000\005\000\005\000\005\000\
\006\000\006\000\006\000\006\000\007\000\008\000\008\000\009\000\
\009\000\011\000\011\000\010\000\010\000\010\000\010\000\012\000\
\012\000\012\000\012\000\012\000\012\000\000\000"

let yylen = "\002\000\
\001\000\003\000\001\000\006\000\008\000\007\000\004\000\006\000\
\006\000\001\000\003\000\001\000\003\000\003\000\003\000\001\000\
\003\000\003\000\003\000\001\000\001\000\002\000\001\000\003\000\
\001\000\003\000\001\000\001\000\005\000\003\000\002\000\001\000\
\001\000\001\000\001\000\001\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\036\000\033\000\
\037\000\032\000\034\000\035\000\038\000\001\000\000\000\000\000\
\000\000\020\000\000\000\023\000\000\000\028\000\031\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\022\000\000\000\000\000\
\030\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\002\000\000\000\000\000\000\000\019\000\017\000\018\000\000\000\
\000\000\024\000\000\000\000\000\000\000\000\000\000\000\000\000\
\007\000\000\000\000\000\011\000\000\000\000\000\000\000\000\000\
\000\000\029\000\026\000\000\000\000\000\004\000\009\000\008\000\
\000\000\006\000\005\000"

let yydgoto = "\002\000\
\013\000\014\000\015\000\043\000\016\000\017\000\018\000\019\000\
\020\000\021\000\058\000\022\000"

let yysindex = "\011\000\
\062\255\000\000\007\255\014\255\062\255\003\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\011\255\000\255\
\002\255\000\000\038\255\000\000\253\254\000\000\000\000\016\255\
\230\254\238\254\004\255\005\255\230\254\017\255\062\255\038\255\
\038\255\038\255\038\255\038\255\038\255\000\000\027\255\038\255\
\000\000\022\255\033\255\013\255\062\255\062\255\042\255\062\255\
\000\000\002\255\002\255\002\255\000\000\000\000\000\000\062\255\
\255\254\000\000\230\254\031\255\062\255\047\255\043\255\049\255\
\000\000\061\255\038\255\000\000\062\255\073\255\062\255\062\255\
\062\255\000\000\000\000\074\255\062\255\000\000\000\000\000\000\
\062\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\002\000\126\000\
\010\000\000\000\088\000\000\000\001\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\069\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\054\000\097\000\123\000\000\000\000\000\000\000\000\000\
\045\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\003\000\251\255\230\255\000\000\028\000\038\000\000\000\
\066\000\227\255\019\000\000\000"

let yytablesize = 409
let yytable = "\028\000\
\025\000\003\000\047\000\029\000\039\000\024\000\039\000\003\000\
\023\000\016\000\057\000\001\000\042\000\004\000\025\000\035\000\
\031\000\041\000\036\000\037\000\044\000\032\000\033\000\034\000\
\026\000\048\000\040\000\045\000\067\000\056\000\046\000\005\000\
\068\000\049\000\060\000\006\000\061\000\057\000\003\000\062\000\
\063\000\030\000\065\000\064\000\027\000\007\000\008\000\009\000\
\010\000\011\000\012\000\059\000\027\000\015\000\069\000\070\000\
\071\000\073\000\066\000\050\000\051\000\052\000\003\000\076\000\
\074\000\078\000\079\000\080\000\004\000\072\000\012\000\082\000\
\053\000\054\000\055\000\083\000\007\000\008\000\009\000\010\000\
\011\000\012\000\077\000\081\000\038\000\075\000\005\000\021\000\
\000\000\000\000\006\000\000\000\000\000\000\000\000\000\000\000\
\014\000\000\000\000\000\000\000\007\000\008\000\009\000\010\000\
\011\000\012\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\013\000\000\000\000\000\010\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\025\000\025\000\003\000\025\000\003\000\025\000\000\000\
\000\000\000\000\025\000\016\000\000\000\016\000\025\000\016\000\
\000\000\025\000\025\000\016\000\000\000\000\000\025\000\025\000\
\025\000\000\000\025\000\025\000\000\000\000\000\000\000\016\000\
\016\000\016\000\000\000\016\000\016\000\000\000\000\000\025\000\
\025\000\025\000\025\000\025\000\025\000\027\000\027\000\000\000\
\027\000\000\000\027\000\000\000\000\000\000\000\027\000\015\000\
\000\000\015\000\027\000\015\000\000\000\027\000\027\000\015\000\
\000\000\000\000\027\000\027\000\027\000\000\000\027\000\027\000\
\000\000\000\000\000\000\015\000\015\000\015\000\000\000\015\000\
\015\000\000\000\000\000\027\000\027\000\027\000\027\000\027\000\
\027\000\021\000\000\000\021\000\000\000\021\000\000\000\000\000\
\000\000\021\000\014\000\000\000\014\000\021\000\014\000\000\000\
\021\000\021\000\014\000\000\000\000\000\021\000\021\000\021\000\
\000\000\021\000\021\000\000\000\000\000\000\000\014\000\014\000\
\014\000\000\000\014\000\014\000\013\000\000\000\013\000\010\000\
\013\000\010\000\000\000\010\000\013\000\000\000\000\000\010\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\013\000\013\000\013\000\000\000\013\000\013\000\000\000\010\000\
\010\000"

let yycheck = "\005\000\
\000\000\000\000\029\000\001\001\008\001\003\000\008\001\001\001\
\002\001\000\000\040\000\001\000\039\001\007\001\001\001\014\001\
\006\001\002\001\017\001\018\001\039\001\022\001\023\001\024\001\
\011\001\009\001\030\001\024\001\030\001\003\001\026\001\025\001\
\059\000\031\000\002\001\029\001\024\001\067\000\001\001\045\000\
\046\000\039\001\048\000\002\001\000\000\039\001\040\001\041\001\
\042\001\043\001\044\001\030\001\039\001\000\000\024\001\061\000\
\010\001\009\001\056\000\032\000\033\000\034\000\001\001\069\000\
\004\001\071\000\072\000\073\000\007\001\027\001\002\001\077\000\
\035\000\036\000\037\000\081\000\039\001\040\001\041\001\042\001\
\043\001\044\001\010\001\010\001\019\000\067\000\025\001\000\000\
\255\255\255\255\029\001\255\255\255\255\255\255\255\255\255\255\
\000\000\255\255\255\255\255\255\039\001\040\001\041\001\042\001\
\043\001\044\001\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\000\000\255\255\255\255\000\000\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\001\001\002\001\002\001\004\001\004\001\006\001\255\255\
\255\255\255\255\010\001\002\001\255\255\004\001\014\001\006\001\
\255\255\017\001\018\001\010\001\255\255\255\255\022\001\023\001\
\024\001\255\255\026\001\027\001\255\255\255\255\255\255\022\001\
\023\001\024\001\255\255\026\001\027\001\255\255\255\255\039\001\
\040\001\041\001\042\001\043\001\044\001\001\001\002\001\255\255\
\004\001\255\255\006\001\255\255\255\255\255\255\010\001\002\001\
\255\255\004\001\014\001\006\001\255\255\017\001\018\001\010\001\
\255\255\255\255\022\001\023\001\024\001\255\255\026\001\027\001\
\255\255\255\255\255\255\022\001\023\001\024\001\255\255\026\001\
\027\001\255\255\255\255\039\001\040\001\041\001\042\001\043\001\
\044\001\002\001\255\255\004\001\255\255\006\001\255\255\255\255\
\255\255\010\001\002\001\255\255\004\001\014\001\006\001\255\255\
\017\001\018\001\010\001\255\255\255\255\022\001\023\001\024\001\
\255\255\026\001\027\001\255\255\255\255\255\255\022\001\023\001\
\024\001\255\255\026\001\027\001\002\001\255\255\004\001\002\001\
\006\001\004\001\255\255\006\001\010\001\255\255\255\255\010\001\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\022\001\023\001\024\001\255\255\026\001\027\001\255\255\026\001\
\027\001"

let yynames_const = "\
  EOF\000\
  OPEN\000\
  CLOSE\000\
  LBRACKET\000\
  RBRACKET\000\
  EMPTYLIST\000\
  SEMICOLON\000\
  LET\000\
  DOT\000\
  ARROW\000\
  IN\000\
  REC\000\
  NEG\000\
  ASSIGN\000\
  CARET\000\
  COLONCOLON\000\
  COLONEQUAL\000\
  PLUS\000\
  MINUS\000\
  GET\000\
  TIMES\000\
  SET\000\
  GREATERTHAN\000\
  LESSTHAN\000\
  EQUALS\000\
  IF\000\
  THEN\000\
  ELSE\000\
  INCR\000\
  FUNCTION\000\
  COMMA\000\
  LEN\000\
  MATCH\000\
  RAISE\000\
  TRY\000\
  WITH\000\
  PIPE\000\
  FST\000\
  SND\000\
  TRUE\000\
  FALSE\000\
  TEE\000\
  BANG\000\
  REF\000\
  "

let yynames_block = "\
  ID\000\
  STRING\000\
  BUILTIN\000\
  INT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 37 "miniml/miniml_parse.mly"
              ( _1 )
# 343 "miniml/miniml_parse.ml"
               : Expr.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr1) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 39 "miniml/miniml_parse.mly"
                           ( Then(_1,_3) )
# 351 "miniml/miniml_parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr1) in
    Obj.repr(
# 40 "miniml/miniml_parse.mly"
              ( _1)
# 358 "miniml/miniml_parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr1) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr1) in
    Obj.repr(
# 42 "miniml/miniml_parse.mly"
                                      ( Let(_2, _4, _6) )
# 367 "miniml/miniml_parse.ml"
               : 'expr1))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 5 : 'id_list) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : 'expr1) in
    let _8 = (Parsing.peek_val __caml_parser_env 0 : 'expr1) in
    Obj.repr(
# 43 "miniml/miniml_parse.mly"
                                                 ( LetTuple(_3, _6, _8) )
# 376 "miniml/miniml_parse.ml"
               : 'expr1))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'expr1) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'expr1) in
    Obj.repr(
# 44 "miniml/miniml_parse.mly"
                                     ( Letrec(_3, _5, _7) )
# 385 "miniml/miniml_parse.ml"
               : 'expr1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr1) in
    Obj.repr(
# 45 "miniml/miniml_parse.mly"
                            ( Fun(_2, _4) )
# 393 "miniml/miniml_parse.ml"
               : 'expr1))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : 'id_list) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr1) in
    Obj.repr(
# 46 "miniml/miniml_parse.mly"
                                            ( FunTuple(_3, _6) )
# 401 "miniml/miniml_parse.ml"
               : 'expr1))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr1) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr1) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr1) in
    Obj.repr(
# 47 "miniml/miniml_parse.mly"
                                        ( If(_2, _4, _6) )
# 410 "miniml/miniml_parse.ml"
               : 'expr1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'exp2) in
    Obj.repr(
# 48 "miniml/miniml_parse.mly"
         ( _1 )
# 417 "miniml/miniml_parse.ml"
               : 'expr1))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'id_list) in
    Obj.repr(
# 50 "miniml/miniml_parse.mly"
                          ( _1::_3)
# 425 "miniml/miniml_parse.ml"
               : 'id_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 51 "miniml/miniml_parse.mly"
              ( [_1] )
# 432 "miniml/miniml_parse.ml"
               : 'id_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp2) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp3) in
    Obj.repr(
# 53 "miniml/miniml_parse.mly"
                         ( Eq(_1, _3) )
# 440 "miniml/miniml_parse.ml"
               : 'exp2))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp2) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp3) in
    Obj.repr(
# 54 "miniml/miniml_parse.mly"
                              ( Less(_1, _3) )
# 448 "miniml/miniml_parse.ml"
               : 'exp2))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp2) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp3) in
    Obj.repr(
# 55 "miniml/miniml_parse.mly"
                                 ( Greater(_1, _3) )
# 456 "miniml/miniml_parse.ml"
               : 'exp2))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'exp3) in
    Obj.repr(
# 56 "miniml/miniml_parse.mly"
              ( _1 )
# 463 "miniml/miniml_parse.ml"
               : 'exp2))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp3) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp4) in
    Obj.repr(
# 59 "miniml/miniml_parse.mly"
                       ( Plus(_1, _3) )
# 471 "miniml/miniml_parse.ml"
               : 'exp3))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp3) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp4) in
    Obj.repr(
# 60 "miniml/miniml_parse.mly"
                      ( Minus(_1, _3) )
# 479 "miniml/miniml_parse.ml"
               : 'exp3))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp3) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp4) in
    Obj.repr(
# 61 "miniml/miniml_parse.mly"
                      ( Concat(_1, _3) )
# 487 "miniml/miniml_parse.ml"
               : 'exp3))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'exp4) in
    Obj.repr(
# 62 "miniml/miniml_parse.mly"
         ( _1 )
# 494 "miniml/miniml_parse.ml"
               : 'exp3))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'exp_app) in
    Obj.repr(
# 64 "miniml/miniml_parse.mly"
              ( _1 )
# 501 "miniml/miniml_parse.ml"
               : 'exp4))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'exp_app) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exp5) in
    Obj.repr(
# 66 "miniml/miniml_parse.mly"
                      ( App(_1, _2) )
# 509 "miniml/miniml_parse.ml"
               : 'exp_app))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'exp5) in
    Obj.repr(
# 67 "miniml/miniml_parse.mly"
                ( _1 )
# 516 "miniml/miniml_parse.ml"
               : 'exp_app))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp6) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp_with_commas) in
    Obj.repr(
# 69 "miniml/miniml_parse.mly"
                                 ( Tuple(_1::_3) )
# 524 "miniml/miniml_parse.ml"
               : 'exp5))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'exp6) in
    Obj.repr(
# 70 "miniml/miniml_parse.mly"
         ( _1 )
# 531 "miniml/miniml_parse.ml"
               : 'exp5))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp6) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp_with_commas) in
    Obj.repr(
# 72 "miniml/miniml_parse.mly"
                                            ( _1::_3 )
# 539 "miniml/miniml_parse.ml"
               : 'exp_with_commas))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'exp6) in
    Obj.repr(
# 73 "miniml/miniml_parse.mly"
                      ( [_1] )
# 546 "miniml/miniml_parse.ml"
               : 'exp_with_commas))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'constant) in
    Obj.repr(
# 75 "miniml/miniml_parse.mly"
                   ( _1 )
# 553 "miniml/miniml_parse.ml"
               : 'exp6))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'exp6) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 76 "miniml/miniml_parse.mly"
                                           ( Cell(_1,_4)  )
# 561 "miniml/miniml_parse.ml"
               : 'exp6))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 77 "miniml/miniml_parse.mly"
                          ( _2 )
# 568 "miniml/miniml_parse.ml"
               : 'exp6))
; (fun __caml_parser_env ->
    Obj.repr(
# 78 "miniml/miniml_parse.mly"
                     ( Unit )
# 574 "miniml/miniml_parse.ml"
               : 'exp6))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 81 "miniml/miniml_parse.mly"
                ( Num _1 )
# 581 "miniml/miniml_parse.ml"
               : 'constant))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 82 "miniml/miniml_parse.mly"
                 ( String _1 )
# 588 "miniml/miniml_parse.ml"
               : 'constant))
; (fun __caml_parser_env ->
    Obj.repr(
# 83 "miniml/miniml_parse.mly"
          ( Bool true )
# 594 "miniml/miniml_parse.ml"
               : 'constant))
; (fun __caml_parser_env ->
    Obj.repr(
# 84 "miniml/miniml_parse.mly"
           ( Bool false )
# 600 "miniml/miniml_parse.ml"
               : 'constant))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 85 "miniml/miniml_parse.mly"
               ( Var _1 )
# 607 "miniml/miniml_parse.ml"
               : 'constant))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 86 "miniml/miniml_parse.mly"
                                    ( Builtin _1 )
# 614 "miniml/miniml_parse.ml"
               : 'constant))
(* Entry input *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let input (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Expr.expr)
;;
