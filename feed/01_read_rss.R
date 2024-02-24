
url = readLines("bn_rss.txt")
rss = readLines(url)


# get links
id = grep("<item>", rss)
id = id[1]
rss = rss[ id:length(rss) ]

id = grep("<link>", rss)
links = rss[id]

# keep 20 
links = head(links, 20)

# clean
links = gsub("<link>", "", links, fixed = T)
links = gsub("</link>", "", links, fixed = T)
links = trimws(links)

# export links
writeLines(links, "bn_urls.txt")
