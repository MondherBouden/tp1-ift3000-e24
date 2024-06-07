(* -------------------------------------------------------------------------- *)
(* ----------------------- TP1 - IFT-3000 - ÉTÉ 2024 -----------  ----------- *)
(* -------------------------------------------------------------------------- *)
(** Fichier permettant de tester les fonctions implémentées du TP             *)
(* -------------------------------------------------------------------------- *)

open Tp1

(******************************************************************************)
(* JEUX DE DONNÉES
   Un jeu de données est composé d'un tuple comprenant les éléments suivants:
   - le nom de la fonction à tester;
   - une fonction qui permet de préciser comment le testeur doit agir avec les
     données et le résultat attendu pour chaque test;
   - une liste de tuples comprenant chaque donnée à tester, le résultat attendu,
     une chaine de caractères précisant le code testé (fonction et arguments);
   - en option, une même liste de tuples qui concernent les cas qui devraient
     soulever une exception, précédée par le code à utiliser pour lancer le test
     et donc, en théorie, provoquer une exception.
*)
(******************************************************************************)

let reseau = initialiser_reseau ()

let jeu_ajouter_ville =
  ( "ajouter_ville",
    (fun ville resultat -> ajouter_ville ville reseau = resultat),
    [
      ( "Quebec",
        Vlist [{nom = "Quebec"; liste_voisins = []}],
        {| ajouter_ville "Quebec" reseau |} )
    ],
    (* ---- Cas devant soulever une exception! ---- *)
    Some
      ( (fun ville -> ajouter_ville ville reseau),
        [
          ("", {|ajouter_ville "" reseau|})
        ] ) )

(* -------------------------------------------------------------------------- *)

let reseau = Vlist [{nom = "Quebec"; liste_voisins = []}]

let jeu_ajouter_liste_villes =
  ( "ajouter_liste_villes",
    (fun listevilles resultat -> ajouter_liste_villes listevilles reseau = resultat),
    [
      ( ["Montreal"; "Sherbrouke"; "Chicoutimi"; 
      "Paris"; "La_Havane"; "Detroit"; "Ottawa"; 
      "Vancouver"; "Toronto"; "Bogota"; "Bruxelles"; 
      "Bujumbura"; "Iqaluit"; "Chicago"; "Tokyo"; 
      "Auckland"; "New_York"; "Singapour"],
      Vlist [{nom = "Quebec"; liste_voisins = []};
      {nom = "Montreal"; liste_voisins = []};
      {nom = "Sherbrouke"; liste_voisins = []};
      {nom = "Chicoutimi"; liste_voisins = []};
      {nom = "Paris"; liste_voisins = []};
      {nom = "La_Havane"; liste_voisins = []};
      {nom = "Detroit"; liste_voisins = []};
      {nom = "Ottawa"; liste_voisins = []};
      {nom = "Vancouver"; liste_voisins = []};
      {nom = "Toronto"; liste_voisins = []};
      {nom = "Bogota"; liste_voisins = []};
      {nom = "Bruxelles"; liste_voisins = []};
      {nom = "Bujumbura"; liste_voisins = []};
      {nom = "Iqaluit"; liste_voisins = []};
      {nom = "Chicago"; liste_voisins = []};
      {nom = "Tokyo"; liste_voisins = []};
      {nom = "Auckland"; liste_voisins = []};
      {nom = "New_York"; liste_voisins = []};
      {nom = "Singapour"; liste_voisins = []}],
        {| ajouter_liste_villes listevilles reseau |} )
    ],
    (* ---- Cas devant soulever une exception! ---- *)
    Some
      ( (fun listevilles -> ajouter_liste_villes listevilles reseau),
        [
          ([""], {|ajouter_liste_villes [""] reseau|})
        ] ) )

(* -------------------------------------------------------------------------- *)

let reseau = Vlist [{nom = "Quebec"; liste_voisins = []}; {nom = "Montreal"; liste_voisins = []}]

