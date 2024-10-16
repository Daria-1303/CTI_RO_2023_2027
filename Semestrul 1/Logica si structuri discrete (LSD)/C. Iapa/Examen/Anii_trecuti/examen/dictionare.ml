module S = Map.Make(String);;
module I = Map.Make(Int);;

let int_map = I.add 6 2 (I.add 3 2 ( I.add 1 6 ( I.add 2 1 I.empty ) ) );;
let string_list = S.add "ana" 2 ( S.add "ana" 3 ( S.add "mere" 1 ( S.add "mere" 5 ( S.add "lsd" 2 ( S.singleton "ora" 3 ) ) ) ) );;

(*
Scrieți o funcție care ia o listă de asociere cu perechi de tip (șir, întreg) 
și creează un dicționar în care fiecare șir e asociat cu suma tuturor valorilor cu care e asociat în listă.
*)

let suma lista = List.fold_left (fun acc (e1,e2) -> if S.mem e1 acc then (S.add e1 (e2+ (S.find e1 acc)) acc) else S.add e1 e2 acc ) S.empty lista;;
S.bindings (suma [("ana", 2); ("ana", 3); ("are", 5); ("are", 1); ("mere", 5)]);;

(*
Scrieți o funcție care ia o listă de șiruri de caractere și creează un dicționar 
în care fiecare șir e asociat cu numărul aparițiilor din listă
*)

let count lista = List.fold_left (fun acc (e1,e2) -> if S.mem e1 acc then (S.add e1 (1+ (S.find e1 acc)) acc) else S.add e1 1 acc )  S.empty lista;;
S.bindings (count [("ana", 2); ("ana", 3); ("are", 5); ("are", 1); ("mere", 5)] );;

(*
Implementați cu ajutorul lui fold din modulul Map funcția filter care 
creează un nou dicționar doar cu perechile din dicționarul dat care satisfac o funcție dată.
Documentația specifică tipurile pentru funcțiile fold și filter. 
Ele funcționează similar ca pentru mulțimi, 
dar funcția dată ca prim argument are ca parametri atât cheia cât și valoarea intrării curente din dicționar 
(iar pentru fold și acumulatorul pentru rezultat). Ordinea parametrilor e aceeași ca la Set: 
(1) funcția, (2) colecția prelucrată (dicționarul), iar pentru fold și (3) valoarea inițială.
*)

let filter dictionar cond = I.fold (fun k v acc -> if cond k then I.add k v acc else acc ) dictionar I.empty;;
I.bindings int_map;;
I.bindings (filter (int_map) (fun x -> x mod 2 = 0) );;

(*
Pentru tipurile colecție (liste, mulțimi, dicționare) e util să avem funcții care ne spun 
dacă există un element care satisface o anume condiție, respectiv dacă toate elementele satisfac condiția.
Implementați funcțiile exists și for_all pentru dicționare, folosind fold. 
Ele iau ca parametru o funcție booleană de cheie și valoare (care exprimă condiția) și dicționarul în care se face căutarea. 
(Ele există ca funcții standard, deci puteți vedea tipul lor în documentație).
Încercați să scrieți prelucrarea folosind o excepție pentru a întrerupe parcurgerea 
dacă răspunsul nu mai depinde de restul elementelor (true pentru exists, resp. false pentru for_all). 
În acest caz puteți folosi mai simplu iter. Urmați exemplul cu liste de la curs și din notițe (sec. 5.1).
*)
let conditie x y = if x > 2 && y < 5 then true else false;;

let forall dictionar cond = try I.fold (fun k v acc -> if (not (cond k v)) then raise Exit else acc ) dictionar true
                            with Exit -> false;;
forall int_map conditie;;

let exists dictionar cond = try I.fold (fun k v acc -> if cond k v then raise Exit else acc) dictionar false
                            with Exit -> true;;
exists int_map conditie;;

(*
Implementați cu ajutorul lui fold funcția standard map care construiește un dicționar 
în care toate valorile au fost transformate folosind o funcție dată ca parametru.
*)

let map dictionar f = I.fold ( fun k v acc -> I.add (f k) (f v) acc ) dictionar I.empty;;
I.bindings int_map;;
I.bindings (map int_map (fun x -> x+2) );;

(*
Scrieți o funcție care primește un dicționar de la șiruri la întregi și o listă de șiruri și 
returnează mulțimea tuturor valorilor din dicționar care corespund șirurilor din listă.
Parcurgeți lista cu List.fold_left. 
Când folosiți find, tratați excepția Not_found pentru a adăuga o valoare la mulțimea-acumulator doar când cheia e găsită în dicționar.
*)

module SS = Set.Make(Int);;

let coresp dictionar lista = List.fold_left (fun acc e -> try if S.mem e dictionar then (SS.add (S.find e dictionar) acc) else raise Not_found with Not_found -> acc) SS.empty lista;;
S.bindings string_list;;
["ana";"mere";"pere"];;
SS.elements (coresp string_list ["ana";"mere";"pere"]);;

(*
Scrieți o funcție care primește o funcție și un dicționar și returnează 
maximul valorilor funcției pentru toate intrările dicționarului, sau generează excepția Not_found pentru un dicționar vid.
Funcția-parametru are ca argumente cheia și valoarea unei intrări, și poate returna valori arbitrare. 
Folosiți fold pentru parcurgere, și max (definită implicit pentru orice tip) pentru a compara valorile returnate de funcția parametru.
*)

let cond x y = x + y - 2;;

let maxv dictionar f = if I.is_empty dictionar then raise Not_found else I.fold (fun k v acc ->max (f k v) acc) dictionar 0;;
maxv int_map cond;;


let chiossy dictionar = I.fold (fun k v acc -> if k<v then k::acc else acc) dictionar [];;
I.bindings int_map;;
chiossy int_map;;