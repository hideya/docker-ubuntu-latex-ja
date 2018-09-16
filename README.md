# docker-ubuntu-latex-ja

## 手順

1. `mkdir data`
2. `cd data`
3. `git clone <原稿のリポジトリ>`
4. `cd ..`
5. `./initFonts.sh`
6. `docker build . -t ubuntu-latex-ja`
7. `docker run --rm -ti -v $PWD/data:/data ubuntu-latex-ja`
