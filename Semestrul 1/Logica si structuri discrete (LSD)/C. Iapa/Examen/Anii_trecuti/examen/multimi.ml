module S = Set.Make(String);;
module SS = Set.Make(Int);;

(*
Asemănător cu funcția set_of_intlist, scrieți o funcție care ia o listă de perechi 
(de tip precizat) și returnează mulțimea elementelor de pe prima poziție din fiecare pereche 
(variante: a doua poziție; ambele poziții, dacă sunt de același tip).
*)

let intlist lista = List.fold_left (fun acc (e1,e2) -> SS.add e1 acc ) SS.empty lista;;
SS.elements (intlist [(1,2);(3,4)]);;

(*
Implementați funcția standard filter care ia ca parametri o funcție booleană (condiție, predicat) f și o mulțime s 
și returnează mulțimea elementelor din s care satisfac funcția f.
*)

let filter f s = SS.fold (fun e acc -> if f e then SS.add e acc else acc ) s SS.empty;;
SS.elements (filter (fun x -> x mod 2 = 0) (SS.of_list[1;2;3;4;5]));;

(*
Implementați funcția standard partition care ia ca parametri o funcție booleană f și o mulțime s 
și returnează o pereche de mulțimi, cu elementele din s care satisfac, respectiv nu satisfac funcția f.
*)

let partition f s = SS.fold ( fun e (acc1, acc2) -> if f e then (SS.add e acc1, acc2) else (acc1, SS.add e acc2) ) s (SS.empty, SS.empty);;
let (r1,r2) = partition (fun x -> x mod 2 = 0) (SS.of_list[1;2;3;4;5]);;
SS.elements r1;;
SS.elements r2;;

(*
Scrieți o funcție care ia o mulțime de mulțimi (de exemplu, de șiruri), și returnează reuniunea (variantă: intersectia) mulțimilor.
*)

let reuniune m1 m2 = SS.fold (fun e acc -> SS.add e acc ) m1 m2;;
SS.elements (reuniune (SS.of_list[1;2;3;4]) (SS.of_list[5;6;7]));;

let intersectie m1 m2 = SS.fold (fun e acc -> if SS.mem e m2 then SS.add e acc else acc ) m1 SS.empty;;
SS.elements (intersectie (SS.of_list[1;2;3;4]) (SS.of_list[1;3;5;6]));;

(*
Scrieți o funcție care returnează mulțimea cifrelor unui număr. 
Scrieți apoi altă funcție care ia o mulțime de numere și returnează reuniunea/intersecția dintre mulțimile cifrelor lor.
*)

let cifre numar = 
  let rec aux numar multime = match numar with
  | 0 -> multime
  | _ -> aux (numar/10) (SS.add (numar mod 10) multime)
  in aux numar SS.empty;;
SS.elements (cifre 1254);;


let despartire lista = List.fold_left (fun (acc1, acc2) (e1,e2) -> (S.add e1 acc1, S.add e2 acc2)) (S.empty, S.empty) lista;;

let (r1,r2) = despartire [("ana", "are"); ("multe", "mere"); ("gustoase", "rosii")];;
S.elements r1;;
S.elements r2;;
