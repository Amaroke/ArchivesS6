{
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
		     
}

let digit = ['0'-'9']
let id = ['a'-'z'] ['_' 'a'-'z' '0'-'9']*
let sym =  (['+' '!' '-' '*' '.' '|' '=' '~' ':' '[' ']' '(' ')' ',' ';' '<' '>' '^'])


rule token = parse
  | digit+ as inum
  	{ let num = int_of_string inum in
	  INT num
	}
  | id as word
  	{ try
	    let token = Hashtbl.find keyword_table word in
	    token 
	  with Not_found ->
	    ID word
	}
  | '"' ([^'"']* as s) '"' { STRING s }
  | "=" { EQUALS }      
  | "<" { LESSTHAN }
  | ">" { GREATERTHAN } 
  | "->" { ARROW }
  | "." { DOT }
  | ";" { SEMICOLON }
  | "::" { COLONCOLON }
  | ":=" { COLONEQUAL }
  | "~" { NEG }
  | "|" { PIPE }
  | "+" { PLUS }
  | "!" { BANG }
  | "-" { MINUS }
  | "*" { TIMES }
  | "(" { OPEN }
  | "^" { CARET }
  | ")" { CLOSE }
  | "," { COMMA }
  | "[]" { EMPTYLIST }
  | "[" { LBRACKET }
  | "]" { RBRACKET }
  | [' ' '\t' '\n']	{ token lexbuf }    (* espaces *)
  | eof
        { EOF }
