# docker-ubuntu-latex-ja

### LaTeXコンパイル用のDockerイメージの構築とその実行手順

1. HDDの残容量が十分（10GB以上推奨）あることを確認する（e.g. `df -h`）
1. リポジトリをクローンする: `git clone git@github.com:hideya/docker-ubuntu-latex-ja.git`
1. クローンのディレクトリに入る: `cd docker-ubuntu-latex-ja`
1. Dockerのイメージを構築する: `docker build . -t ubuntu-latex-ja`<br/>
    ネットワークの状況によっては１時間以上かかります。
1. Dockerコンテナにマウントされる作業ディレクトリを用意する: `mkdir workdir`<br/>
    ここにTeXのソース（ビルド環境）を用意する。
1. Dockerコンテナを起動する: `./dockerRunLatex.sh`<br/>
    ホストマシン側の `workdir` が、Dockerコンテナ側の `/workdir` にマウントされる。
1. 起動したコンテナのコンソールから、用意したTeXのソースが見えることを確認し、
    コンパイル等の作業を行う。
