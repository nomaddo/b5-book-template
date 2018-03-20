# dockerコマンドはwindowsでは動かないかもしれない
# 生成されるファイルの所有者がrootにならないためのおまじない
DOCKER=docker run -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro -v /etc/sudoers:/etc/sudoers:ro -u $( id -u ):$( id -g ) --rm -it -v `pwd`:/project -w /project nomaddo/b5-book-template
PLATEX=platex --kanji=utf8 -interaction=nonstopmode -halt-on-error

all:
	$(DOCKER) $(PLATEX) text.tex
	$(DOCKER) $(PLATEX) text.tex
	dvipdfmx -f fonts.map text.dvi
