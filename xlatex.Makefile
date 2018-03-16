.SUFFIXES: .tex .dvi .pdf

MAIN := main
BIB_FILE	:= references.bib
TEX_FILES	:= $(wildcard *.tex)
STY_FILES	:= $(wildcard *.sty)
IMG_DIRS	?= images
IMG_FILES	:= $(wildcard $(IMG_DIRS)/*.pdf $(IMG_DIRS)/*.png)

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex $(TEX_FILES) $(STY_FILES) $(IMG_FILES)

.tex.pdf: $(MAIN).tex $(TEX_FILES) $(STY_FILES) $(IMG_FILES)
	xelatex $(MAIN).tex
	make clean

clean:
	rm -f *.synctex.gz *.aux *.lof *.toc *.lot *.log *.ps *.blg *.bbl *.out *.fls *.fdb_latexmk *.dvi
	rm -f *.nav *.snm

distclean: clean
	rm -f $(MAIN).pdf
