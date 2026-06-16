# ============================================================================
# Makefile for the IEEEtran paper
# Usage:
#   make            -> build main.pdf (full pipeline with BibTeX)
#   make quick      -> single pdflatex pass (fast preview, no refs update)
#   make clean      -> remove aux files but keep main.pdf
#   make distclean  -> remove everything except sources
# ============================================================================

MAIN      = main
LATEX     = pdflatex -interaction=nonstopmode -halt-on-error
BIBTEX    = bibtex
LATEXMK   = latexmk -pdf -interaction=nonstopmode -halt-on-error

.PHONY: all quick latexmk clean distclean

# Default: prefer latexmk if available, else manual 4-pass build
all:
	@if command -v latexmk >/dev/null 2>&1; then \
		$(MAKE) latexmk; \
	else \
		$(MAKE) manual; \
	fi

latexmk:
	$(LATEXMK) $(MAIN).tex

manual:
	$(LATEX) $(MAIN).tex
	$(BIBTEX) $(MAIN)
	$(LATEX) $(MAIN).tex
	$(LATEX) $(MAIN).tex

quick:
	$(LATEX) $(MAIN).tex

clean:
	rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.fls \
	      *.fdb_latexmk *.synctex.gz *.nav *.snm *.vrb \
	      sections/*.aux

distclean: clean
	rm -f $(MAIN).pdf
