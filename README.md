# Mamba State Space Model with Spectral Feature Conditioning — LaTeX Source

Springer **LNCS** (`llncs`) source for the paper:

> **Mamba State Space Model with Spectral Feature Conditioning for State of
> Health Prediction and Anomaly Detection in Lithium-Ion Batteries**
> Nguyen Phuc Duy, Bui Phuoc Thang, Mai Hong Thai, Tran Minh Tri, Nguyen Nhat Minh
> Faculty of Software Engineering, FPT University Ho Chi Minh City

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
│   ├── 03_related_work.tex      # §2  Related Work  (+ Table 1)
│   ├── 04_methodology.tex       # §3  Methodology   (+ Eq. 1–2, Fig. 1)
│   ├── 05_experiments.tex       # §4  Experimental Results (+ Tables 2–5, Fig. 2)
│   ├── 06_discussion.tex        # §5  Discussion    (+ Table 6)
│   ├── 07_conclusion.tex        # §6  Conclusion
│   └── 08_acknowledgment.tex    # Acknowledgements
│
├── bib/
│   └── references.bib           # 23 BibTeX entries
│
└── figures/
    ├── architecture.png         # Fig. 1 — overall framework
    └── soh_prediction_b0048.png # Fig. 2 — predicted vs. true SOH on B0048
```

## Build

```bash
make            # full build: pdflatex → bibtex → pdflatex → pdflatex
make quick      # single pass, fast preview (references not refreshed)
make clean      # remove .aux/.log/... but keep main.pdf
```

Or manually:

```bash
pdflatex main.tex
bibtex   main
pdflatex main.tex
pdflatex main.tex
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
| Figure captions | Placed **below** the figure; labelled `Fig. N`. |
| References | `\bibliographystyle{splncs04}` — sorted alphabetically, numeric labels. **Never hard-code `[n]`; always use `\cite{key}`.** |
| Fonts / geometry | Do not add font packages or change page geometry — Springer typesets the final version. The text block is only **12.2 cm** wide. |
| Keywords | Go **inside** the `abstract` environment via `\keywords{... \and ...}`. |

## Custom helpers (defined in `preamble.tex`)

| Macro | Purpose |
|-------|---------|
| `\degC{4}` | Typesets `4 °C` consistently. |
| `\tabsource{...}` | Centred italic *Source:* line under a table. |
| `\tabnote{...}` | Left-aligned full-width note under a table (symbol footnotes). |
| `\tabtight` | Narrow column padding + permissive hyphenation for wide tables. |
| `\tabairy` | Extra column padding for narrow tables. |
| `\hd{MAE}{(\%)}` | Two-line (stacked) table header. |
| `L{w}` `C{w}` `Y` | Ragged-right fixed-width / centred / `tabularx` stretch columns. |

## Adding a figure

Drop the file into `figures/` and include it with:

```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=\textwidth]{your_figure.png}
  \caption{Caption below the figure.}
  \label{fig:your-label}
\end{figure}
```

Reference it as `Fig.~\ref{fig:your-label}`.

## Adding a citation

1. Append a BibTeX entry to `bib/references.bib` (key convention: `firstauthorYEAR`).
2. Cite it with `\cite{your-key}`.
3. Rebuild with `make` so `main.bbl` is regenerated and the numbers re-sorted.

## Build health

The current source compiles to **12 pages** with **0 errors, 0 undefined
references and 0 overfull boxes** (the only underfull warnings are long DOI/URL
lines in the bibliography, which are harmless). Please keep it that way:

```bash
grep -c "Overfull\|undefined" main.log     # expect 0
```

The layout is tuned to fit a 12-page limit (float-packing parameters and
reduced float spacing in `preamble.tex`). See `REVIEW_NOTES.md` §E for the full
list of page-reduction changes and how to revert them.
