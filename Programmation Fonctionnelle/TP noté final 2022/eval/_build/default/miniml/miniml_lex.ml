# 1 "miniml/miniml_lex.mll"
 
  open Miniml_parse ;; (* need access to parser's token definitions *)

  let create_hashtable size init =
    let tbl = Hashtbl.create size in
    List.iter (fun (key, data) -> Hashtbl.add tbl key data) init;
    tbl

  let keyword_table = 
    create_hashtable 8 [
		       ("if", IF);
		       ("in", IN);
		       ("then", THEN);
		       ("else", ELSE);
		       ("let", LET);
		       ("raise", RAISE);
		       ("try", TRY);
		       ("with", WITH);
		       ("match", MATCH);
		       ("rec", REC);
		       ("true", TRUE);
		       ("false", FALSE);
		       ("fun", FUNCTION);
		       ("tee", BUILTIN "tee");
		       ("len", BUILTIN "len");
		       ("ref", BUILTIN "ref");
		       ("fst", BUILTIN "fst");
		       ("snd", BUILTIN "snd");
		       ("print_int", BUILTIN "print_int");
		       ("print_string", BUILTIN "print_string");
           ("print_expr", BUILTIN "print_expr");
		       ("ignore", BUILTIN "ignore");
		     ]
		     

# 38 "miniml/miniml_lex.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\230\255\231\255\232\255\002\000\235\255\236\255\237\255\
    \238\255\239\255\241\255\242\255\243\255\244\255\005\000\247\255\
    \248\255\002\000\250\255\251\255\252\255\001\000\030\000\019\000\
    \253\255\249\255\245\255\246\255\234\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\255\255\022\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\015\000\255\255\255\255\255\255\255\255\001\000\000\000\
    \255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_default =
   "\255\255\000\000\000\000\000\000\255\255\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\255\255\000\000\
    \000\000\255\255\000\000\000\000\000\000\021\000\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\002\000\002\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \002\000\010\000\021\000\024\000\000\000\000\000\000\000\000\000\
    \008\000\006\000\009\000\011\000\005\000\017\000\016\000\000\000\
    \023\000\023\000\023\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\014\000\015\000\019\000\020\000\018\000\027\000\
    \025\000\000\000\026\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\000\000\022\000\022\000\
    \022\000\022\000\022\000\022\000\022\000\022\000\022\000\022\000\
    \000\000\000\000\000\000\004\000\000\000\003\000\007\000\028\000\
    \000\000\022\000\022\000\022\000\022\000\022\000\022\000\022\000\
    \022\000\022\000\022\000\022\000\022\000\022\000\022\000\022\000\
    \022\000\022\000\022\000\022\000\022\000\022\000\022\000\022\000\
    \022\000\022\000\022\000\000\000\012\000\022\000\013\000\022\000\
    \022\000\022\000\022\000\022\000\022\000\022\000\022\000\022\000\
    \022\000\022\000\022\000\022\000\022\000\022\000\022\000\022\000\
    \022\000\022\000\022\000\022\000\022\000\022\000\022\000\022\000\
    \022\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
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
    \001\000\255\255\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\000\000\021\000\255\255\255\255\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\014\000\
    \017\000\255\255\014\000\023\000\023\000\023\000\023\000\023\000\
    \023\000\023\000\023\000\023\000\023\000\255\255\022\000\022\000\
    \022\000\022\000\022\000\022\000\022\000\022\000\022\000\022\000\
    \255\255\255\255\255\255\000\000\255\255\000\000\000\000\004\000\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\255\255\000\000\022\000\000\000\022\000\
    \022\000\022\000\022\000\022\000\022\000\022\000\022\000\022\000\
    \022\000\022\000\022\000\022\000\022\000\022\000\022\000\022\000\
    \022\000\022\000\022\000\022\000\022\000\022\000\022\000\022\000\
    \022\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
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
    \000\000\021\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec token lexbuf =
   __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
let
# 43 "miniml/miniml_lex.mll"
              inum
# 151 "miniml/miniml_lex.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 44 "miniml/miniml_lex.mll"
   ( let num = int_of_string inum in
	  INT num
	)
# 157 "miniml/miniml_lex.ml"

  | 1 ->
let
# 47 "miniml/miniml_lex.mll"
          word
# 163 "miniml/miniml_lex.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 48 "miniml/miniml_lex.mll"
   ( try
	    let token = Hashtbl.find keyword_table word in
	    token 
	  with Not_found ->
	    ID word
	)
# 172 "miniml/miniml_lex.ml"

  | 2 ->
let
# 54 "miniml/miniml_lex.mll"
                    s
# 178 "miniml/miniml_lex.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) (lexbuf.Lexing.lex_curr_pos + -1) in
# 54 "miniml/miniml_lex.mll"
                           ( STRING s )
# 182 "miniml/miniml_lex.ml"

  | 3 ->
# 55 "miniml/miniml_lex.mll"
        ( EQUALS )
# 187 "miniml/miniml_lex.ml"

  | 4 ->
# 56 "miniml/miniml_lex.mll"
        ( LESSTHAN )
# 192 "miniml/miniml_lex.ml"

  | 5 ->
# 57 "miniml/miniml_lex.mll"
        ( GREATERTHAN )
# 197 "miniml/miniml_lex.ml"

  | 6 ->
# 58 "miniml/miniml_lex.mll"
         ( ARROW )
# 202 "miniml/miniml_lex.ml"

  | 7 ->
# 59 "miniml/miniml_lex.mll"
        ( DOT )
# 207 "miniml/miniml_lex.ml"

  | 8 ->
# 60 "miniml/miniml_lex.mll"
        ( SEMICOLON )
# 212 "miniml/miniml_lex.ml"

  | 9 ->
# 61 "miniml/miniml_lex.mll"
         ( COLONCOLON )
# 217 "miniml/miniml_lex.ml"

  | 10 ->
# 62 "miniml/miniml_lex.mll"
         ( COLONEQUAL )
# 222 "miniml/miniml_lex.ml"

  | 11 ->
# 63 "miniml/miniml_lex.mll"
        ( NEG )
# 227 "miniml/miniml_lex.ml"

  | 12 ->
# 64 "miniml/miniml_lex.mll"
        ( PIPE )
# 232 "miniml/miniml_lex.ml"

  | 13 ->
# 65 "miniml/miniml_lex.mll"
        ( PLUS )
# 237 "miniml/miniml_lex.ml"

  | 14 ->
# 66 "miniml/miniml_lex.mll"
        ( BANG )
# 242 "miniml/miniml_lex.ml"

  | 15 ->
# 67 "miniml/miniml_lex.mll"
        ( MINUS )
# 247 "miniml/miniml_lex.ml"

  | 16 ->
# 68 "miniml/miniml_lex.mll"
        ( TIMES )
# 252 "miniml/miniml_lex.ml"

  | 17 ->
# 69 "miniml/miniml_lex.mll"
        ( OPEN )
# 257 "miniml/miniml_lex.ml"

  | 18 ->
# 70 "miniml/miniml_lex.mll"
        ( CARET )
# 262 "miniml/miniml_lex.ml"

  | 19 ->
# 71 "miniml/miniml_lex.mll"
        ( CLOSE )
# 267 "miniml/miniml_lex.ml"

  | 20 ->
# 72 "miniml/miniml_lex.mll"
        ( COMMA )
# 272 "miniml/miniml_lex.ml"

  | 21 ->
# 73 "miniml/miniml_lex.mll"
         ( EMPTYLIST )
# 277 "miniml/miniml_lex.ml"

  | 22 ->
# 74 "miniml/miniml_lex.mll"
        ( LBRACKET )
# 282 "miniml/miniml_lex.ml"

  | 23 ->
# 75 "miniml/miniml_lex.mll"
        ( RBRACKET )
# 287 "miniml/miniml_lex.ml"

  | 24 ->
# 76 "miniml/miniml_lex.mll"
                    ( token lexbuf )
# 292 "miniml/miniml_lex.ml"

  | 25 ->
# 78 "miniml/miniml_lex.mll"
        ( EOF )
# 297 "miniml/miniml_lex.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

;;

