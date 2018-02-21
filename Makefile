PLATEX=platex --kanji=utf8 -interaction=nonstopmode -halt-on-error

all:
	$(PLATEX) text.tex
	$(PLATEX) text.tex
	dvipdfmx -f fonts.map text.dvi
