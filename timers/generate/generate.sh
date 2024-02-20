#!/usr/bin/bash

/opt/eprints3/bin/generate_views bnarchives
/opt/eprints3/bin/generate_abstracts bnarchives
/opt/eprints3/bin/generate_static bnarchives


# thumbnails
head /home/eprints/feed/bn_urls.txt -n 2 | sed 's/[^0-9]*//g' > /tmp/bn_urls

while read p; do
    /opt/eprints3/bin/epadmin redo_thumbnails bnarchives $p --verbose
done </tmp/bn_urls