let jeu_supprimer_ville =
  ( "supprimer_ville",
    (fun ville resultat -> supprimer_ville ville reseau = resultat),
    [
      ( "Montreal",
        Vlist [{nom = "Quebec"; liste_voisins = []}],
        {| supprimer_ville "Montreal" reseau |} )
    ],
    (* ---- Cas devant soulever une exception! ---- *)
    Some
      ( (fun ville -> supprimer_ville ville reseau),
        [
          ("", {|ajouter_ville "" reseau|})
        ] ) )

(* -------------------------------------------------------------------------- *)

let reseau = Vlist [{nom = "Quebec"; liste_voisins = []}; {nom = "Montreal"; liste_voisins = []}]

let jeu_ajouter_trajet =
  ( "ajouter_trajet",
    (fun trj resultat -> ajouter_trajet trj reseau = resultat),
    [
      ( ("Quebec","Montreal"),
      Vlist [{nom = "Quebec"; liste_voisins = ["Montreal"]}; {nom = "Montreal"; liste_voisins = []}],
        {| ajouter_trajet ("Quebec","Montreal") reseau |} )
    ],
    (* ---- Cas devant soulever une exception! ---- *)
    Some
      ( (fun trj -> ajouter_trajet trj reseau),
        [
          (("Quebec",""), {|ajouter_trajet ("Quebec","") reseau|});
          (("","Montreal"), {|ajouter_trajet ("","Montreal") reseau|})
        ] ) )

(* -------------------------------------------------------------------------- *)

let reseau = Vlist  [{nom = "Auckland"; liste_voisins = []};
                    {nom = "Bogota"; liste_voisins = []};
                    {nom = "Bruxelles"; liste_voisins = []};
                    {nom = "Bujumbura"; liste_voisins = []};
                    {nom = "Chicago"; liste_voisins = []};
                    {nom = "Chicoutimi"; liste_voisins = []};
                    {nom = "Detroit"; liste_voisins = []};
                    {nom = "Iqaluit"; liste_voisins = []};
                    {nom = "La_Havane"; liste_voisins = []};
                    {nom = "Montreal"; liste_voisins = []};
                    {nom = "New_York"; liste_voisins = []};
                    {nom = "Ottawa"; liste_voisins = []};
                    {nom = "Paris"; liste_voisins = []};
                    {nom = "Quebec"; liste_voisins = ["Montreal"]};
                    {nom = "Sherbrouke"; liste_voisins = []};
                    {nom = "Singapour"; liste_voisins = []};
                    {nom = "Tokyo"; liste_voisins = []};
                    {nom = "Toronto"; liste_voisins = []};
                    {nom = "Vancouver"; liste_voisins = []}]

let nre = Vlist [{nom = "Auckland"; liste_voisins = []};
                {nom = "Bogota"; liste_voisins = []};
                {nom = "Bruxelles"; liste_voisins = ["Bujumbura"]};
                {nom = "Bujumbura"; liste_voisins = ["Bruxelles"]};
                {nom = "Chicago"; liste_voisins = ["Vancouver"]};
                {nom = "Chicoutimi"; liste_voisins = []};
                {nom = "Detroit"; liste_voisins = []};
                {nom = "Iqaluit"; liste_voisins = []};
                {nom = "La_Havane"; liste_voisins = []};
                {nom = "Montreal"; liste_voisins =
                      ["Bruxelles"; "Detroit"; "New_York"; "Ottawa"; "Paris"; "Quebec";
                       "Sherbrouke"; "Toronto"; "Vancouver"]};
                {nom = "New_York"; liste_voisins = ["Detroit"]};
                {nom = "Ottawa"; liste_voisins = ["Iqaluit"]};
                {nom = "Paris"; liste_voisins = ["Montreal"]};
                {nom = "Quebec"; liste_voisins =
                      ["Chicago"; "Chicoutimi"; "La_Havane"; "Montreal"; "Sherbrouke"]};
                {nom = "Sherbrouke"; liste_voisins = ["Quebec"]};
                {nom = "Singapour"; liste_voisins = []};
                {nom = "Tokyo"; liste_voisins = []};
                {nom = "Toronto"; liste_voisins = ["Bogota"]};
                {nom = "Vancouver"; liste_voisins = ["Auckland"; "Tokyo"; "Toronto"]}]

