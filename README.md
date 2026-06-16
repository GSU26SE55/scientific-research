# IEEEtran Paper — Modular LaTeX Source

A modular LaTeX project structured around the **IEEEtran** template.
Each section of the paper lives in its own `.tex` file and is assembled
into a single PDF via `main.tex` using `\input{}`.

## Directory layout

```
.
├── main.tex                  # Entry point — \input{} all parts here
├── preamble.tex              # Package imports + custom commands
├── Makefile                  # `make`, `make quick`, `make clean`
├── .gitignore                # Ignore LaTeX build artifacts
│
├── sections/
│   ├── 00_metadata.tex       # Title, authors, affiliations
│   ├── 01_abstract.tex       # Abstract + IEEEkeywords
│   ├── 02_introduction.tex   # §I  Introduction
│   ├── 03_related_work.tex   # §II Related Work
│   ├── 04_methodology.tex    # §III Proposed Method
│   ├── 05_experiments.tex    # §IV Experiments & Results
│   ├── 06_conclusion.tex     # §V  Conclusion & Future Work
│   ├── 07_acknowledgment.tex # Acknowledgment
│   ├── 08_appendix.tex       # Appendices (optional)
│   └── 09_biography.tex      # Author bios (journal only)
│
├── bib/
│   └── references.bib        # BibTeX entries
│
└── figures/                  # Drop .pdf / .png / .jpg figures here
```

## How to build the PDF

### Option 1 — `make` (recommended)

```bash
make           # full build: pdflatex → bibtex → pdflatex → pdflatex
make quick     # single pass, fast preview (no bib update)
make clean     # remove .aux/.log/... but keep main.pdf
```

### Option 2 — Manual 4-pass build

```bash
pdflatex main.tex
bibtex   main
pdflatex main.tex
pdflatex main.tex
```

### Option 3 — `latexmk` (handles all passes automatically)

```bash
latexmk -pdf main.tex
```

### Option 4 — Online editor

Upload the entire project to [Overleaf](https://www.overleaf.com) and
set `main.tex` as the main document.

## Installing a LaTeX distribution (if you don't have one)

- **macOS** — `brew install --cask mactex` (full, ~4 GB) or `mactex-no-gui`
  (smaller). Alternative: BasicTeX + `tlmgr install <pkg>` on demand.
- **Linux** — `sudo apt install texlive-full latexmk` (Debian/Ubuntu).
- **Windows** — install [MiKTeX](https://miktex.org/).

The IEEEtran class file ships with all major distributions, so no manual
download is needed.

## Switching between conference and journal format

In `main.tex`, change the `documentclass` option:

```latex
\documentclass[conference,a4paper,10pt]{IEEEtran}  % conference
\documentclass[journal,a4paper,10pt]{IEEEtran}     % journal/Transactions
\documentclass[technote,a4paper,10pt]{IEEEtran}    % brief
```

For journal submissions, also:
1. Replace the `\author{...}` block in `sections/00_metadata.tex` with
   the richer `\thanks{}` version (an example is included as a comment).
2. Uncomment the `\input{sections/09_biography.tex}` line at the bottom
   of `main.tex`.

## Adding figures

Drop image files into `figures/` and include them with:

```latex
\begin{figure}[t]
  \centering
  \includegraphics[width=\columnwidth]{your_figure.pdf}
  \caption{Caption goes here.}
  \label{fig:your-label}
\end{figure}
```

Use `\Cref{fig:your-label}` (cleveref) to reference it.

## Adding a citation

1. Append a BibTeX entry to `bib/references.bib`.
2. Cite it in the text with `\cite{your-key}`.
3. Rebuild with `make` to refresh the `.bbl` file.

## Paper structure (mapped to IEEEtran convention)

| # | File                              | Section in PDF        | Required? |
|---|-----------------------------------|-----------------------|-----------|
| 1 | `sections/00_metadata.tex`        | Title + Authors       | Yes       |
| 2 | `sections/01_abstract.tex`        | Abstract + Keywords   | Yes       |
| 3 | `sections/02_introduction.tex`    | I. Introduction       | Yes       |
| 4 | `sections/03_related_work.tex`    | II. Related Work      | Yes       |
| 5 | `sections/04_methodology.tex`     | III. Proposed Method  | Yes       |
| 6 | `sections/05_experiments.tex`     | IV. Experiments       | Yes       |
| 7 | `sections/06_conclusion.tex`      | V. Conclusion         | Yes       |
| 8 | `sections/07_acknowledgment.tex`  | Acknowledgment        | Optional  |
| 9 | `bib/references.bib`              | References            | Yes       |
|10 | `sections/08_appendix.tex`        | Appendix              | Optional  |
|11 | `sections/09_biography.tex`       | Biographies           | Journal   |

All placeholders are clearly marked with `[BRACKETS]` so you can grep
and replace as you fill in your own content.
