(*****************************************************************)
(** Langages de Programmation: IFT 3000 NRC 54959                 
    TP1 ÉTÉ 2024. Date limite: Jeudi 14 juin à 17h00               
    Manipulation d'un reseau en utilisant un graphe              *)
(*****************************************************************)
(*****************************************************************) 
(* Spécifications (Signature du réseau) 	                     *)  
(*****************************************************************)

(** {1 Déclarations d'execptions et de types}*)

exception Non_Implante of string  (** Une exception utilisée pour tester les fonctions *)

type nom_ville = string  (** Le nom d'une ville dans le réseau aérien représentant un aéroport *)

type ville = {nom : nom_ville; liste_voisins : nom_ville list}  (** Une ville implémentée avec un enregistrement *)

type trajet = nom_ville * nom_ville  (** Un trajet implémenté avec une paire représentant le départ et l'arrivée *)

type reseau = 
 | Vide  (** Un réseau vide *)
 | Vlist of ville list  (** Un réseau contenant une liste de villes *)

(** {1 Interface des fonctions à implémenter}*)

val initialiser_reseau : unit -> reseau
(** [initialiser_reseau ()] 
    retourne un réseau vide. Cette fonction est founie !

    Exemple:
{[# let r = initialiser_reseau ();;]}
*)

val ajouter_ville : nom_ville -> reseau -> reseau
(** [ajouter_ville nv r] 
    Cette fonction prend le nom d'une ville nv et un réseau r et qui rend le réseau mis à jour 
    contenant la nouvelle ville. Elle doit retourner un réseau inchangé si la ville est déjà dans le réseau. 
    De ce fait, on ne rajoute pas de doublons dans le réseau.

    Exemple:
{[# let r = ajouter_ville "Quebec" r;;]}
*)

val ajouter_liste_villes : nom_ville list -> reseau -> reseau
(** [ajouter_liste_villes lv r] 
    Cette fonction prend une liste de noms de villes lv et un réseau r et retourne le réseau mis à jour 
    dans lequel toutes les villes ont été ajoutées dans ce réseau.

    Exemple:
{[# let r = ajouter_liste_villes ["Montreal"; "Sherbrouke"; "Chicoutimi"; 
                                "Paris"; "La_Havane"; "Detroit"; "Ottawa"; 
                                "Vancouver"; "Toronto"; "Bogota"; "Bruxelles"; 
                                "Bujumbura"; "Iqaluit"; "Chicago"; "Tokyo"; 
                                "Auckland"; "New_York"; "Singapour"] r;;]}
*)

val supprimer_ville : nom_ville -> reseau -> reseau
(** [supprimer_ville nv r] 
    Cette fonction prend le nom d'une ville nv et un réseau r et qui rend le réseau mis à jour 
    en supprimant la ville qui n'est plus desservie par la compagnie aérienne, 
    ainsi que toutes les références à cette ville dans la liste des successeurs de toutes les autres villes. 
    Cette fonction retourne un message d’erreur si le réseau est vide 
    ou si le réseau ne contient pas la ville à supprimer.

    Exemple:
{[# let r = supprimer_ville "Montreal" r;;]}
*)

val ajouter_trajet : trajet -> reseau -> reseau
(** [ajouter_trajet (nv1,nv2) r] 
    Cette fonction prend un trajet entre deux villes (nv1, nv2) et un réseau r et qui rend comme résultat 
    le réseau mis à jour dans lequel le nom de la ville nv2 a été rajoutée à la liste des successeurs 
    de la ville dont le nom est nv1. Cette fonction retourne un message d’erreur si le réseau est vide ou si 
    le réseau ne contient pas une des villes formant le trajet à ajouter. 
    Cependant, elle doit retourner un réseau inchangé si le trajet existe déjà dans le réseau.

    Exemple:
{[# let r = ajouter_trajet ("Quebec","Montreal") r;;]}
*)

val ajouter_liste_trajets : trajet list -> reseau -> reseau
(** [ajouter_liste_trajets lt r] 
    Cette fonction prend une liste de trajets lt et un réseau r et retourne le réseau mis à jour 
    dans lequel tous les trajets ont été ajoutés dans ce réseau.

    Exemple:
{[# let r = ajouter_liste_trajets [("Montreal","Quebec");("Montreal","Sherbrouke");
("Quebec","Sherbrouke"); ("Quebec","Chicoutimi");("Sherbrouke","Quebec");("Montreal","Paris");
("Montreal","New_York");("Paris","Montreal");("Quebec","La_Havane");
 ("Montreal","Detroit");("Montreal","Ottawa");("Montreal","Vancouver");
 ("Toronto","Bogota");("Montreal","Toronto");("Vancouver","Toronto");
 ("Montreal","Bruxelles");("Bruxelles","Bujumbura");("Ottawa","Iqaluit");
 ("Quebec","Chicago");("Vancouver","Tokyo");("Vancouver","Auckland");
 ("Chicago","Vancouver");("Bujumbura","Bruxelles");("New_York","Detroit")] r;;]}
*)

val supprimer_trajet : trajet -> reseau -> reseau
(** [supprimer_trajet (nv1,nv2) r] 
    Cette fonction prend un trajet entre deux villes (nv1, nv2) et un réseau r et qui rend comme résultat le réseau mis à jour 
    dans lequel le nom de la ville nv2 est supprimée de la liste des successeurs de la ville dont le nom est nv1. 
    En fait, ceci veut dire que la compagnie aérienne n'offre plus ce trajet. 
    Cette fonction retourne un message d’erreur si le réseau est vide ou si le réseau ne contient pas une des villes 
    formant le trajet à supprimer.

    Exemple:
{[# let r = supprimer_trajet ("Sherbrouke", "Quebec") r;;]}
*)

val trouver_chemins : reseau -> reseau
(** [trouver_chemins r] 
    Cette fonction prend un réseau r et qui rend comme résultat le réseau de la fermeture transitive de r. 
    Elle permettra par exemple à une agence de voyages de connaître tous les chemins que la compagnie aérienne 
    peut offrir à sa clientèle en utilisant des transits entre villes. Il est à noter que cette fonction retourne 
    un message d’erreur si le réseau est vide. Nous vous donnons ici une façon de l'implanter, mais libre à vous 
    d'opter pour une autre façon étant donné qu'il existe toujours plusieurs solutions à un même problème. 
    Nous vous suggérons par contre d'opter pour la façon récursive suivante:
    *- Pour chaque ville du reseau r, on construit un nouveau réseau r', où on rajoute à la liste lv des successeurs
    de chaque ville v, les successeurs de chacun des éléments de la liste lv. Si le réseau r' ainsi obtenu est 
    le même que r on s’arrête sinon on applique le même traitement à r' de façon récursive.
    *- Pour pouvoir réaliser ce traitement, vous aurez besoin d’un booléen pour savoir s’il y a eu des changements 
    suite à la modification des listes de successeurs. De ce fait, vous pouvez implanter la fonction trouver_chemins
    en utilisant une fonction utilitaire fermeture_transitive qui a comme type : ville list-> bool -> ville list.

    Exemple:
{[# let r = trouver_chemins r;;]}
*)

val afficher_villes : reseau -> unit
(** [afficher_villes r] 
    Cette fonction prend un réseau r et affiche tous les noms de villes (sur la même ligne) appartenant à ce réseau. 
    Cette fonction affiche le message "le réseau est vide" si effectivement le réseau est vide.

    Exemple:
{[# let r = afficher_villes r;;]}
*)

val afficher_reseau : reseau -> unit
(** [afficher_reseau r] 
    Cette fonction prend un réseau r et affiche, en plus des noms des villes appartenant à ce réseau, les successeurs de chaque ville. 
    Veuillez consulter la fin du fichier "testeur.ml" pour savoir le format de sortie de cette fonction.

    Exemple:
{[# let r = afficher_reseau r;;]}
*)