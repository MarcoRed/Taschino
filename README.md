# Taschino

Piccola collezione di mini-app HTML personali, pubblicate come sito statico via GitHub Pages.

🔗 **Sito:** https://marcored.github.io/Taschino/

## Struttura

Ogni tool è una cartella con esattamente gli stessi quattro file:

```
taschino/
├── index.html              # home page con l'elenco dei tool
├── manifest.json           # PWA manifest della home
├── icon-192.png            # icone della home
├── icon-512.png
├── lettore-vocale/         # tool: lettore vocale (testo, link o file → voce)
│   ├── index.html
│   ├── manifest.json
│   ├── icon-192.png
│   └── icon-512.png
├── cerca-casa/             # tool: zone di Milano per prezzo, tempi e metri quadri
│   ├── index.html
│   ├── manifest.json
│   ├── icon-192.png
│   └── icon-512.png
├── cerca-casa-grafico/     # tool: grafico prezzo/minuti delle zone (collegato da cerca-casa)
│   ├── index.html
│   ├── manifest.json
│   ├── icon-192.png
│   └── icon-512.png
├── screenshot-md/          # tool: screenshot o PDF di pagine → Markdown (OpenRouter)
│   ├── index.html
│   ├── manifest.json
│   ├── icon-192.png
│   └── icon-512.png
└── tools/                  # script di supporto, non pubblicati come tool
    └── merge_project.sh    # unisce i file di un progetto in un unico .txt
```

Ogni `index.html` è autonomo (nessun file di build) e ha nell'`<head>` gli stessi tag PWA: `manifest`, `theme-color`, `icon`, `apple-touch-icon` e `apple-mobile-web-app-*`.

## Come aggiornare il sito

Basta fare push su `main`: GitHub Pages pubblica automaticamente dalla branch principale.

```bash
git add .
git commit -m "Descrizione delle modifiche"
git push
```

Il sito si aggiorna in 1-2 minuti.

## Aggiungere un nuovo tool

1. Copia una cartella esistente (es. `lettore-vocale/`) in `nuovo-tool/` e sostituisci `index.html`. Così restano anche `manifest.json` e le icone.
2. Nel `manifest.json` cambia `name`, `short_name`, `description` e `theme_color`.
3. Nell'`<head>` dell'`index.html` aggiorna `<title>`, `theme-color` e `apple-mobile-web-app-title`.
4. Aggiungi una card nella home page (`index.html` principale) che punta a `nuovo-tool/`.
5. `git add . && git commit -m "Nuovo tool: ..." && git push`

Le icone copiate vanno sostituite con quelle del nuovo tool, se ne vuoi di proprie.

## Script di supporto

`tools/merge_project.sh` unisce tutti i file di testo di una cartella in un unico file, con intestazioni per percorso. Serve per caricare il progetto nella project knowledge di Claude:

```bash
./tools/merge_project.sh ~/taschino                  # output: project_merged.txt
./tools/merge_project.sh ~/taschino merged.md        # nome output personalizzato
```

Il file generato (`project_merged.txt`) è in `.gitignore` e non va committato.

## Installare un tool come app sul telefono

Apri l'URL del tool specifico (es. `.../lettore-vocale/`) da Chrome → menu (⋮) → **"Installa app"** (o "Aggiungi a schermata Home"). Su iPhone/Safari: pulsante Condividi → **"Aggiungi a Home"**. Con il manifest configurato, l'icona sarà quella personalizzata e l'app si aprirà a schermo intero, senza barra degli indirizzi.
