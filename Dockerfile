# Ubuntu と TeX Live（日本語フォント関連の設定済）を含む Docker Image を構築

# Ubuntu 18.04.2 LTS (EOL: April 2023)
FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive
RUN set -x && \
    sed -i.bak -e "s|http://archive.ubuntu.com/ubuntu/|http://ftp.jaist.ac.jp/pub/Linux/ubuntu/|g" /etc/apt/sources.list && \
    \
    apt-get update && \
    apt-get install -y && \
    apt-get install -y git wget software-properties-common make && \
    apt-add-repository -y ppa:jonathonf/texlive && \
    apt-get install -y texlive-full latexmk && \
    apt-get autoremove && \
    apt-get clean && \
    \
    wget http://mirrors.ctan.org/macros/latex/contrib/docmute.zip && \
    unzip docmute.zip && \
    rm docmute.zip && \
    mv docmute /usr/share/texmf/tex/latex/ && \
    \
    wget http://mirrors.ctan.org/macros/latex/contrib/listings.zip && \
    unzip listings.zip && \
    rm listings.zip && \
    mv listings /usr/share/texmf/tex/latex/ && \
    \
    cd /usr/share/texmf/tex/latex/listings && \
    platex *.ins && \
    cd - && \
    \
    mktexlsr && \
    kanji-config-updmap-sys auto

# MacOS にインストールされているヒラギノフォントを使う場合は、`docker build` の前に、
# 以下の２行をコメントアウトし、`./initMacOSHiraginoFonts.sh` を実行しておく。
# COPY texmf-local /usr/local/share/texmf
# RUN mktexlsr && kanji-config-updmap-sys hiragino-highsierra

WORKDIR /workdir
VOLUME [ "/workdir" ]
