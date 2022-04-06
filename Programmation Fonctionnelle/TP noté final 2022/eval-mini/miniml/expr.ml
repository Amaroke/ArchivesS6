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
  | Bool of bool
  | Pair of expr * expr
  | Builtin of string
;;



