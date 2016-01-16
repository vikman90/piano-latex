# Makefile for Latex document
# Victor Manuel Fernandez Castro
# 16 January 2016

LATEX	= pdflatex -interaction nonstopmode
BIBTEX	= bibtex
RMFILE	= rm -f

TARGET = piano

.PHONY: all clean

all: $(TARGET).pdf

clean:
	$(RM) *.aux *.dvi *.log *.pdf *.synctex.gz *.loc *.toc *.lof *.bbl *.blg \
	      *.nav *.out *.snm *.bak

%.pdf: %.tex %.bib
	$(LATEX) -draftmode $<
	$(BIBTEX) $*
	$(LATEX) -draftmode $<
	$(LATEX) $<

