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


print_res "let f = fun x -> fun y -> x in f 3 4";;

print_res "let rec f = fun n -> if n = 0 then 0 else n + f (n-1) in f 5";;
print_res "let x = 3 in (x,(x+1))";;

print_res "fst (1,2)";;



