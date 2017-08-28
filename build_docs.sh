#!/bin/bash

for i in $(ls *.Rmd)
  do
  R --no-save --no-restore --no-init-file --no-site-file -e "rmarkdown::render('$i')"
 done
