(*Question 3*)
"let rec times = fun x -> fun y -> if y = 1 then x else x + times x (y-1) in \
 times 4 5" |> expr_from_string |> eval_ocaml
