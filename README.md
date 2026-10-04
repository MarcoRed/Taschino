# Taschino

Piccola collezione di mini-app HTML personali, pubblicate come sito statico via GitLab Pages.

## Struttura

```
taschino/
├── index.html              # home page con l'elenco dei tool
├── .gitlab-ci.yml           # configurazione per GitLab Pages
└── lettore-vocale/
    └── index.html           # tool: lettore vocale (testo o link → voce)
```

## Come pubblicare

1. Crea un nuovo repository vuoto su GitLab, es. `taschino`.
2. Nella cartella di questo progetto:

```bash
git init
git remote add origin git@gitlab.com:<tuo-utente>/taschino.git
git add .
git commit -m "Primo tool: lettore vocale"
git branch -M main
git push -u origin main
```

3. Vai su **Settings → Pages** nel progetto GitLab: dopo la prima pipeline (Build → Pipelines), la Pages sarà attiva automaticamente grazie al file `.gitlab-ci.yml` incluso.
4. L'URL sarà del tipo:

```
https://<tuo-utente>.gitlab.io/taschino/
```

## Aggiungere un nuovo tool

1. Crea una nuova cartella, es. `nuovo-tool/`, con dentro un `index.html`.
2. Aggiungi una card nella home page (`index.html` principale) che punta a `nuovo-tool/`.
3. Per renderlo installabile come app (icona propria, schermo intero, no barra Chrome):
   - Crea `nuovo-tool/manifest.json` (copia quello di `lettore-vocale/` e cambia nome/descrizione)
   - Aggiungi due icone `icon-192.png` e `icon-512.png` nella cartella
   - Nell'`<head>` dell'`index.html` del tool, aggiungi gli stessi tag `<link rel="manifest">`, `<meta name="theme-color">`, `<link rel="apple-touch-icon">` presenti in `lettore-vocale/index.html`
4. Commit e push: la pipeline ripubblica tutto automaticamente.

## Installare un tool come app sul telefono

Apri l'URL del tool specifico (es. `.../lettore-vocale/`) da Chrome → menu (⋮) → **"Installa app"** (o "Aggiungi a schermata Home" se non compare l'opzione diretta). Su iPhone/Safari: pulsante Condividi → **"Aggiungi a Home"**. Con il manifest configurato, l'icona sarà quella personalizzata e l'app si aprirà a schermo intero, senza barra degli indirizzi.
# Taschino
