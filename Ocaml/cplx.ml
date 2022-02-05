(*let time f a =
  let t0 = Unix.gettimeofday () in
  let r = f a in
  let t1 = Unix.gettimeofday () in
  (r, (t1 -. t0) *. 1000.)
;;*)
let time f a =
  let t0 = GetSystemTimeAsFileTime() in
  let r = f a in
  let t1 = GetSystemTimeAsFileTime() in
  (r, (t1 -. t0) *. 1000.)
;;


let rand_list n =
  let rec loop i acc =
    if i == 0 then acc else
      loop (i-1) ((Random.int n)::acc)
  in
  loop n []
;;

let insert_sort comp l =
  let rec ins  l x =
    match l with
    [] -> [ x ]
    | y :: ll ->
    if comp x y <= 0 then x :: y :: ll
    else
      y :: ins ll x
  in
  List.fold_left ins [] l
;;

let quick_sort comp l =
  let rec split l e acc_s acc_b =
    match l with
    [] -> acc_s, acc_b
    | x :: ll ->
      let c = comp x e in
      if c < 0 then
       split ll e (x :: acc_s) acc_b
      else if c = 0 then
        split ll e (acc_s) acc_b
    else
       split ll e acc_s (x::acc_b)
  in
  let rec loop l =
    match l with
    [] -> l
    | e :: ll -> let ls, lb = split ll e [] [] in
    (loop ls) @  [e] @  (loop lb)
  in
  loop l
;;



let test_sort f n sizes =
  Random.init 42;
  Printf.printf "%s\n" n;
  List.iter (fun s ->
    let l = rand_list s in
    let res, t = time f l in
    Printf.printf "%d\t%f\n%!" s t
    ) sizes;
  Printf.printf "\n\n"

  ;;

test_sort (insert_sort compare) "insert_sort" [0;1;10;20;50;100;200;500;1000;10000] ;;
test_sort (quick_sort compare) "quick_sort" [0;1;10;20;50;100;200;500;1000;20000] ;;
test_sort (List.sort compare) "List.sort" [0;1;10;20;50;100;200;500;1000;20000] ;;
