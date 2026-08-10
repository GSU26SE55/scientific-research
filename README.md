# Mamba State Space Model with Spectral Feature Conditioning — LaTeX Source

Springer **LNCS** (`llncs`) source for the paper:

> **Mamba State Space Model with Spectral Feature Conditioning for State of
> Health Prediction and Anomaly Detection in Lithium-Ion Batteries**
> Phuc Duy Nguyen, Phuoc Thang Bui, Hong Thai Mai, Minh Tri Tran,
> Nhat Minh Nguyen, Long Truong
> Faculty of Software Engineering, FPT University Ho Chi Minh City

The source is a **faithful transcription of `Nckh-official_2.docx`**: the prose,
tables, figures and reference list follow the Word manuscript sentence for
sentence, re-typeset in the Springer LNCS layout. See `REVIEW_NOTES.md` for the
complete list of the (few) places where the two intentionally differ.

Each section lives in its own `.tex` file and is assembled into a single PDF by
`main.tex` via `\input{}`.

## Directory layout

```
.
├── main.tex                     # Entry point — \documentclass{llncs} + \input{} all parts
├── preamble.tex                 # Packages, table helpers, custom commands
├── llncs.cls                    # Springer LNCS document class (v2.20)
├── splncs04.bst                 # Springer LNCS BibTeX style (alphabetic sort)
├── Makefile                     # `make`, `make quick`, `make clean`
│
├── sections/
│   ├── 00_metadata.tex          # Title, authors, affiliation, running heads
│   ├── 01_abstract.tex          # Abstract + \keywords
│   ├── 02_introduction.tex      # §1  Introduction
│   ├── 03_related_work.tex      # §2  Related Work        (+ Table 1)
│   ├── 04_methodology.tex       # §3  Methodology         (+ Fig. 1)
│   ├── 05_experiments.tex       # §4  Experimental Results (+ Tables 2–5, Fig. 2)
│   ├── 06_discussion.tex        # §5  Discussion          (+ Table 6)
│   ├── 07_conclusion.tex        # §6  Conclusion
│   └── 08_acknowledgment.tex    # Optional — NOT included (the Word file has none)
│
├── bib/
│   └── references.bib           # 23 BibTeX entries
│
├── figures/
│   ├── architecture.png         # Fig. 1 — overall framework
│   └── soh_prediction_b0048.png # Fig. 2 — predicted vs. true SOH on B0048
│
└── Springer_Latex_Template/     # Untouched upstream LNCS package (reference only)
```

Both PNGs are byte-identical to `word/media/image1.png` and `image2.png` inside
the `.docx`.

## Build

```bash
make            # full build: pdflatex → bibtex → pdflatex → pdflatex
make quick      # single pass, fast preview (references not refreshed)
make clean      # remove .aux/.log/... but keep main.pdf
```

Or with `latexmk` (handles all passes):

```bash
latexmk -pdf main.tex
```

**Overleaf:** upload the whole folder and set `main.tex` as the main document.
`llncs.cls` and `splncs04.bst` are committed in the repo, so no extra package
installation is required.

## LNCS conventions used here

| Item | Rule |
|------|------|
| Section numbering | Only two levels are numbered (`\section`, `\subsection`). `\subsubsection` renders as an unnumbered **run-in bold heading** — write the trailing period yourself. |
| Table captions | Placed **above** the table (`\caption` before `tabular`). |
| Table style | Ruled grid: vertical bars + `\hline`, exactly as `Springer_Latex_Template/samplepaper.tex`. **No `booktabs`.** |
| Figure captions | Placed **below** the figure; labelled `Fig. N`. |
| References | `\bibliographystyle{splncs04}` — sorted alphabetically, numeric labels. **Never hard-code `[n]`; always use `\cite{key}`.** |
| Fonts / geometry | Do not add font packages or change page geometry — Springer typesets the final version. The text block is only **12.2 cm** wide. |
| Keywords | Go **inside** the `abstract` environment via `\keywords{... \and ...}`. |

Every float uses the `[H]` specifier so that tables and figures sit at the same
point in the flow as in the Word document instead of drifting to another page.

## Custom helpers (defined in `preamble.tex`)

| Macro | Purpose |
|-------|---------|
| `\degC{4}` | Typesets `4 °C` consistently. |
| `\srcnote{...}` | Left-aligned note under a table — used for the Word file's `Source: …` lines. Redefine as `\newcommand{\srcnote}[1]{}` to drop all five at once. |
| `\tabtight` | Narrow column padding + permissive hyphenation for wide tables. |
| `\tabairy` | Extra column padding for narrow tables. |
| `\hd{MAE}{(\%)}` | Two-line (stacked) table header. |
| `L{w}` `C{w}` `Y` | Ragged-right fixed-width / centred / `tabularx` stretch columns. |

## Adding a citation

1. Append a BibTeX entry to `bib/references.bib` (key convention: `firstauthorYEAR`).
2. Cite it with `\cite{your-key}`.
3. Rebuild with `make` so `main.bbl` is regenerated and the numbers re-sorted.

The 23 entries currently sort into exactly the same order as the Word
manuscript's reference list, so every `[n]` in the PDF matches the `[n]` in the
`.docx`.

## Build health

The current source compiles to **13 pages** with **0 errors, 0 undefined
references and 0 overfull boxes**. The only warnings are underfull lines inside
the bibliography, caused by long unbreakable DOI/URL strings — harmless and
normal for any LaTeX paper with URLs. Please keep it that way:

```bash
latexmk -pdf main.tex
grep -c "Overfull" main.log        # expect 0
grep -c "undefined" main.log       # expect 0
```

If the paper must come back down to 12 pages, `REVIEW_NOTES.md` §E lists the
levers, in order of least damage to the text.
