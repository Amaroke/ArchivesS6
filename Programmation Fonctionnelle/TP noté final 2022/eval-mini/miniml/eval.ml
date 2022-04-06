open Expr;;
exception NotImplemented of int;;

type value =
  | VNum of int          
  | VFun of string * expr
  | VBool of bool
  | VPair of value * value
  | VBuiltin of string
;;





let expr_from_string s =
  let lexbuf = Lexing.from_string s in
  let exp = Miniml_parse.input Miniml_lex.token lexbuf in
  exp
;;


let rec string_from_expr  = function
  | Var x -> x
  | Fun (x,y) -> "(fun " ^ x ^ "->" ^ (string_from_expr y) ^ ")"
  | Let (y,a,b) -> "let " ^ y ^"=" ^ (string_from_expr a) ^ " in " ^ (string_from_expr b)
  | Letrec (y,a,b) -> "let rec " ^ y ^"=" ^ (string_from_expr a) ^ " in " ^ (string_from_expr b)
  | Minus (a,b) -> (string_from_expr a) ^"-" ^ (string_from_expr b)
  | Plus (a,b) ->  (string_from_expr a) ^"+" ^ (string_from_expr b)
  | App (e,f) -> (string_from_expr e) ^ " ( " ^(string_from_expr f) ^ ")"
  | Num (x) -> (string_of_int x)
  | If (y,a,b) -> "if" ^ (string_from_expr y) ^ " then " ^ (string_from_expr a) ^ " else " ^ (string_from_expr b)
  | Eq (a,b) ->  (string_from_expr a) ^ " = " ^ (string_from_expr b)
  | Less (a,b) -> (string_from_expr a) ^ " < " ^ (string_from_expr b)
  | Greater (a,b) -> (string_from_expr a) ^ " > " ^ (string_from_expr b)
  | Bool(x) -> if x then "true" else "false"
  | Builtin x -> x
  | Pair(x,y) -> "(" ^ (string_from_expr x) ^"," ^(string_from_expr y) ^ ")"


      
let rec subst x byx e = match e with
  | Var y when y = x -> byx
  | Var y -> Var y
  | Num y -> Num y
  | Let (y,a,b) when y = x -> Let(y,subst x byx a,b)
  | Let (y,a,b) -> Let(y,subst x byx a,subst x byx b)
  | Letrec (y,a,b) when y <> x -> Letrec(y,subst x byx a,subst x byx b)
  | Letrec (y,a,b) -> Letrec(y,a,b)
  | Fun (y,a) when y <> x -> Fun(y, subst x byx a) 
  | Fun (y,a) -> Fun(y, a)
  | Plus(a,b) -> Plus(subst x byx a , subst x byx b)
  | Minus(a,b) -> Minus(subst x byx a , subst x byx b)
  | App (e1,e2) -> App(subst x byx e1, subst x byx e2)
  | Eq(a,b) -> Eq(subst x byx a, subst x byx b)
  | Less(a,b) -> Less(subst x byx a, subst x byx b)
  | Greater(a,b) -> Greater(subst x byx a, subst x byx b)
  | If(a,b,c) -> If(subst x byx a, subst x byx b, subst x byx c)
  | Bool _ -> e
  | Builtin _ -> e
  | Pair(a,b) -> Pair(subst x byx a, subst x byx b)


let eval_builtins s e =
  match s with
  |    "tee" -> print_string (string_from_expr e);  e
  |  "fst" ->
      (
        match e with
          Pair (x,y) -> x
        | _ -> failwith "not a pair"
      )
  |  "snd" ->
      (
        match e with
          Pair (x,y) -> y
        | _ -> failwith "not a pair"
      )
  |    _ -> failwith "TODO";;

let eval_ocaml =
  let rec eval e = match e with
  | Var x -> failwith ("Unbound value " ^ x)
  | App (x,y) ->  let res = eval y in (
       match eval x with
       | Fun (x, e1) -> eval (subst x res e1)
       | Builtin b -> eval_builtins b res
       | _ -> failwith "Je ne peux pas appliquer"
     )
  | Plus(a,b) ->
     let resa = eval a in
     let resb = eval b in
     (match (resa, resb) with
      | (Num x, Num y) -> Num(x+y)
      | _ -> failwith "pb avec plus"                
     )
  | Minus(a,b) ->
     let resa = eval a in
     let resb = eval b in
     (match (resa, resb) with
      | (Num x, Num y) -> Num(x-y)
      | _ -> failwith "pb avec plus"
     )
  | Num x -> Num x
  | Fun(a,b) -> Fun(a,b)
  | Let (x,a,b) -> eval (App(Fun(x, b), a))
  | Letrec (f,a,b) -> eval (Let(f,
                                subst f (Letrec(f,a,Var f)) a,
                                b))
  | If (e1, a,b) ->
     (match eval e1  with
     | Bool true -> eval a
     | Bool false -> eval b
     | _ -> failwith "pb de type"
     )
  | Eq (a,b) -> (match (eval a, eval b ) with
                | Num x, Num y when x = y -> Bool true
                | Bool x, Bool y when x = y -> Bool true
                | _ -> Bool false
                )
  | Less (a,b) -> (match (eval a, eval b ) with
                | Num x, Num y when x < y -> Bool true
                | _ -> Bool false
                )
  | Greater (a,b) -> (match (eval a, eval b ) with
                | Num x, Num y when x > y -> Bool true
                | _ -> Bool false
                )
  | Bool a -> Bool a
  | Builtin x -> Builtin x
  | Pair(x,y) -> Pair(eval x,eval y)

in eval



