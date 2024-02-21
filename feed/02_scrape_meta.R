library(magrittr)
library(data.table)
library(stringi)

urls = readLines("bn_urls.txt")

# clean metadata function
#-------------------------------------------

clean_func = function(x, tag){

    id = grep(tag, x)
    info =  x[id]
    info = strsplit( info, 'content="' ) %>% unlist()

    id = grep("eprints", info)

    if( id != 2 ){

	info = gsub( '" />', '', info, fixed = T )
	info =  info[2] %>% trimws()

    } else {

	info = strsplit( info, 'content=|name=' ) %>% unlist()
	info =  info[2] 
	info = gsub( '"', '', info, fixed = T ) %>% trimws()

    }

    return(info)
}


# loop or urls and get metadata
#-------------------------------------------

result = NULL

for( i in 1:length(urls) ){

    print(i)

    # get page
    page = readLines( urls[i] )

    # clean lines
    page = paste(page, collapse = " ")
    page = strsplit(page, "/>") %>% unlist()
    page = paste(page, "/>", sep = "")


    # meta 
    id = grep("meta", page)
    meta = page[id]

    # title
    title = clean_func( meta, "eprints.title" )

    # abstract 
    abstract = clean_func( meta, "eprints.abstract" )

    # date
    date = clean_func( meta, 'eprints.date"' )

    # image
    id = grep( "ep_document_link", page)
    img = page[id]

    id = grep("jpg|JPG|png|jpeg|JPEG|PNG", img)
    img = img[id]

    img = strsplit(img, "<|>| ", ) %>% unlist()
    id = grep("jpg|JPG|png|jpeg|JPEG|PNG", img) %>% head(. ,1)
    img = img[id]

    img = gsub('href="', "", img, fixed = T)
    img = gsub('"', "",  img, fixed = T)


    #author 
    id = grep("eprints.creators_name", meta)
    author = rep(NA, length(id) )

    for( j in 1:length(id) ) {

	author[j] = clean_func( meta[ id[j] ], "eprints.creators_name" )

    }

    author = strsplit( author, "," )
    first_name = sapply(author, "[", 2) %>% unlist() %>% trimws()
    last_name = sapply(author, "[", 1)  %>% unlist() %>% trimws()

    author = paste(
		   first_name,
		   " ",
		   last_name,
		   ",",
		   sep = ""
		  ) 

    author = paste(author, collapse = " ")

    author = stri_replace_last_fixed(author, ',', '')
    author = stri_replace_last_fixed(author, ', ', ' &amp; ')


    # bind
    d = data.table(
		   url = urls[i],
		   title = title,
		   author = author,
		   img = img,
		   date = date,
		   abstract = abstract
    )

    result = rbind(result, d)

}

# export 
#-------------------------------------------
fwrite(result, "metadata.csv")

