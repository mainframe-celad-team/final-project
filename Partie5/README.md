# final-project
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
