module S =Set.Make(String);;

let reuniune lista = List.fold_left(fun acc e1 -> S.union e1 acc ) S.empty lista;;

module IM = Map.Make(Int);;
let asociere dictionar f = IM.fold ( fun k v acc -> IM.add (f k v) v acc ) dictionar IM.empty;;



type 'a bintree = Nil|BT of 'a bintree * 'a * 'a bintree;;

let forall arbore cond = 
  let rec aux arbore cond rezultat= match arbore with
  | Nil -> rezultat
  | BT(left,n,right) -> try if cond n 
                              then (aux left cond rezultat || aux right cond rezultat) 
                              else raise Exit 
                        with Exit -> false
  in aux arbore cond true;;
