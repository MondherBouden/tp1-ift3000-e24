(*******************************************************************)
(* Langages de Programmation: IFT 3000 NRC 54959                   *)
(* TP1 ÉTÉ 2024. Date limite: Jeudi 14 juin à 17h00                *)
(* Enseignant: Mondher Bouden     IFT3000-MB@ift.ulaval.ca         *) 
(* Manipulation d'un reseau en utilisant un graphe                 *)
(*******************************************************************)
(* Étudiant(e):                                                    *)
(* NOM: _______________________ PRÉNOM:____________________________*) 
(* MATRICULE: _________________ PROGRAMME: _______________________ *)
(*                                                                 *)
(*******************************************************************)

open List

(* *****************************************************************)
(* Déclarations d'execptions et de types                           *)
(* *****************************************************************)

exception Non_Implante of string
type nom_ville = string
type ville = {nom : nom_ville; liste_voisins : nom_ville list}
type trajet = nom_ville * nom_ville
type reseau = Vide | Vlist of ville list

(******************************************************************)
(* Fonctions fournies (vous pouvez en ajouter au besoin ...)      *)
(* ****************************************************************)

(* Fonctions manipulant les listes  *)

let appartient e l = exists (fun x -> x = e) l

let enlever e l = 
  let (_, l') = partition (fun x -> x = e) l
  in l'

let remplacer e e' l =
  map (fun x -> (if (x = e) then e' else x)) l 

let rec union_liste l1 l2 = match l2 with 
  | [] -> l1
  | (x::r) -> if (appartient x l1) then (union_liste l1 r)
      		    else (union_liste (l1@[x]) r)

(* Fonctions manipulant le réseau  *)

let initialiser_reseau () = Vide

let retourner_nom_ville (v:ville) = (v.nom)

let retourner_liste_voisins1 (v:ville) = (v.liste_voisins)

let retourner_ville (nv:nom_ville) (r:reseau) = match r with
	| Vide -> failwith "Le reseau est vide"
	| Vlist lv ->
   	let l = filter (fun v -> ((retourner_nom_ville v) = nv)) lv 
    in
	  if (l = []) then failwith "Le reseau ne contient pas cette ville"
       	        else (hd l)

let retourner_liste_voisins2 (nv:nom_ville) (r:reseau) = match r with
	| Vide -> failwith "Le reseau est vide" 
	| Vlist lv -> let v = (retourner_ville nv (Vlist lv)) in
   	            (retourner_liste_voisins1 v)

let ville_existe (nv:nom_ville) (r:reseau) = match r with
	| Vide -> false
	| Vlist lv -> exists (fun v -> ((retourner_nom_ville v) = nv)) lv


(******************************************************************)
(* Fonctions à implémenter				                                *)
(* ****************************************************************)

(* Fonction permettant d'ajouter une ville dans un reseau *)
(* type:  nom_ville -> reseau -> reseau                   *)
(* -- À IMPLÉMENTER/MODIFIER (7 PTS) -------------------- *)

let ajouter_ville (nv:nom_ville) (r:reseau) = 
  raise (Non_Implante "ajouter_ville pas encore implémentée")

(* Fonction permettant d'ajouter une liste de villes dans un reseau *)
(* type: nom_ville list -> reseau -> reseau                         *)
(* -- À IMPLÉMENTER/MODIFIER (7 PTS) ------------------------------ *)

let ajouter_liste_villes (lv: nom_ville list) (r:reseau) =
  raise (Non_Implante "ajouter_liste_villes pas encore implémentée")

(* Fonction permettant de supprimer une ville dans un reseau *)
(* type:  nom_ville -> reseau -> reseau                      *)
(* -- À IMPLÉMENTER/MODIFIER (8 PTS) ----------------------- *)

let supprimer_ville (nv:nom_ville) (r:reseau) =   
	raise (Non_Implante "supprimer_ville pas encore implémentée")

(* Fonction permettant d'ajouter un trajet dans un reseau    *)
(* type:  trajet -> reseau -> reseau                         *)
(* -- À IMPLÉMENTER/MODIFIER (12 PTS) ---------------------- *)

let ajouter_trajet ((nv1,nv2):trajet) (r:reseau) =
	raise (Non_Implante "ajouter_trajet pas encore implémentée")

(* Fonction permettant d'ajouter une liste de trajets dans un reseau *)
(* type:  trajet list -> reseau -> reseau                            *)
(* -- À IMPLÉMENTER/MODIFIER (7 PTS) ------------------------------- *)

let ajouter_liste_trajets (lt: trajet list) (r:reseau) =
	raise (Non_Implante "ajouter_liste_trajets pas encore implémentée")

(* Fonction permettant de supprimer un trajet dans un reseau *)
(* type:  trajet -> reseau -> reseau                         *)
(* -- À IMPLÉMENTER/MODIFIER (12 PTS) ---------------------- *)

let supprimer_trajet ((nv1,nv2):trajet) (r:reseau) = 	
	raise (Non_Implante "supprimer_trajet pas encore implémentée")

(* Fonction permettant de trouver les chemins possibles dans un réseau *)
(* type:  reseau -> reseau                                             *)
(* -- À IMPLÉMENTER/MODIFIER (20 PTS) -------------------------------- *)

let trouver_chemins (r:reseau) = 
	raise (Non_Implante "trouver_chemins pas encore implémentée")

(* Fonction permettant d'afficher les villes d'un réseau *)
(* type: reseau -> unit                                  *)
(* -- À IMPLÉMENTER/MODIFIER (7 PTS) ------------------- *)

let afficher_villes (r:reseau) = 
	print_string "\tFonction pas encore implémentée!"

(* Fonction permettant d'afficher tout le réseau (villes et trajets *)
(* type: reseau -> unit                                             *)
(* -- À IMPLÉMENTER/MODIFIER (8 PTS) ------------------------------ *)

let afficher_reseau (r:reseau) = 
	print_string "\tFonction pas encore implémentée!"