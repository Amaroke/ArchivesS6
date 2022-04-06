open Miniml.Eval;;

let print_res x =
  try
    print_string ("testing " ^ x^"\nRésultat: ");
    x |> expr_from_string |> eval_ocaml |>
      string_from_expr |> print_string;
    print_string "\n"
  with
    NotImplemented x -> print_string "Pas encore fait, ligne "; print_int x; print_string "\n"
;;


print_res "let f = fun x -> fun y -> x in f 3 (tee 4)";;

(* EXO 1 *)

print_res "let x = \"toto\" in x";;
print_res "let x = \"toto\" in x ^ x";;
print_res "let x = \"toto\" in x.[1] ^ x.[0]";;
print_res "let x = \"toto\" in len x";;
print_res "let palindrome = fun s -> let n = len s in let rec palindrome_aux = (fun i ->  if i = n - 1 then true else (if s.[i] = s.[n - 1 - i] then palindrome_aux (i+1) else false)) in palindrome_aux 0 in palindrome \"radar\"";;

(* FIN EXO 1 *)

(* EXO A *)

print_res "1; 2";;

print_res "let f = fun x -> (print_int 1; x) in f 4";;

print_res "let f = fun x -> (print_expr true; x) in f 4";;

print_res "( ignore 2 ; 4 ) + 6";;


(* FIN EXO A *)

(* EXO B *)
print_res "(1,2)";;

print_res "(1,2,3)";;

print_res "fst (1,2)";;

print_res "let x = 1 in (x, (x+1))";;

print_res "let (a,b) = (1,2) in let (a,b) = (b,a) in a - b";;

print_res "(fun (x,y) -> x+y) (1,2)";;

print_res "let (x,y,z) = (1,2,3) in  x+z";;

(* FIN EXO B *)


