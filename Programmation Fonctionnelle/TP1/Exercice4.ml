let series f n =
    let rec series_aux f i accu =
            if f i < 0 then accu
            else series_aux f (i-1) (accu + f i)
    in
    series_aux f n 0;;

let iter f n y =
    let rec iter_aux f i z =
            if i = 0 then z
            else iter_aux f (i-1) (f z)
    in
    iter_aux f n y;;

let add a b = iter incr a b;;