(* Fonction pour odonner les villes dans le réseau *)
let ordre r = match r with
  |Vide -> Vide
  |Vlist lv -> let lv' = (List.sort (fun v1 v2 -> let x = v1.nom and y = v2.nom in
               if (x = y) then 0 else if (x < y) then 1 else (-1)) lv) in
               Vlist ( List.fold_left (fun x y ->
               ({nom = y.nom; liste_voisins = (List.sort compare (y.liste_voisins))}::x)) [] lv')

let jeu_ajouter_liste_trajets =
  ( "ajouter_liste_trajets",
    (fun listetragets resultat -> let nr = ajouter_liste_trajets listetragets reseau in
                                  (ordre nr) = resultat),
    [
      ( [("Montreal","Quebec");("Montreal","Sherbrouke");("Quebec","Sherbrouke"); 
      ("Quebec","Chicoutimi");("Sherbrouke","Quebec");("Montreal","Paris");
      ("Montreal","New_York");("Paris","Montreal");("Quebec","La_Havane");
       ("Montreal","Detroit");("Montreal","Ottawa");("Montreal","Vancouver");
       ("Toronto","Bogota");("Montreal","Toronto");("Vancouver","Toronto");
       ("Montreal","Bruxelles");("Bruxelles","Bujumbura");("Ottawa","Iqaluit");
       ("Quebec","Chicago");("Vancouver","Tokyo");("Vancouver","Auckland");
       ("Chicago","Vancouver");("Bujumbura","Bruxelles");("New_York","Detroit")],
       nre,
        {| ajouter_liste_trajets listetragets reseau |} )
    ],
    (* ---- Cas devant soulever une exception! ---- *)
    Some
      ( (fun listetragets -> ajouter_liste_trajets listetragets reseau),
        [
          ([("Quebec","")], {|ajouter_liste_trajets [("Quebec","")] reseau|});
          ([("","Montreal")], {|ajouter_liste_trajets [("","Montreal")] reseau|})
        ] ) )

(* -------------------------------------------------------------------------- *)

let reseau = Vlist [{nom = "Quebec"; liste_voisins = ["Montreal"]}; {nom = "Montreal"; liste_voisins = []}]

let jeu_supprimer_trajet =
  ( "supprimer_trajet",
    (fun trj resultat -> supprimer_trajet trj reseau = resultat),
    [
      ( ("Quebec","Montreal"),
      Vlist [{nom = "Quebec"; liste_voisins = []}; {nom = "Montreal"; liste_voisins = []}],
        {| supprimer_trajet ("Quebec","Montreal") reseau |} )
    ],
    (* ---- Cas devant soulever une exception! ---- *)
    Some
      ( (fun trj -> supprimer_trajet trj reseau),
        [
          (("Quebec",""), {|supprimer_trajet ("Quebec","") reseau|});
          (("","Montreal"), {|supprimer_trajet ("","Montreal") reseau|})
        ] ) )

(* -------------------------------------------------------------------------- *)

let reseau = Vlist [{nom = "Auckland"; liste_voisins = []};
                    {nom = "Bogota"; liste_voisins = []};
                    {nom = "Bruxelles"; liste_voisins = ["Bujumbura"]};
                    {nom = "Bujumbura"; liste_voisins = ["Bruxelles"]};
                    {nom = "Chicago"; liste_voisins = ["Vancouver"]};
                    {nom = "Chicoutimi"; liste_voisins = []};
                    {nom = "Detroit"; liste_voisins = []};
                    {nom = "Iqaluit"; liste_voisins = []};
                    {nom = "La_Havane"; liste_voisins = []};
                    {nom = "Montreal"; liste_voisins =
                      ["Quebec"; "Sherbrouke"; "Paris"; "New_York"; "Detroit"; "Ottawa";
                        "Vancouver"; "Toronto"; "Bruxelles"]};
                    {nom = "New_York"; liste_voisins = ["Detroit"]};
                    {nom = "Ottawa"; liste_voisins = ["Iqaluit"]};
                    {nom = "Paris"; liste_voisins = ["Montreal"]};
                    {nom = "Quebec"; liste_voisins =
                      ["Montreal"; "Sherbrouke"; "Chicoutimi"; "La_Havane"; "Chicago"]};
                    {nom = "Sherbrouke"; liste_voisins = ["Quebec"]};
                    {nom = "Singapour"; liste_voisins = []};
                    {nom = "Tokyo"; liste_voisins = []};
                    {nom = "Toronto"; liste_voisins = ["Bogota"]};
                    {nom = "Vancouver"; liste_voisins = ["Toronto"; "Tokyo"; "Auckland"]}]

let fermeture = Vlist [{nom = "Auckland"; liste_voisins = []};
                      {nom = "Bogota"; liste_voisins = []};
                      {nom = "Bruxelles"; liste_voisins = ["Bruxelles"; "Bujumbura"]};
                      {nom = "Bujumbura"; liste_voisins = ["Bruxelles"; "Bujumbura"]};
                      {nom = "Chicago"; liste_voisins = ["Auckland"; "Bogota"; "Tokyo"; "Toronto"; "Vancouver"]};
                      {nom = "Chicoutimi"; liste_voisins = []};
                      {nom = "Detroit"; liste_voisins = []};
                      {nom = "Iqaluit"; liste_voisins = []};
                      {nom = "La_Havane"; liste_voisins = []};
                      {nom = "Montreal"; liste_voisins =
                        ["Auckland"; "Bogota"; "Bruxelles"; "Bujumbura"; "Chicago";
                        "Chicoutimi"; "Detroit"; "Iqaluit"; "La_Havane"; "Montreal";
                        "New_York"; "Ottawa"; "Paris"; "Quebec"; "Sherbrouke"; "Tokyo";
                        "Toronto"; "Vancouver"]};
                      {nom = "New_York"; liste_voisins = ["Detroit"]};
                      {nom = "Ottawa"; liste_voisins = ["Iqaluit"]};
                      {nom = "Paris"; liste_voisins =
                        ["Auckland"; "Bogota"; "Bruxelles"; "Bujumbura"; "Chicago";
                        "Chicoutimi"; "Detroit"; "Iqaluit"; "La_Havane"; "Montreal";
                        "New_York"; "Ottawa"; "Paris"; "Quebec"; "Sherbrouke"; "Tokyo";
                        "Toronto"; "Vancouver"]};
                      {nom = "Quebec"; liste_voisins =
                        ["Auckland"; "Bogota"; "Bruxelles"; "Bujumbura"; "Chicago";
                        "Chicoutimi"; "Detroit"; "Iqaluit"; "La_Havane"; "Montreal";
                        "New_York"; "Ottawa"; "Paris"; "Quebec"; "Sherbrouke"; "Tokyo";
                        "Toronto"; "Vancouver"]};
                      {nom = "Sherbrouke"; liste_voisins =
                        ["Auckland"; "Bogota"; "Bruxelles"; "Bujumbura"; "Chicago";
                        "Chicoutimi"; "Detroit"; "Iqaluit"; "La_Havane"; "Montreal";
                        "New_York"; "Ottawa"; "Paris"; "Quebec"; "Sherbrouke"; "Tokyo";
                        "Toronto"; "Vancouver"]};
                      {nom = "Singapour"; liste_voisins = []};
                      {nom = "Tokyo"; liste_voisins = []};
                      {nom = "Toronto"; liste_voisins = ["Bogota"]};
                      {nom = "Vancouver";
                      liste_voisins = ["Auckland"; "Bogota"; "Tokyo"; "Toronto"]}]

let jeu_trouver_chemins =
  ( "trouver_chemins",
    (fun () resultat -> let ftransitive = trouver_chemins reseau in
                        let ftransitive = ordre ftransitive in
                        ftransitive = resultat),
    [
      ( (),
      fermeture,
      {| trouver_chemins reseau |} )
    ],
    (* ---- Cas devant soulever une exception! ---- *)
    None )


(*****************************************************************************)
(* ------------------------------------------------------------------------- *)
(* -- Test générique--------------------------------------------------------
   La fonction testg a comme signature (donc, extrêmement générique):
      'a * ('b -> 'c -> bool) * ('b * 'c * string) list *
      (('d -> 'e) * ('d * string) list) option ->
      'a * bool * string List.t * bool * bool
   Elle prend comme argument le nom de la fonction à tester, la fonction à
   utiliser pour comparer le résultat obtenu avec chaque jeu de test et le
   résultat attendu, un jeu de données (comme décrit au début du fichier), et
   éventuellement celui concernant les cas d'exceptions, et retourne un 5-uplet
   formé du nom de la fonction, du résultat obtenu pour le test en question,
   des commentaires éventuels issus du test, d'un booléen qui précise si la
   fonction testée est non implantée et d'un booléen qui précise si une
   exception a été soulevée durant le test de la fonction en question.
*)
(* ------------------------------------------------------------------------- *)

(* La fonction suivante permet de tester n'importe quelle autre fonction
   en prenant soin de limiter le temps d'exécution à un #sec fixé (par défaut,
   3 sec.; on peut évidemment ajuster cette valeur).
   (version fonctionnelle que sous Linux/Unix (donc, sous WSL et MacOS))

   À cause de l'utilisation du module Unix, il faut charger la librairie au
   préalable:
   - (en mode interpréteur) #require "unix";;
   - (en mode compilation) ... -package unix ...
   Avec l'outil «dune», il faut simplement mentionner le nom de cette librairie
   dans le fichier «dune» (voir celui qui est dans le présent dossier).
*)
exception Timeout

let call_with_timeout ?(time_in_seconds = 3) f =
  Sys.set_signal Sys.sigalrm (Sys.Signal_handle (fun _ -> raise Timeout));
  try
    ignore (Unix.alarm time_in_seconds);
    let result = f () in
    ignore (Unix.alarm 0);
    result
  with exn ->
    ignore (Unix.alarm 0);
    raise exn

let testg (nom_f, f, jeu_donnees, jeu_donnees_exception_op) =
  let comment_l = ref [] in
  let ok = ref true in
  let excep = ref false in

  try
    List.iter
      (fun (p, res, cas_test) ->
        match call_with_timeout (fun () -> f p res) with
        | true -> ()
        | false ->
            ok := false;
            comment_l := !comment_l @ [ cas_test ^ " --> incorrect!" ]
        | exception Non_Implante s ->
            ok := false;
            raise (Non_Implante s)
        | exception e ->
            ok := false;
            excep := true;
            comment_l :=
              !comment_l
              @ [
                  cas_test ^ " - Exception soulevée: «" ^ Printexc.to_string e
                  ^ "»";
                ])
      jeu_donnees;
    (match jeu_donnees_exception_op with
    | None -> ()
    | Some (f', jeu_donnees_exception) ->
        List.iter
          (fun (p, cas_test) ->
            try
              ignore (call_with_timeout (fun () -> f' p));
              ok := false;
              comment_l :=
                !comment_l
                @ [ cas_test ^ " --> incorrect! Devrait soulever exception!" ]
            with
            | Failure _ -> ()
            | Timeout ->
                ok := false;
                excep := true;
                comment_l :=
                  !comment_l @ [ cas_test ^ " - Exception soulevée: «Timeout»" ]
            | e ->
                ok := false;
                excep := true;
                comment_l :=
                  !comment_l
                  @ [
                      cas_test
                      ^ " --> incorrect! Devrait soulever exception «Failure»"
                      ^ " et non «" ^ Printexc.to_string e ^ "»";
                    ])
          jeu_donnees_exception);
    (nom_f, !ok, !comment_l, false, !excep)
  with Non_Implante _ ->
    (nom_f, !ok, !comment_l @ [ "Fonction pas encore implémentée!" ], true, !excep)

(* -------------------------------------------------------------------------- *)
(* -- TESTE TOUT ------------------------------------------------------------
   La fonction test a comme signature:
     unit -> (string * bool * string list * bool * bool) list
   Elle effectue les n tests permettant de tester chacune des fonctions du Tp,
   et retourne une liste de 5-uplet:
   - nom de la fonction testée
   - un booléen qui précise le résultat du test pour cette fonction
   - les commentaires éventuels issus des tests
   - un booléen qui précise si la fonction est non implémentée
   - un booléen qui précise si une exception a été soulevée
*)
(* -------------------------------------------------------------------------- *)


let tests () =
  [
    testg jeu_ajouter_ville;
    testg jeu_ajouter_liste_villes;
    testg jeu_supprimer_ville;
    testg jeu_ajouter_trajet;
    testg jeu_ajouter_liste_trajets;
    testg jeu_supprimer_trajet;
    testg jeu_trouver_chemins
  ]

(* -------------------------------------------------------------------------- *)
(* -- CORRIGE ---------------------------------------------------------------
   Le type de cette fonction est unit -> unit
   Elle appelle la fonction «tests», récupère les résultats des tests et
   affiche entre autres le nom de chaque fonction testée, le résultat obtenu et
   les éventuels commentaires.
*)
(* -------------------------------------------------------------------------- *)
let corrige () =
  print_endline "\nTests des fonctions:";
  print_endline "--------------------";
  List.iter
    (fun (nom_f, ok, comment, _, _) ->
      Printf.printf "%s : %s\n" nom_f (if ok then "OK" else "");
      List.iter (fun c -> print_endline ("\t" ^ c)) comment)
    (tests ());
    print_endline "\nTest de l'affichage des villes:";
    print_endline "-------------------------------";  
    afficher_villes fermeture;
    print_endline "\n\nTest de l'affichage du réseau:";
    print_endline "------------------------------"; 
    afficher_reseau fermeture
;;

corrige ();;

(* Avec version du corrigé:

dune runtest

Tests des fonctions:
--------------------
ajouter_ville : OK
ajouter_liste_villes : OK
supprimer_ville : OK
ajouter_trajet : OK
ajouter_liste_trajets : OK
supprimer_trajet : OK
trouver_chemins : OK

Test de l'affichage des villes:
-------------------------------
Auckland Bogota Bruxelles Bujumbura Chicago Chicoutimi Detroit Iqaluit La_Havane Montreal New_York Ottawa Paris Quebec Sherbrouke Singapour Tokyo Toronto Vancouver 

Test de l'affichage du réseau:
------------------------------
Auckland:
Bogota:
Bruxelles: Bruxelles Bujumbura
Bujumbura: Bruxelles Bujumbura
Chicago: Auckland Bogota Tokyo Toronto Vancouver
Chicoutimi:
Detroit:
Iqaluit:
La_Havane:
Montreal: Auckland Bogota Bruxelles Bujumbura Chicago Chicoutimi Detroit Iqaluit La_Havane Montreal New_York Ottawa Paris Quebec Sherbrouke Tokyo Toronto Vancouver
New_York: Detroit
Ottawa: Iqaluit
Paris: Auckland Bogota Bruxelles Bujumbura Chicago Chicoutimi Detroit Iqaluit La_Havane Montreal New_York Ottawa Paris Quebec Sherbrouke Tokyo Toronto Vancouver
Quebec: Auckland Bogota Bruxelles Bujumbura Chicago Chicoutimi Detroit Iqaluit La_Havane Montreal New_York Ottawa Paris Quebec Sherbrouke Tokyo Toronto Vancouver
Sherbrouke: Auckland Bogota Bruxelles Bujumbura Chicago Chicoutimi Detroit Iqaluit La_Havane Montreal New_York Ottawa Paris Quebec Sherbrouke Tokyo Toronto Vancouver
Singapour:
Tokyo:
Toronto: Bogota
Vancouver: Auckland Bogota Tokyo Toronto

(* -------------------------------------------------------------------------- *)
Avec version remise et donc non complétée:

dune runtest

Tests des fonctions:
--------------------
ajouter_ville : 
        Fonction pas encore implémentée!
ajouter_liste_villes : 
        Fonction pas encore implémentée!
supprimer_ville : 
        Fonction pas encore implémentée!
ajouter_trajet : 
        Fonction pas encore implémentée!
ajouter_liste_trajets : 
        Fonction pas encore implémentée!
supprimer_trajet : 
        Fonction pas encore implémentée!
trouver_chemins : 
        Fonction pas encore implémentée!

Test de l'affichage des villes:
-------------------------------
        Fonction pas encore implémentée!

Test de l'affichage du réseau:
------------------------------
        Fonction pas encore implémentée!
*)