# final-project
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
- **FrankfurterClient.cs** : appelle l'API REST et récupère les taux (asynchrone). URL injectée depuis la config. (https://frankfurter.dev/ )
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
