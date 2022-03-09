(*
1.
*)

let fact n = let y = ref 1 in let res = ref 1 in 
            while !y <= n do
            res := !res * !y;
            y := !y + 1;
            done;
            res;;
        
(*
2.
*)

let findmax array length = let i = ref 1 in if length <= 0 then failwith "length <= 0";
                            let max = ref array.(0) in
                            while !i < length do
                            if array.(!i) > !max then 
                            max := array.(!i);
                            i := !i + 1;
                            done;
                            !max;;


                                                                                                    