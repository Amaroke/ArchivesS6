open Expr

exception NotImplemented of int

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
      "let rec " ^ y ^ "=" ^ string_from_expr a ^ "in " ^ string_from_expr b
  | Minus (a, b) -> string_from_expr a ^ "-" ^ string_from_expr b
  | Plus (a, b) -> string_from_expr a ^ "+" ^ string_from_expr b
  | App (e, f) -> string_from_expr e ^ " ( " ^ string_from_expr f ^ ")"
  | Num x -> string_of_int x
  | If (y, a, b) ->
      "if " ^ string_from_expr y ^ " then (" ^ string_from_expr a ^ ") else ("
      ^ string_from_expr b ^ ")"
  | Eq (a, b) -> string_from_expr a ^ " = " ^ string_from_expr b
  | Less (a, b) -> string_from_expr a ^ " < " ^ string_from_expr b
  | Greater (a, b) -> string_from_expr a ^ " > " ^ string_from_expr b
  | Bool x -> string_of_bool x
  | Tee -> "tee "
  | Nil -> "[]"
  | Cons (a, b) -> string_from_expr a ^ " :: " ^ string_from_expr b
  | Match (e, ifnil, x, l, ifcons) ->
      "match " ^ string_from_expr e ^ " with [] -> " ^ string_from_expr ifnil
      ^ "|" ^ x ^ "::" ^ l ^ "-> " ^ string_from_expr ifcons
  | Try (x, y, z) ->
      "try " ^ string_from_expr x ^ " with " ^ y ^ " -> " ^ string_from_expr z
  | Raise x -> "raise " ^ string_from_expr x
  | Get -> raise (NotImplemented __LINE__)
  | Incr -> raise (NotImplemented __LINE__)
  | Fst -> "fst "
  | Snd -> "snd "
  | Pair (x, y) -> string_from_expr x ^ ", " ^ string_from_expr y

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
  | App (e, f) -> App (subst x byx e, subst x byx f)
  | Eq (a, b) -> Eq (subst x byx a, subst x byx b)
  | Less (a, b) -> Less (subst x byx a, subst x byx b)
  | Greater (a, b) -> Greater (subst x byx a, subst x byx b)
  | Tee -> Tee
  | If (a, b, c) -> If (subst x byx a, subst x byx b, subst x byx c)
  | Bool _ -> e
  | Nil -> Nil
  | Cons (a, b) -> Cons (subst x byx a, subst x byx b)
  | Raise _ -> e
  | Try (_, _, _) -> e
  | Match (e, ifnil, y, l, ifcons) when x = y || x = l ->
      Match (subst x byx e, subst x byx ifnil, y, l, ifcons)
  | Match (e, ifnil, y, l, ifcons) ->
      Match (subst x byx e, subst x byx ifnil, y, l, subst x byx ifcons)
  | Incr -> raise (NotImplemented __LINE__)
  | Get -> raise (NotImplemented __LINE__)
  | Fst -> Fst
  | Snd -> Snd
  | Pair (x, y) -> e

let eval_ocaml =
  let rec eval x =
    match x with
    | Var x -> failwith ("Unbound value " ^ x)
    | App (x, y) -> (
        let res = eval y in
        match eval x with
        | Fun (x, e) -> eval (subst x res e)
        | Tee ->
            print_string (string_from_expr res);
            res
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
    | If (e, a, b) -> (
        let rese = eval e in
        match rese with
        | Bool true -> eval a
        | Bool false -> eval b
        | _ -> failwith "pb avec eq")
    | Eq (a, b) -> (
        let resa = eval a in
        let resb = eval b in
        match (resa, resb) with
        | Num x, Num y -> Bool (x = y)
        | Bool x, Bool y -> Bool (x = y)
        | _ -> failwith "pb avec eq")
    | Less (a, b) -> (
        let resa = eval a in
        let resb = eval b in
        match (resa, resb) with
        | Num x, Num y -> Bool (x < y)
        | _ -> failwith "pb avec less")
    | Greater (a, b) -> (
        let resa = eval a in
        let resb = eval b in
        match (resa, resb) with
        | Num x, Num y -> Bool (x > y)
        | _ -> failwith "pb avec greater")
    | Match (e, ifnil, x, l, ifcons) -> (
        let rese = eval e in
        match rese with
        | Nil -> eval ifnil
        | Cons (a, b) -> eval (subst l (eval b) (subst x (eval a) ifcons))
        | _ -> failwith "pb avec match")
    | Nil -> Nil
    | Cons (a, b) -> Cons (eval a, eval b)
    | Bool a -> Bool a
    | Tee -> Tee
    | Raise a -> Raise (eval a)
    | Try (a, b, c) -> (
        match eval a with Raise z -> eval (subst b z c) | y -> y)
    | _ -> raise (NotImplemented __LINE__)
  in
  eval

(* exemples de transformations *)
let rec delete_pairs expr =
  match expr with
  | Pair (x, y) ->
      Fun ("_fn", App (App (Var "_fn", delete_pairs x), delete_pairs y))
  | Fst -> Fun ("_pair", App (Var "_pair", Fun ("_x", Fun ("_y", Var "_x"))))
  | Snd -> Fun ("_pair", App (Var "_pair", Fun ("_x", Fun ("_y", Var "_y"))))
  | Fun (x, y) -> Fun (x, delete_pairs y)
  | Let (y, a, b) -> Let (y, delete_pairs a, delete_pairs b)
  | Letrec (y, a, b) -> Letrec (y, delete_pairs a, delete_pairs b)
  | App (a, b) -> App (delete_pairs a, delete_pairs b)
  | If (a, b, c) -> If (delete_pairs a, delete_pairs b, delete_pairs c)
  | Plus (x, y) -> Plus (delete_pairs x, delete_pairs y)
  (* etc *)
  | _ -> expr

let delete_cpt expr =
  let rec delete expr =
    match expr with
    | Num x -> Fun ("_cpt", Pair (Num x, Var "_cpt"))
    | Var x -> Fun ("_cpt", Pair (Var x, Var "_cpt"))
    | Plus (x, y) ->
        Fun
          ( "_cpt",
            Let
              ( "_res",
                App (delete x, Var "_cpt"),
                Let
                  ( "_newx",
                    App (Fst, Var "_res"),
                    Let
                      ( "_cpt",
                        App (Snd, Var "_res"),
                        Let
                          ( "_res",
                            App (delete y, Var "_cpt"),
                            Let
                              ( "_newy",
                                App (Fst, Var "_res"),
                                Let
                                  ( "_cpt",
                                    App (Snd, Var "_res"),
                                    Pair
                                      ( Plus (Var "_newx", Var "_newy"),
                                        Var "_cpt" ) ) ) ) ) ) ) )
    | Get -> Fun ("_cpt", Pair (Var "_cpt", Var "_cpt"))
    | Incr ->
        Fun ("_cpt", Pair (Plus (Var "_cpt", Num 1), Plus (Var "_cpt", Num 1)))
    | Let (x, a, b) ->
        Fun
          ( "_cpt",
            Let
              ( "_res",
                App (delete a, Var "_cpt"),
                Let
                  ( x,
                    App (Fst, Var "_res"),
                    Let
                      ("_cpt", App (Snd, Var "_res"), App (delete b, Var "_cpt"))
                  ) ) )
    | App (x, y) -> raise (NotImplemented __LINE__)
    | _ -> expr
  in
  App (Fst, App (delete expr, Num 0))
