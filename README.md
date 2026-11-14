# Taschino

Piccola collezione di mini-app HTML personali, pubblicate come sito statico via GitHub Pages.

🔗 **Sito:** https://marcored.github.io/Taschino/

## Struttura

```
taschino/
├── index.html              # home page con l'elenco dei tool
├── manifest.json           # PWA manifest per la home
├── icon-192.png            # icone della home
├── icon-512.png
├── lettore-vocale/         # tool: lettore vocale (testo, link o file → voce)
│   ├── index.html
│   ├── manifest.json       # PWA manifest del tool
│   ├── icon-192.png
│   └── icon-512.png
├── cerca-casa/             # tool: zone di Milano per prezzo, tempi e metri quadri
│   ├── index.html
│   └── grafico/
│       └── index.html      # grafico del confronto
├── screenshot-md/          # tool: screenshot di pagine → Markdown (OpenRouter)
│   └── index.html
└── tools/                  # script di supporto, non pubblicati come tool
    └── merge_project.sh    # unisce i file di un progetto in un unico .txt
```

Le cartelle dei tool non contengono file di build: ogni `index.html` è autonomo.

## Come aggiornare il sito

Basta fare push su `main`: GitHub Pages pubblica automaticamente dalla branch principale.

```bash
git add .
git commit -m "Descrizione delle modifiche"
git push
```

Il sito si aggiorna in 1-2 minuti.

## Script di supporto

`tools/merge_project.sh` unisce tutti i file di testo di una cartella in un unico file, con intestazioni per percorso. Serve per caricare il progetto nella project knowledge di Claude:

```bash
./tools/merge_project.sh ~/taschino                  # output: project_merged.txt
./tools/merge_project.sh ~/taschino merged.md        # nome output personalizzato
```

Il file generato (`project_merged.txt`) è in `.gitignore` e non va committato.

## Aggiungere un nuovo tool

1. Crea una nuova cartella, es. `nuovo-tool/`, con dentro un `index.html`.
2. Aggiungi una card nella home page (`index.html` principale) che punta a `nuovo-tool/`.
3. Per renderlo installabile come app (icona propria, schermo intero, no barra Chrome):
   - Crea `nuovo-tool/manifest.json` (copia quello di `lettore-vocale/` e cambia nome/descrizione)
   - Aggiungi due icone `icon-192.png` e `icon-512.png` nella cartella
   - Nell'`<head>` dell'`index.html` del tool, aggiungi gli stessi tag `<link rel="manifest">`, `<meta name="theme-color">`, `<link rel="apple-touch-icon">` presenti in `lettore-vocale/index.html`
4. `git add . && git commit -m "Nuovo tool: ..." && git push`

## Installare un tool come app sul telefono

Apri l'URL del tool specifico (es. `.../lettore-vocale/`) da Chrome → menu (⋮) → **"Installa app"** (o "Aggiungi a schermata Home"). Su iPhone/Safari: pulsante Condividi → **"Aggiungi a Home"**. Con il manifest configurato, l'icona sarà quella personalizzata e l'app si aprirà a schermo intero, senza barra degli indirizzi.
