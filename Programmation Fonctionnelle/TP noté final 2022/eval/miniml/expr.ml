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
  (* paires *)
  | Tuple of expr list
  | LetTuple of string list * expr * expr   
  | FunTuple of string list * expr 
  (* chaînes *)
  | String of string
  | Concat of  expr *expr
  | Cell of expr * expr
  (* point-virgule *)
  | Then of expr * expr
  | Unit 
  | Builtin of string
;;



