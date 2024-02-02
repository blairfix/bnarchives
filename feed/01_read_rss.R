
url = "https://bnarchives.yorku.ca/cgi/latest_tool?output=RSS2"
rss = readLines(url)


# get links
id = grep("<item>", rss)
id = id[1]
rss = rss[ id:length(rss) ]

id = grep("<link>", rss)
links = rss[id]

# keep 12
links = head(links, 12)

# clean
links = gsub("<link>", "", links, fixed = T)
links = gsub("</link>", "", links, fixed = T)
links = trimws(links)

# export links
writeLines(links, "bn_urls.txt")
