FROM ubuntu:16.04

RUN apt-get update && apt-get install -y texlive-full wget unzip \
 && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN wget -O /tmp/master.zip https://github.com/h-kitagawa/plistings/archive/master.zip \
 && unzip /tmp/master.zip                                                              \
 && chmod 644 plistings-master/plistings.sty                                           \
 && mv plistings-master/plistings.sty /usr/share/texlive/texmf-dist/tex/latex/listings \
 && mktexlsr                                                                           \
 && rm -rf /tmp/master.zip plistings-master

RUN apt-get remove wget unzip -y
