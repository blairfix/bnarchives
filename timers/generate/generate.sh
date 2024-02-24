#!/usr/bin/bash

mkdir /home/eprints/thumbnails
touch /home/eprints/thumbnails/finished


# generate thumbnails
# ----------------------------

# get bnarchives feed, get item numbers
head /home/eprints/feed/bn_urls.txt -n 12 | sed 's/[^0-9]*//g' > /tmp/bn_urls

# loop over item numbers, see if they've been done before
# if not, generate thumbnails
while read p; do

    # test if p in finished
    look=$( grep -x -F "$p" /home/eprints/thumbnails/finished )

    if [ "$look" = "" ];
    then 

	# convert thumbnails
	echo "New item found ... generating thumbnails for item $p"
	runuser -l eprints -c "/opt/eprints3/bin/epadmin redo_thumbnails bnarchives $p --verbose"

	# mark item as finished
	echo $p >> /home/eprints/thumbnails/finished

    fi
done < /tmp/bn_urls

# generate views
# ----------------------------

runuser -l eprints -c '/opt/eprints3/bin/generate_views bnarchives'
runuser -l eprints -c '/opt/eprints3/bin/generate_abstracts bnarchives'
runuser -l eprints -c '/opt/eprints3/bin/generate_static bnarchives'


