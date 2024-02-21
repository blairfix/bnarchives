library(data.table)
library(magrittr)

d = fread("metadata.csv")

d = head(d, 8)


# loop over items and make grid
#------------------------

grid_item = rep( NA, nrow(d) )

for(i in 1:nrow(d) ){

    sub = d[i]
    url = sub$url

    title = paste(
		  '<div class="feed-title">',
		  '<a class="feed-link" href="',
		  url,
		  '">',
		  sub$title,
		  "</a></div>",
		  sep = ""
    )

    author = paste(
		   '<div class="feed-author">',
		   sub$author,
		   "</div>",
		   sep = ""
    )


    date = paste(
		   '<div class="feed-date">',
		   sub$date,
		   "</div>",
		   sep = ""
    )


    img = paste(
		'<div class="feed-img">',
		'<a href="',
		url,
		'">',
		'<img style="width:100%;" src="', 
		sub$img,
		'"/></a></div>',
		sep = ""
    )


    abstract = strsplit( sub$abstract, " " ) %>% unlist()
    abstract = head(abstract, 75)
    abstract = paste(abstract, collapse = " ")

    if( nchar(abstract) < nchar(sub$abstract) ){
	abstract = paste( abstract, " … ", sep = "")
    }

    abstract = paste(
		     '<div class="feed-abstract">',
		     abstract,
		     "</div>",
		     sep = ""
    )


    # make grid item
    grid_item[i] = paste(
			 '<div class="grid-item">',
			 img, 
			 author,
			 title,
			 date,
			 abstract,
			 "</div>"
    )

}


grid = c(
	 '<div id="grid">',
	 grid_item,
	 "</div>"
	 )


grid = paste(grid, collapse = "\n")



# export feed test
template = readLines("template.html")
template = gsub( "feed-here", grid, template, fixed = T )
writeLines(template, "feed_test.html")

# export feed
writeLines(grid, "feed.html")





