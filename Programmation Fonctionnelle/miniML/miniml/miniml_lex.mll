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
		       ("tee", TEE);
		       ("ref", REF);
		       ("fst", FST);
		       ("snd", SND);
		       ("incr", INCR);
		       ("get", GET);
		     ]
		     
  let sym_table = 
    create_hashtable 8 [
		       ("=", EQUALS);
		       ("<", LESSTHAN);
		       (">", GREATERTHAN);
		       ("->", DOT);
		       (";", SEMICOLON);
		       ("::", COLONCOLON);
		       (":=", COLONEQUAL);
		       ("~", NEG);
		       ("|", PIPE);
		       ("+", PLUS);
		       ("!", BANG);
		       ("-", MINUS);
		       ("*", TIMES);
		       ("(", OPEN);
		       (")", CLOSE);
		       (",", COMMA);
		       ("[]", EMPTYLIST);
		       ("[", LBRACKET);
		       ("]", RBRACKET);
		     ]
}

let digit = ['0'-'9']
let id = ['a'-'z'] ['a'-'z' '0'-'9']*
let sym =  (['+' '!' '-' '*' '.' '|' '=' '~' ':' '[' ']' '(' ')' ',' ';' '<' '>' '^']+)


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
  | sym as symbol
	{ try
	    let token = Hashtbl.find sym_table symbol in
	    token
	  with Not_found ->
	  failwith "Syntax Error"
	}
  | [' ' '\t' '\n']	{ token lexbuf }    (* espaces *)
  | eof
        { EOF }
