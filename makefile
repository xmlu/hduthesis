# Makefile for LaTeX document
# Usage:
#   make watch   - continuously compile on changes
#   make pdf     - compile once to PDF
#   make clean   - remove auxiliary files
#   make cleanall- remove all generated files including PDF

.PHONY: watch pdf clean cleanall

WATCH_TARGET = main.tex
LATEXMK = latexmk
LATEXMK_FLAGS = -xelatex -synctex=1 -pvc -interaction=nonstopmode

watch:
	$(LATEXMK) $(LATEXMK_FLAGS) $(WATCH_TARGET)

pdf:
	$(LATEXMK) -synctex=1 -pdf $(WATCH_TARGET)

clean:
	$(LATEXMK) -c

cleanall:
	$(LATEXMK) -C
