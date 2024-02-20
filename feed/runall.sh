#!/usr/bin/bash

# run R feed scripts
for f in [0-9]*
do
    echo $f
    Rscript $f
done

# generate html
generate_static bnarchives
#generate_views bnarchives
#generate_abstracts bnarchives

#epadmin reload --force bnarchives
