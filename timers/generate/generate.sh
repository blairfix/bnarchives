#!/usr/bin/bash

runuser -l eprints -c '/opt/eprints3/bin/generate_views bnarchives'
runuser -l eprints -c '/opt/eprints3/bin/generate_abstracts bnarchives'
runuser -l eprints -c '/opt/eprints3/bin/generate_static bnarchives'


# thumbnails
#head /home/eprints/feed/bn_urls.txt -n 2 | sed 's/[^0-9]*//g' > /tmp/bn_urls
#
#while read p; do
#   runuser -l eprints -c '/opt/eprints3/bin/epadmin redo_thumbnails bnarchives $p --verbose'
#done </tmp/bn_urls
#
