## Team
- arion-a-reaction = Laurien PITROU FAIZEAU
- houssamgh992-crypto = Houssam GHAJDAOUI ALAOUI 
- Timdev0 = Quentin PELTIER

## Partie 4 : Statistiques
- Solution effectué avec PACBASE

### Infos
- Le pdf est un compte rendu des étapes effectué dans pacbase.
- Le fichier API2.SOURCE.DB2(PRJESUM) est le programme qui crée le .data (API3.PROJET.EXTRSUM.DATA) qui contient les données extraite nécessaire au programme généré par pacbase.
- Le programme programme-pacbase.gp est fonctionnel et prêt à l'import.
- Le resultat ce trouve dans API3.PROJET.STATS.DATA.
- Les JCL nécessaire à la compilation et l'execution du programme sont aussi fourni

## Partie 5 : Ajout de pièce (VSAM / CICS / DB2)
- IHM transactionnelle CICS avec authentification, écriture des pièces en KSDS puis bascule vers la table DB2 `PARTS`.
### Fonctionnement
- L'utilisateur s'authentifie (login = code employé, mot de passe = prénom) via la transaction `T3LG`.
- Une fois connecté, il est basculé vers l'écran d'ajout de pièce. Cet écran est inaccessible sans authentification (contrôle via la COMMAREA).
- Les pièces saisies sont écrites dans le KSDS `PARTS3`, puis reversées dans la table `PARTS` par un batch COBOL-DB2.
### Fichiers
- **API3.PROJET.EMPLOYE.DATA** : données des utilisateurs (login + prénom) chargées dans le KSDS d'authentification.
- **API3.SOURCE.BMS(MS3LOG)** : écran BMS de login.
- **API3.SOURCE.BMS(MS3ADD)** : écran BMS d'ajout de pièce.
- **API3.SOURCE.CICS(P5LOG)** : programme CICS d'authentification (lit le KSDS users, bascule vers l'ajout si succès).
- **API3.SOURCE.CICS(P5ADD)** : programme CICS d'ajout (contrôle l'accès, écrit la pièce dans le KSDS parts).
- **API3.SOURCE.COBOL(P5BASC)** : batch COBOL-DB2 qui lit le KSDS parts et insère les pièces dans la table `PARTS` (gestion des doublons).
- **API3.SOURCE.DCLGEN(PARTS)** : copybook DB2 de la table `PARTS` généré par DCLGEN, utilisé par le batch.
- **API3.SOURCE.JCL(JP5USDF)** : crée et charge le KSDS des utilisateurs.
- **API3.SOURCE.JCL(JP5PADF)** : crée le KSDS des pièces (vide).
- **API3.SOURCE.JCL(JP5MSLG)** : compile le mapset de login.
- **API3.SOURCE.JCL(JP5MSAD)** : compile le mapset d'ajout.
- **API3.SOURCE.JCL(JP5LOG)** : compile le programme de login.
- **API3.SOURCE.JCL(JP5ADD)** : compile le programme d'ajout.
- **API3.SOURCE.JCL(JP5BASC)** : précompile, compile, bind et exécute le batch de bascule.
- **commandes.txt** : commandes CEDA de déclaration des ressources CICS (fichiers, mapsets, programmes, transactions).

## Partie 6 : Export des taux de change (.NET)
- Module .NET autonome qui récupère les taux de change du jour via une API REST publique et les exporte dans plusieurs formats de fichiers (JSON, CSV, XML).
### Fonctionnement
- L'utilisateur choisit les formats à exporter via un menu.
- Les taux sont récupérés depuis l'API Frankfurter, transformés en modèle métier, puis exportés.
- Les fichiers sont générés au format `Cotations-AAAAMMJJ.ext` dans un dossier de sortie configurable.
### Architecture
- Classe abstraite `Exporter` (pattern Template Method) : le déroulé d'export est commun, chaque format ne redéfinit que son extension et son contenu.
- Concepts POO : encapsulation (`Cotation` immuable), héritage (les exporters héritent d'`Exporter`), polymorphisme (l'orchestrateur exporte sans connaître le format concret).
- Ajouter un format = créer une classe + l'ajouter à la liste, sans modifier l'existant.
### Fichiers
- **Cotation.cs** : modèle métier d'une devise (code, valeur, date), immuable.
- **RateDto.cs** : objet reflet du JSON de l'API, séparé du modèle métier (DTO).
- **FrankfurterClient.cs** : appelle l'API REST et récupère les taux (asynchrone). URL injectée depuis la config.
- **CotationMapper.cs** : transforme les données brutes de l'API en `Cotation`, écarte les lignes invalides.
- **Exporter.cs** : classe abstraite définissant le squelette d'export (nom de fichier, écriture) commun à tous les formats.
- **JsonExporter.cs** : exporter concret au format JSON.
- **CsvExporter.cs** : exporter concret au format CSV.
- **XmlExporter.cs** : exporter concret au format XML.
- **TSOExporter.cs** : exporter concret au format .data pour TSO
- **MenuSelection.cs** : affiche les formats disponibles et récupère le choix de l'utilisateur.
- **ExportOrchestrator.cs** : coordonne le flux (menu, récupération, mapping, export).
- **Program.cs** : point d'entrée, lit la configuration et assemble les composants.
- **appsettings.json** : configuration (URL de l'API, dossier de sortie).
