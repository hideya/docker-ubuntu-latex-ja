#!/bin/sh
set -x

docker run -it --rm -v $PWD/workdir:/workdir ubuntu-latex-ja

