# Taschino

Piccola collezione di mini-app HTML personali, pubblicate come sito statico via GitHub Pages.

🔗 **Sito:** https://marcored.github.io/Taschino/

## Struttura

```
taschino/
├── index.html              # home page con l'elenco dei tool
├── manifest.json           # PWA manifest per la home
└── lettore-vocale/
    └── index.html          # tool: lettore vocale (testo, link o file → voce)
```

## Come aggiornare il sito

Basta fare push su `main`: GitHub Pages pubblica automaticamente dalla branch principale.

```bash
git add .
git commit -m "Descrizione delle modifiche"
git push
```

Il sito si aggiorna in 1-2 minuti.

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
