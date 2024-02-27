#!/usr/bin/bash

# remove indexer pid
cd /opt/eprints3/var
rm indexer.pid

# start indexer
runuser -l eprints -c '/opt/eprints3/bin/indexer start'


