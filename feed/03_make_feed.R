library(data.table)
library(magrittr)

d = fread("metadata.csv")

d = head(d, 4)


# loop over items and make grid
#------------------------

grid_item = rep( NA, nrow(d) )

for(i in 1:nrow(d) ){

    sub = d[i]
    url = sub$url

    link_stub = paste(
		      '<a class="feed-link" href="',
		      url,
		      '">',
		      sep = ""
		      )


    title = paste(
		  '<div class="feed-title">',
		  sub$title,
		  "</div>",
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
		'<img style="width:100%;" src="', 
		sub$img,
		'"/></div>',
		sep = ""
    )


    abstract = strsplit( sub$abstract, " " ) %>% unlist()
    abstract = head(abstract, 50)
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
			 link_stub,
			 '<div style="height:100%">',
			 img, 
			 author,
			 title,
			 date,
			 abstract,
			 '</div></a>',
			 "</div>",
			 sep = ""
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






