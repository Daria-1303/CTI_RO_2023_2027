(* Șiruri recurente

Având ca exemplu progresia aritmetică discutată la curs, scrieți pentru progresia geometrică:

a) o funcție recursivă, folosind valori constante pentru primul termen și rație
b) o funcție care are ca parametri și aceste două valori. Folosiți let ... in și o funcție auxiliară cu un parametru.
*)

let rec prog_geom_a b1 n q = match n with
  | 1 -> b1
  | _ -> q* prog_geom_a b1 (n-1) q;;

prog_geom_a 1 4 2;;

let prog_geom_b b1 n q= 
  let rec aux n = match n with
  | 1 -> b1
  | _ -> q* aux (n-1)
  in aux n;;

prog_geom_b 1 4 2;;

(* Expresii numerice

Folosind definiția tipului expresie de la curs, scrieți în ML reprezentarea pentru expresiile: 
2 * (3 - 8) + 4 și 2 + 4 - 5 * 3 . Verificați că puteți aplica funcția de evaluare și obțineți rezultatul corect.
*)

type expr = I of int
  |Add of expr*expr
  |Sub of expr*expr
  |Mult of expr*expr;;

let rec eval expresie = match expresie with
  |I i -> i
  |Add (e1, e2) -> eval e1 + eval e2
  |Sub (e1, e2) -> eval e1 - eval e2
  |Mult (e1, e2) -> eval e1 * eval e2 ;;

let expr1 = Add( I 4, Mult (I 2, Sub (I 3, I 8 ) ) ) ;;
 eval expr1;;

let expr2 = Add ( I 2, Sub ( I 4, Mult (I 5, I 3)));;
eval expr2;;

(* Cel mai mare divizor comun

Știind că cmmdc(a, b) = cmmdc(b, a mod b) dacă b ≠ 0, 
scrieți o funcție recursivă pentru cel mai mare divizor comun. Care e cazul de bază ?
*)

let rec cmmdc a b = if a > b then cmmdc (a-b) b else if a < b then cmmdc a (b-a) else a;;
cmmdc 14 60;;

(*
în laboratorul trecut am scris funcții de ordin superior (funcționale) care aplicau o funcție de 2, 3, 4 ori. 
Definiți (recursiv) o funcție care ia ca parametru un întreg n și o funcție, și returnează funcția compusă cu ea însăși de n ori.
*)

let rec comp f n = match n with 
 | 1 -> f ( f n )
 | _ -> f ( f (n-1) ) ;;

comp (fun x -> x+1) 2;;

(*
Un număr e reprezentat uzual în scris ca un șir de cifre în baza 10.
Un șir e o noțiune recursivă (un element, sau un șir urmat de un element).
Putem spune atunci că un număr n e fie o singură cifră, fie ultima cifră (n mod 10) precedată de alt număr (n / 10).
Folosind această definiție scrieți funcții recursive care calculează: 
suma cifrelor unui număr, 
numărul de cifre, 
produsul lor, 
cifra maximă / minimă, etc.
*)

let rec suma n = match n with 
 | subunit when n<10 -> n
 | _ -> (n mod 10) + suma (n/10);;
suma 1234;;

let rec count n = match n with 
  | subunit when n<10 -> 1
  | _ -> 1+ count (n/10);;
count 1234;;

let rec prod n = match n with
  | subunit when n<10 -> n
  | _ -> (n mod 10) * prod (n/10);;
prod 1234;;

let rec cifmax n = match n with
  | subunit when n<10 -> n
  | _ -> max (n mod 10) (cifmax (n/10));;
cifmax 1243;;

(*
(2) Implementati o functie care verifica daca un num̆ar, dat ca parametru, este prim.
Exemplu: pentru n = 28, functia va returna FALSE, iar pentru n = 3, functia va returna TRUE.
*)

let prim n = 
  let rec aux n d = if d>n/2 then true 
                      else 
                        if n mod d = 0 then false 
                          else aux n (d+1) 
  in aux n 2 ;;

prim 28;;

(*
scrieti o functie recursiva care ia ca parametri 2 intregi a si b,
 si o functie cond : Z -> {true, false}, si returneaza produsul acelor intregi x din intervalul [a,b] 
 pentru care cond(x) e adevarata.
*)

let prod a b cond = 
  let rec aux a b cond produs = match b with
  | final when b<a -> produs
  | _ -> if cond b then aux a (b-1) cond b*produs else aux a (b-1) cond produs
  in aux a b cond 1;;

prod 2 8 (fun x -> x mod 2 = 0);;

(*
Reprezentati o functie recursiva care ia ca parametru o functie f:Z->Z, un numar natural n si un numar intreg x 
si returneaza valoarea functiei aplicate de n ori in x.
*)

let aplicare f n x = 
  let rec aux f n x fnou = match n with
  | 0 -> fnou
  | _ -> aux f (n-1) x (f fnou)
  in aux f n x x;;
aplicare (fun x -> x+1) 3 0;;


let fromto a b c = 
  let rec aux a b c suma = match b with
  | final when b<a -> suma
  | _ -> if (b mod c = 0) then aux a (b-1) c (b+suma) else aux a (b-1) c suma
  in aux a b c 0;;
fromto 2 6 2;;
