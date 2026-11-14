#!/usr/bin/env bash
#
# merge_project.sh — unisce ricorsivamente tutti i file di testo di un progetto
# in un unico file, con intestazioni che indicano il percorso relativo di ciascun
# file. Pensato per creare un file da caricare nella "project knowledge" di Claude.
#
# USO:
#   ./merge_project.sh [cartella_progetto] [file_output]
#
# ESEMPI:
#   ./merge_project.sh                          # usa la cartella corrente, output: project_merged.txt
#   ./merge_project.sh ~/taschino                # cartella specifica, output: project_merged.txt
#   ./merge_project.sh ~/taschino merged.md      # cartella e nome output specifici

set -euo pipefail

SRC_DIR="${1:-.}"
OUT_FILE="${2:-project_merged.txt}"

# Cartelle/pattern da escludere sempre (aggiungi qui se ti serve)
EXCLUDE_DIRS=(".git" "node_modules" "dist" "build" ".venv" "__pycache__" ".idea" ".vscode")

# Costruisce l'espressione find per escludere le cartelle sopra
PRUNE_EXPR=()
for d in "${EXCLUDE_DIRS[@]}"; do
  PRUNE_EXPR+=(-path "*/$d" -o)
done
# rimuove l'ultimo -o
unset 'PRUNE_EXPR[${#PRUNE_EXPR[@]}-1]'

# Svuota/crea il file di output
: > "$OUT_FILE"

# Intestazione generale col riepilogo dell'albero delle directory (utile come mappa)
{
  echo "# Struttura del progetto: $SRC_DIR"
  echo "# Generato il: $(date '+%Y-%m-%d %H:%M:%S')"
  echo
  echo "## Albero file (esclusi: ${EXCLUDE_DIRS[*]})"
  echo '```'
} >> "$OUT_FILE"

find "$SRC_DIR" \( "${PRUNE_EXPR[@]}" \) -prune -o -type f -print \
  | sed "s|^$SRC_DIR/||" | sort >> "$OUT_FILE"

echo '```' >> "$OUT_FILE"
echo >> "$OUT_FILE"
echo "---" >> "$OUT_FILE"
echo >> "$OUT_FILE"

# Trova tutti i file, escludendo le cartelle indicate, ordinati per percorso
FILES=$(find "$SRC_DIR" \( "${PRUNE_EXPR[@]}" \) -prune -o -type f -print | sort)

while IFS= read -r file; do
  # Salta il file di output stesso se si trova dentro SRC_DIR
  [ "$(realpath "$file")" = "$(realpath "$OUT_FILE")" ] && continue

  # Salta i file binari (immagini, font, ecc.) — include solo testo
  if ! file -b --mime "$file" | grep -qE 'text|json|xml|javascript|x-empty'; then
    continue
  fi

  rel_path="${file#$SRC_DIR/}"
  lines=$(wc -l < "$file" | tr -d ' ')
  size=$(wc -c < "$file" | tr -d ' ')

  {
    echo "=== FILE: $rel_path ==="
    echo "# righe: $lines — dimensione: ${size} byte"
    echo
    cat "$file"
    echo
    echo "=== FINE FILE: $rel_path ==="
    echo
  } >> "$OUT_FILE"
done <<< "$FILES"

echo "Fatto. Output scritto in: $OUT_FILE"
echo "Righe totali: $(wc -l < "$OUT_FILE")"
