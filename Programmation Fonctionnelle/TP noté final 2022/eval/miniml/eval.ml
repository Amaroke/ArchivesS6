open Expr

exception NotImplemented of int

(* EXO 1 : FONCTIONS UTILES *)

let string_length s = String.length s
let string_get s i = String.make 1 s.[i]

(* FIN EXO 1 *)

let expr_from_string s =
  let lexbuf = Lexing.from_string s in
  let exp = Miniml_parse.input Miniml_lex.token lexbuf in
  exp

let rec string_from_expr = function
  | Var x -> x
  | Fun (x, y) -> "(fun " ^ x ^ "->" ^ string_from_expr y ^ ")"
  | Let (y, a, b) ->
      "let " ^ y ^ "=" ^ string_from_expr a ^ " in " ^ string_from_expr b
  | Letrec (y, a, b) ->
      "let rec " ^ y ^ "=" ^ string_from_expr a ^ " in " ^ string_from_expr b
  | Minus (a, b) -> string_from_expr a ^ "-" ^ string_from_expr b
  | Plus (a, b) -> string_from_expr a ^ "+" ^ string_from_expr b
  | App (e, f) -> string_from_expr e ^ " ( " ^ string_from_expr f ^ ")"
  | Num x -> string_of_int x
  | If (y, a, b) ->
      "if" ^ string_from_expr y ^ " then " ^ string_from_expr a ^ " else "
      ^ string_from_expr b
  | Eq (a, b) -> string_from_expr a ^ " = " ^ string_from_expr b
  | Less (a, b) -> string_from_expr a ^ " < " ^ string_from_expr b
  | Greater (a, b) -> string_from_expr a ^ " > " ^ string_from_expr b
  | Bool x -> if x then "true" else "false"
  | Builtin x -> x
  (* EXO 1 *)
  | String x -> "\"" ^ x ^ "\""
  | Concat (x, y) -> string_from_expr x ^ " ^ " ^ string_from_expr y
  | Cell (x, y) -> string_from_expr x ^ " .[ " ^ string_from_expr y ^ " ]"
  (* FIN EXO 1 *)
  (* EXO A *)
  | Unit -> "()"
  | Then (x, y) -> string_from_expr x ^ ";" ^ string_from_expr y
  (* FIN EXO A *)
  (* EXO B *)
  | Tuple l -> "(" ^ String.concat "," (List.map string_from_expr l) ^ ")"
  | LetTuple (l, a, b) ->
      "let " ^ "(" ^ String.concat "," l ^ ")" ^ "=" ^ string_from_expr a
      ^ " in " ^ string_from_expr b
  | FunTuple (l, y) ->
      "(fun " ^ "(" ^ String.concat "," l ^ ")" ^ "->" ^ string_from_expr y
      ^ ")"
(*FIN EXO B *)

let rec subst x byx e =
  match e with
  | Var y when y = x -> byx
  | Var y -> Var y
  | Num y -> Num y
  | Let (y, a, b) when y = x -> Let (y, subst x byx a, b)
  | Let (y, a, b) -> Let (y, subst x byx a, subst x byx b)
  | Letrec (y, a, b) when y <> x -> Letrec (y, subst x byx a, subst x byx b)
  | Letrec (y, a, b) -> Letrec (y, a, b)
  | Fun (y, a) when y <> x -> Fun (y, subst x byx a)
  | Fun (y, a) -> Fun (y, a)
  | Plus (a, b) -> Plus (subst x byx a, subst x byx b)
  | Minus (a, b) -> Minus (subst x byx a, subst x byx b)
  | App (e1, e2) -> App (subst x byx e1, subst x byx e2)
  | Eq (a, b) -> Eq (subst x byx a, subst x byx b)
  | Less (a, b) -> Less (subst x byx a, subst x byx b)
  | Greater (a, b) -> Greater (subst x byx a, subst x byx b)
  | If (a, b, c) -> If (subst x byx a, subst x byx b, subst x byx c)
  | Bool _ -> e
  | Builtin _ -> e
  (* EXO 1 *)
  | String s -> String s
  | Concat (a, b) -> Concat (subst x byx a, subst x byx b)
  | Cell (a, b) -> Cell (subst x byx a, subst x byx b)
  (* FIN EXO 1 *)
  (* EXO A *)
  | Then (a, b) -> Then (subst x byx a, subst x byx b)
  | Unit -> Unit
  (* FIN EXO A *)
  (* EXO B *)
  | Tuple l -> Tuple (List.map (subst x byx) l)
  | LetTuple (l, a, b) when List.mem x l -> LetTuple (l, subst x byx a, b)
  | LetTuple (l, a, b) -> LetTuple (l, subst x byx a, subst x byx b)
  | FunTuple (l, a) when List.mem x l -> FunTuple (l, a)
  | FunTuple (l, a) -> FunTuple (l, subst x byx a)
