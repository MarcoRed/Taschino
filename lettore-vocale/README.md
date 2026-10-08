# Lettore Vocale — manuale d'uso

Il Lettore Vocale legge ad alta voce un testo, un articolo da un link o un file. Funziona nel browser e si può installare sul telefono come app. Può leggere per capitoli, fare pause a tempo e fermarsi dove vuoi tu: è pensato anche per la ginnastica o per la lettura in auto.

🔗 **Apri:** https://marcored.github.io/Taschino/lettore-vocale/

---

## Avvio rapido

1. Incolla il testo nella casella, oppure usa **🔗 Da link** o **📄 Da file**.
2. Controlla che la lingua della voce sia quella giusta (vedi [Impostazioni](#impostazioni)).
3. Tocca **▶ Leggi**.
4. Si apre il lettore a tutto schermo: usa i tasti per andare avanti, indietro o mettere in pausa.

---

## Come mettere il testo

| Modo | Come | Note |
|---|---|---|
| **Incolla** | Copia il testo e incollalo nella casella | Il metodo più semplice. |
| **🔗 Da link** | Tocca il pulsante, incolla l'indirizzo e tocca **Estrai testo dalla pagina** | Il testo passa dal servizio r.jina.ai. Non usarlo per pagine riservate o private. |
| **📄 Da file** | Scegli un file `.md`, `.markdown` o `.txt` | Se hai Google Drive sul telefono, compare tra le fonti. |

Il testo estratto o caricato resta nella casella: puoi controllarlo e modificarlo prima di leggere.

Il pulsante **✕** nell'angolo della casella cancella tutto, compreso il testo salvato per la ripresa.

---

## Velocità

Sopra il pulsante ▶ Leggi trovi quattro scelte rapide: **1×**, **1.2×**, **1.5×**, **1.8×**. Per valori intermedi usa lo slider nelle Impostazioni. La velocità scelta viene ricordata.

---

## Il lettore

Quando premi **▶ Leggi** si apre il lettore:

| Tasto | Cosa fa |
|---|---|
| **⏪ 30s** | Torna indietro di circa 30 secondi di lettura |
| **⏸ / ▶** | Mette in pausa o riprende |
| **30s ⏩** | Va avanti di circa 30 secondi di lettura |
| **✕ Esci** | Interrompe la lettura e torna alla schermata principale |

I 30 secondi sono una stima basata sulla velocità scelta, non un conteggio esatto del tempo.

Se il testo ha dei capitoli, compaiono anche:

| Tasto | Cosa fa |
|---|---|
| **⏮ Sezione** | Un tocco riparte dall'inizio della sezione attuale. Due tocchi entro 2 secondi vanno alla sezione precedente |
| **☰ Indice** | Apre l'elenco dei capitoli. Scegliendone uno si salta lì. Chiudendo senza scegliere, la lettura riprende |
| **Sezione ⏭** | Va alla sezione successiva |

---

## Capitoli

Se il testo contiene titoli in Markdown, la lettura viene divisa in capitoli e compare il pulsante **📑 Indice · N capitoli**.

- Un **titolo** è una riga che inizia con `#`, `##`, `###` o `####` seguiti da uno spazio.
- Con l'impostazione **Automatico** il lettore sceglie il primo livello (da `#` a `####`) che ha almeno due titoli.
- Se il testo non ha titoli, viene letto tutto di seguito.
- Se il riconoscimento non va come vuoi, scegli il livello a mano in **Impostazioni → Capitoli nei file Markdown**.
- I blocchi di codice (tra ```` ``` ````) non vengono considerati titoli.

---

## Marcatori: pause e sospensioni

Puoi scrivere istruzioni direttamente nel testo. Ogni marcatore va su una **riga da sola**.

| Marcatore | Cosa succede |
|---|---|
| `[pausa 30s]` | Dice "Pausa di 30 secondi", poi tace per 30 secondi e riprende da sola |
| `[pausa 5m]` | Come sopra, per 5 minuti |
| `[pause 1h]` | Come sopra, per 1 ora. `pause` e `pausa` funzionano allo stesso modo |
| `[suspend]` | Dice "Sospeso. Premi play per continuare" e si ferma. Riprende solo con **▶** |

Unità accettate: `s` (secondi), `m` (minuti), `h` (ore). Se non scrivi l'unità, il valore è in **minuti**: `[pausa 5]` equivale a `[pausa 5m]`.

Note:
- Il marcatore non viene letto: senti solo l'annuncio.
- Dentro un blocco di codice i marcatori vengono ignorati.
- Durante una pausa a tempo puoi premere **⏸**: la pausa si ferma e, premendo **▶**, riparte dall'inizio.

### Esempio: allenamento

Puoi copiare questo testo, incollarlo nel lettore e premere **▶ Leggi**:

```markdown
# Ginnastica del mattino

## Riscaldamento
Cammina sul posto per tre minuti.
Scuoti braccia e spalle.

[pausa 30s]

## Squat
Dieci squat lenti, schiena dritta.
Respira in salita.

[pausa 1m]

## Affondi
Dieci per gamba, alternando.

[pausa 2m]

## Defaticamento
Allunga i polpacci per trenta secondi per gamba.
Respira lentamente.

[suspend]
```

Cosa succede: legge il riscaldamento, annuncia la pausa di 30 secondi e riprende da solo con lo squat. Dopo gli affondi c'è una pausa di 2 minuti. Alla fine si ferma e aspetta **▶**.

Se attivi **Fermati alla fine di ogni paragrafo** (vedi sotto), il lettore si ferma anche tra un paragrafo e l'altro, senza bisogno di scrivere altri marcatori.

---

## Impostazioni

Tocca **⚙️** in alto a destra.

| Impostazione | Cosa fa | Default |
|---|---|---|
| **Voce** | Sceglie la voce del telefono o del browser. Se il testo è in italiano o inglese, la voce viene scelta da sola | Prima voce italiana disponibile |
| **Velocità** | Regola la velocità di lettura | 1× |
| **Capitoli nei file Markdown** | Automatico oppure livello `#`, `##`, `###`, `####` | Automatico |
| **Auto-play tra le sezioni** | Passa da solo alla sezione successiva alla fine di una sezione | Attivo |
| **Fermati alla fine di ogni paragrafo** | Si ferma a fine paragrafo e aspetta **▶** | Spento |
| **Continua con schermo spento** | Mantiene attiva la lettura quando lo schermo si spegne, e mostra i controlli nella schermata di blocco | Attivo |
| **Salva il testo come Markdown** | Condivide o scarica il testo come file `.md` | — |
| **Pulisci testo con DeepSeek** | Vedi sotto | — |

Le impostazioni restano salvate nel browser. La velocità, la voce, il livello dei capitoli e le altre opzioni non serve reimpostarle a ogni apertura.

### Pulisci testo con DeepSeek (opzionale)

Se il testo copiato dal web è pieno di menu, pubblicità o ripetizioni, puoi farlo ripulire da DeepSeek:

1. Apri **Impostazioni** e vai a **🧹 Pulisci testo con DeepSeek**.
2. Inserisci la tua API key (`sk-…`).
3. Tocca **Pulisci e formatta in Markdown**.

La chiave resta solo in questa sessione del browser: va reinserita ogni volta che riapri la pagina e non viene salvata. Le righe con i marcatori (`[pausa …]`, `[suspend]`) vengono conservate. Se compare un errore che parla di CORS, il browser blocca la chiamata diretta: in quel caso serve un piccolo proxy, non si risolve dalla pagina.

---

## Schermo spento e telefono

Il lettore prova a continuare la lettura anche quando lo schermo si spegne:

- con **Continua con schermo spento** attivo, la pagina tiene viva la riproduzione con un audio silenzioso e mostra i controlli nella schermata di blocco (⏪, ⏯, ⏩);
- la posizione viene salvata continuamente: se il sistema chiude la pagina, alla riapertura trovi **⏯ Riprendi da dove eri**.

Questo comportamento dipende dal telefono e dal browser. Su alcuni modelli Android la lettura può comunque fermarsi a schermo spento. In quel caso riprendi dalla schermata di blocco con ▶ o dalla pagina con **Riprendi da dove eri**.

Per le pause lunghe (decine di minuti) tieni la pagina aperta e il telefono in carica.

---

## Problemi comuni

**Compare "La sintesi vocale non è disponibile in questa finestra"**
Succede nella finestra interna dell'app Claude, che non supporta la voce. Tocca i tre puntini in alto e scegli **Apri nel browser** (Chrome o Safari).

**Non si sente nulla**
Controlla il volume del telefono e che la voce selezionata sia installata. In Impostazioni prova a cambiare voce.

**La voce legge in una lingua sbagliata**
La lingua viene riconosciuta solo su testi abbastanza lunghi e chiari. Sui testi brevi scegli la voce a mano in Impostazioni.

**Il link non porta il testo**
Alcune pagine richiedono l'accesso o bloccano i servizi di lettura. Copia il testo dalla pagina e incollalo a mano.

**I capitoli non vengono riconosciuti**
Verifica che i titoli inizino con `#` all'inizio della riga e con uno spazio dopo. Se il testo ha un solo titolo di primo livello, Automatico passa al secondo livello: in quel caso scegli il livello a mano in Impostazioni.

**Un marcatore viene letto come testo o non funziona**
Il marcatore deve essere da solo sulla sua riga, tra parentesi quadre, con uno spazio tra la parola e il tempo: `[pausa 30s]` è corretto, `[pausa30s]` no. Controlla anche che non sia dentro un blocco di codice.

**Alla riapertura il lettore non propone di riprendere**
La ripresa viene offerta solo se la casella è vuota o contiene ancora lo stesso testo. Il pulsante ✕ la cancella. Se hai già letto fino alla fine, il salvataggio viene eliminato.

---

## Installare come app sul telefono

- **Android (Chrome):** apri la pagina → menu **⋮** → **Installa app** (o **Aggiungi a schermata Home**).
- **iPhone (Safari):** apri la pagina → pulsante **Condividi** → **Aggiungi a Home**.

Così il lettore si apre a schermo intero, con la sua icona.
