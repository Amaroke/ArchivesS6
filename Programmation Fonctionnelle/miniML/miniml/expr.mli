type expr =
  | Var of string
  | Num of int          
  | Eq of expr * expr 
  | Less of expr * expr 
  | Greater of expr * expr 
  | Plus of expr * expr 
  | Minus of expr * expr 
  | Fun of string * expr
  | Let of string * expr * expr   
  | Letrec of string * expr * expr
  | If of expr * expr * expr 
  | App of expr * expr
  | Tee
  | Bool of bool
  (* paires *)
  | Pair of expr * expr
  | Fst
  | Snd
  (*  listes *)          
  | Nil
  | Cons of expr * expr
  | Match of expr * expr * string * string * expr
  (* ref *)
  | Get
  | Incr
  (* exceptions *)         
  | Raise of expr           
  | Try of expr * string * expr
;;