(* FIN EXO B *)

let eval_builtins s e =
  match s with
  | "tee" ->
      print_string (string_from_expr e);
      e
  (* EXO 1 *)
  | "len" -> (
      match e with
      | String x -> Num (string_length x)
      | _ -> failwith "pb avec len")
  (* FIN EXO 1*)
  (* EXO A *)
  | "print_int" -> (
      match e with
      | Num x ->
          print_int x;
          Unit
      | _ -> failwith "pb avec print_int")
  | "print_expr" ->
      print_string (string_from_expr e);
      Unit
  | "ignore" -> Unit
  (* FIN EXO A *)
  (* EXO B *)
  | "fst" -> (
      match e with
      | Tuple l ->
          if List.length l = 2 then List.hd l else failwith "pb avec fst"
      | _ -> failwith "pb avec fst")
  | "snd" -> (
      match e with
      | Tuple l ->
          if List.length l = 2 then List.hd (List.rev l)
          else failwith "pb avec snd"
      | _ -> failwith "pb avec fst")
  (* FIN EXO B *)
  | _ -> failwith "TODO"

let eval_ocaml =
  let rec eval e =
    match e with
    | Var v -> failwith ("Unbound value " ^ v)
    | App (x, y) -> (
        let res = eval y in
        match eval x with
        | Fun (s, e) -> eval (subst s res e)
        | Builtin b -> eval_builtins b res
        (* EXO B *)
        | FunTuple (l, m) -> raise (NotImplemented __LINE__)
        (* FIN EXO B *)
        | _ -> failwith "Je ne peux pas appliquer")
    | Plus (a, b) -> (
        let resa = eval a in
        let resb = eval b in
        match (resa, resb) with
        | Num x, Num y -> Num (x + y)
        | _ -> failwith "pb avec plus")
    | Minus (a, b) -> (
        let resa = eval a in
        let resb = eval b in
        match (resa, resb) with
        | Num x, Num y -> Num (x - y)
        | _ -> failwith "pb avec plus")
    | Num x -> Num x
    | Fun (a, b) -> Fun (a, b)
    | Let (x, a, b) -> eval (App (Fun (x, b), a))
    | Letrec (f, a, b) -> eval (Let (f, subst f (Letrec (f, a, Var f)) a, b))
    | If (cond, a, b) -> (
        match eval cond with
        | Bool true -> eval a
        | Bool false -> eval b
        | _ -> failwith "pb de type")
    | Eq (a, b) -> (
        match (eval a, eval b) with
        | Num x, Num y when x = y -> Bool true
        | Bool x, Bool y when x = y -> Bool true
        (* EXO 1 *)
        | String x, String y when x = y -> Bool true
        (* EXO 1*)
        | _ -> Bool false)
    | Less (a, b) -> (
        match (eval a, eval b) with
        | Num x, Num y when x < y -> Bool true
        | _ -> Bool false)
    | Greater (a, b) -> (
        match (eval a, eval b) with
        | Num x, Num y when x > y -> Bool true
        | _ -> Bool false)
    | Bool a -> Bool a
    | Builtin s -> Builtin s
    (* EXO 1 *)
    | String s -> String s
    | Concat (a, b) -> (
        let resa = eval a in
        let resb = eval b in
        match (resa, resb) with
        | String x, String y -> String (x ^ y)
        (*
        | Num x, Num y -> String (string_of_int x ^ string_of_int y)
        | String x, Num y -> String (x ^ string_of_int y)
        | Num x, String y -> String (string_of_int x ^ y)
        *)
        | _ -> failwith "pb avec concat")
    | Cell (a, b) -> (
        let resa = eval a in
        let resb = eval b in
        match (resa, resb) with
        | String x, Num y -> String (string_get x y)
        | _ -> failwith "pb avec cell")
    (* FIN EXO 1 *)
    (* EXO A *)
    | Then (a, b) -> (
        let resa = eval a in
        let resb = eval b in
        match resa with
        | Unit -> resb
        | _ ->
            print_string "warning: this expression should have type unit.";
            resb)
    | Unit -> Unit
    (*FIN EXO A*)
    (* EXO B *)
    | Tuple l -> Tuple (List.map eval l)
    | FunTuple (l, a) -> raise (NotImplemented __LINE__)
    | LetTuple (l, a, b) -> raise (NotImplemented __LINE__)
    (* FIN EXO B *)
  in
  eval
