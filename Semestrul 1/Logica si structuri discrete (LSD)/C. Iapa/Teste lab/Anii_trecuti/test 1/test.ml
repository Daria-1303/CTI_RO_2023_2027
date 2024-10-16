(*
GOSTIAN LOREDANA-GABRIELA 3.2
*)

(*
(3p) Fiind dat ̆a o mult, ime s s, i un element x, implementat, i funct, ia
split, care returneaz ̆a un tuplu de 3 elemente, (l, present, r). Primul
element, l, reprezint ̆a o submult, ime pentru care elementele sunt mai
mici decˆat x, present reprezint ̆a o valoare bool care este fals ̆a dac ̆a x
nu apart, ine mult, imii s, iar r este submult, imea pentru care elementele
sunt mai mari ca x.
Exemplu: pentru mult, imea {1, 2, 3, 4, 5, 6} s, i x = 4, funct, ia va
returna ({1, 2, 3}, true, {5, 6}).
*)

module Int = struct
  type t = int
  let compare = compare
end;;

module S = Set.Make(Int);;

let s = S.of_list[1;2;3;4;5;6];;

let split multime element = S.fold (fun e (acc1,acc2,acc3) -> 
                                                              if e < element then (S.add e acc1, acc2, acc3) 
                                                              else 
                                                                if e > element then (acc1, acc2, S.add e acc3) 
                                                                else if e = element then (acc1, not acc2, acc3) 
                                                                  else (acc1,acc2,acc3)) multime (S.empty,false,S.empty) ;;

let (r1,r2,r3) = split s 4;;

S.elements r1;;
r2;;
S.elements r3;;

(*
(3p) Avet, i un dict, ionar de la int la mult, ime de inturi. Scriet, i o funct, ie
ce modific ̆a acest dict, ionar astfel ˆıncˆat din fiecare mult, ime valoare este
s, tears ̆a cheia corespunz ̆atoare (dac ̆a ea se afl ̆a ˆın mult, ime).
Exemplu: pentru dict, ionarul 2 → {2, 4, 6}; 8 → {1, 2} se va obt, ine
dict, ionarul 2 → {4, 6}; 8 → {1, 2}.
*)


module M = Map.Make(Int);;

let sir1 = S.of_list [2;4;6] ;;
let sir2 = S.of_list [1;2];;

let dic = M.add 2 sir1 ( M.add 8 sir2 M.empty ) ;;

M.bindings dic;;

let ex2 dictionar = M.fold( fun k v acc -> M.add k (S.remove k v) acc ) dictionar M.empty;;

ex2 dic;;

(*
(3p) Fiind dat un arbore oarecare cu elemente ˆıntregi, implementat, i

o funct, ie ce calculeaz ̆a ˆın ̆alt, imea acestuia. Scriet, i parcurgerea ˆın pre-
odine a arborelui dat precum s, i reprezentarea acestuia folosind tipul

recursiv.
*)

type 'a tree = T of 'a * 'a tree list;;

let oarecare = T ( 8, [ T ( 5, [ T ( 2, [T ( 4, [] )] ) ] )   ; T ( 17 , [ T ( 13, [ T ( 9, []); T(16,[]) ] )  ; T ( 20, [] ) ; T( 25, [] ) ] ) ] ) ;;

let rec height tree = match tree with
  | T(r,[]) -> 0
  | T(r, h::t) -> 1 + max ( height h ) ( List.fold_left(fun acc e -> max acc (height e) ) 0 t ) ;;

height oarecare;;

let concat l1 l2 = List.fold_left( fun acc e -> e:: acc ) l1 l2;;

(* parcurgere preordine *)

let rec preordine tree = match tree with
  | T(r,[]) -> [r]
  | T(r, h::t) -> r :: concat (preordine h) ( List.fold_left(fun acc e -> concat acc (preordine e) ) [] t ) ;;

preordine oarecare;;

(* reprezentare preordine *)

open Printf

let rec afisare n p = if p==0 then ( printf "%d\n" n)
                              else ( printf (" "); afisare n (p-1) ) ;;

let reprezentare = 
  let rec aux d = function
    | T(r,[]) -> ()
    | T(r, h::t) -> aux (d+1) h;
                    afisare r d;
                    aux (d+1) ( List.fold_left(fun acc e -> afisare acc (aux e) ) () t )
  in aux 0;;

  reprezentare oarecare;;