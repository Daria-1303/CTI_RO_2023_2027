(* EX. 1
Scrieți o funcție care ia ca parametru o mulțime de șiruri de caractere și o tipărește, 
folosind iteratorul S.iter pentru a parcurge elementele. 
Afișați mulțimea pe o linie, între acolade { } și cu virgulă între elemente. 
Puteți folosi print_string, print_char, print_newline (vezi modulul implicit deschis Pervasives) sau Printf.printf.
*)

module String = struct
  type t = string
  let compare = compare
end;;

module S = Set.Make(String);;

let s = S.of_list["ana"; "are"; "mere"];;

S.elements s;;

(* EX. 2
Asemănător cu funcția set_of_intlist, 
scrieți o funcție care ia o listă de perechi (de tip precizat) 
și returnează mulțimea elementelor de pe prima poziție din fiecare pereche 
(variante: a doua poziție; ambele poziții, dacă sunt de același tip).
*)

module Int = struct
  type t = int
  let compare = compare
end;;

module IS = Set.Make(Int);;

let functie lista = 
  let rec aux lista multime = match lista with
  | [] -> multime
  | (h1,h2)::t -> aux t (IS.add h1 multime)
  in aux lista IS.empty;;

IS.elements (functie [(1,2);(3,4);(5,6)]);;

(* EX. 3
Implementați funcția standard filter care ia ca parametri 
o funcție booleană (condiție, predicat) f și o mulțime s și 
returnează mulțimea elementelor din s care satisfac funcția f.
*)

let m = IS.of_list[1;2;3;4;5;6];;

let filter conditie multime = IS.fold ( fun e acc -> if conditie e then IS.add e acc else acc ) multime IS.empty;;

IS.elements (filter (fun x -> x mod 2 = 0) m);;

(* EX. 4
Implementați funcția standard partition care ia ca parametri 
o funcție booleană f și o mulțime s și 
returnează o pereche de mulțimi, cu elementele din s care satisfac, respectiv nu satisfac funcția f.
*)

let partition functie multime = IS.fold (fun e (acc1, acc2) -> if functie e then (IS.add e acc1, acc2) else (acc1, IS.add e acc2) ) multime (IS.empty, IS.empty);;

let (r1,r2) = partition ( fun x -> x mod 2 = 0) m;;

IS.elements r1;;
IS.elements r2;;

(* EX. 5
Scrieți o funcție care ia o mulțime de mulțimi (de exemplu, de șiruri), și 
returnează reuniunea (variantă: intersectia) mulțimilor.
*)

module Int = struct
  type t = int*int
  let compare = compare
end;;

module SS = Set.Make(IS);;

let m1 = IS.of_list [1;3;5];;
let m2 = IS.of_list [2;4];;
let m3 = IS.of_list [7;8;9];;

let multime_de_multimi = SS.add m1 ( SS.add m2 ( SS.add m3 SS.empty ) ) ;;

SS.elements multime_de_multimi;;

let reuniune multime = SS.fold ( fun e1 acc1 -> IS.fold ( fun e2 acc2 -> IS.add e2 acc2 ) e1 acc1 ) multime IS.empty;;

IS.elements ( reuniune multime_de_multimi );;

(* EX. 6
Scrieți o funcție care 
returnează mulțimea cifrelor unui număr. 
Scrieți apoi altă funcție care 
ia o mulțime de numere și 
returnează reuniunea/intersecția dintre mulțimile cifrelor lor.
*)

let f1 numar = 
  let rec aux numar multime = match numar with
  | 0 -> multime
  | _ -> aux (numar/10) (IS.add (numar mod 10) multime)
  in aux numar IS.empty;;

IS.elements (f1 1526);;

let f2_reu f1 multime = IS.fold ( fun e acc ->  IS.add e acc  ) multime f1;;

let f2_int f1 multime = IS.fold ( fun e acc -> if IS.mem e f1 then IS.add e acc else acc ) multime IS.empty;;

IS.elements (f2_reu (f1 1526) m);;
IS.elements (f2_int (f1 1782) m);;

(* EX. 8
 Scrieți o funcție care ia ca parametru 
 o mulțime s și un număr k și 
 returnează lista (sau mulțimea) tuturor submulțimilor lui s cu k elemente.

Indicație: țineți minte mulțimea aleasă deja, și numărul elementelor n din mulțimea rămasă. 
Dacă k = 0, nu mai trebuie ales nimic. 
Dacă k = n, trebuie luate toate elementele rămase. 
Altfel, pentru un element dat din mulțime, putem să îl alegem, sau nu.
*)

let subset set = IS.fold ( fun e acc1 -> SS.fold ( fun set acc2 -> SS.add (IS.add e set) acc2 ) acc1 acc1 ) set (SS.singleton IS.empty);;

let submultimi set k = SS.filter ( fun set -> IS.cardinal set = k ) set;;

let afisare set = List.map IS.elements (SS.elements set);;

let multimemultimi = subset m;;

let submultimik = submultimi multimemultimi 3;;

afisare submultimik;;

(* EX. 9
Scrieți o funcție care ia ca parametru 
o funcție (de doi întregi cu rezultat întreg) și două mulțimi de întregi A și B și 
returnează mulțimea valorilor f a b cu a ∈ A și b ∈ B. 
Adaptați parcurgerile făcute pentru produsul cartezian.
*)

let a = IS.of_list [1;2;3;4];;
let b = IS.of_list [3;4;5;6];;

let f x y = x + y ;;

let pairwith m1 fix nou = IS.fold (fun e acc -> IS.add (f e fix) acc) m1 nou;;
let ex9 m1 m2 = IS.fold ( fun e acc -> pairwith m1 e acc ) m2 IS.empty;;

let r9 = ex9 a b;;

IS.elements r9;;


let m1 = IS.of_list [1;2;3;4];;
let m2 = IS.of_list [5;6];;
let m3 = IS.of_list [1;5];;

let disjoint mult1 mult2 = IS.fold(fun e acc -> IS.fold ( fun e2 acc2-> if e2 = e then (not acc) else acc2 )mult2 acc ) mult1 true;;

disjoint m1 m2;;
disjoint m1 m3;;

let berenjec multime conditie = IS.fold ( fun e (acc1, acc2) -> if conditie e then (not acc1, acc2) else if (not (conditie e)) then (acc1, not acc2) else (acc1, acc2)) multime (false,true);;

let (r1,r2) = berenjec (IS.of_list[1;2;3;5]) (fun x -> x mod 2 = 1) ;;
r1;;
r2;;


