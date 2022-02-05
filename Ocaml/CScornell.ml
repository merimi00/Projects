
(*_______________________course cornell_______________________*)

(*let borne_sup x = match with let _ = print_endline "Hello world!"*)

let inc x = x+1;;


let x = 7 in x+1;; (*== 8*)
let x = 3 in x;; (*== 3*)

(*Dynamic semantics
let x = e1 in e2*)

(*static semantics
let x : t = e1 in e2*)

let x = 42 in
  (* y is not meaningful here *)
  x + (let y="3110" in
         (* y is meaningful here *)
         int_of_string y)
;;

let rec f x =
  if x = 0 then 0
  else x + f (x-1)
;;

let t x =
  let rec f_term x acc =
    if x = 0 then acc
    else f_term (x-1) (x+acc)
  in
  f_term x 0
;;

(*let rec pow (x:int) (y:int) : int = *)
let rec pow x y =
  if y = 0 then 1
  else if y < 0 then -1
  else x*pow x (y-1)
;;


(* [even n] is whether [n] is even.
 * requires: [n >= 0] *)
let rec even n =
  n=0 || odd (n-1)

(* [odd n] is whether [n] is odd.
 * requires: [n >= 0] *)
and odd n =
  n<>0 && even (n-1)
;;

(*let x = 5 in ((let x = 6 in x) + x);;*)

let () = Printf.printf "%d\n" (t 1_000_000)




        (*zevnze*)
