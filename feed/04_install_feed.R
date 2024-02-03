feed = readLines("feed.html")
feed = paste(feed, collapse = "\n")

# insert feed into template
setwd("/opt/eprints3/archives/bnarchives/cfg/lang/en/static")

template = readLines("index.xpage.template")
template = gsub("feed-goes-here", feed, template)

# export home page
writeLines( template, "index.xpage" )
