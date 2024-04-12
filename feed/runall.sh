#!/usr/bin/bash

# set script directory
cd "$(dirname "$0")"

# run R feed scripts
for f in [0-9]*
do
    echo $f
    Rscript $f
done

# generate html
#runuser -l eprints -c '/opt/eprints3/bin/generate_static bnarchives'


# reload
#epadmin reload --force bnarchives
