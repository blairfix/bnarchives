$c->{search}->{advanced} = 
{
    search_fields => [
	{ meta_fields => [ "documents" ] },
	{ meta_fields => [ "creators_name" ] },
	{ meta_fields => [ "title" ] },
	{ meta_fields => [ "abstract" ] },
	{ meta_fields => [ "date" ] },
	{ meta_fields => [ "keywords" ] },
	{ meta_fields => [ "subjects" ] },
	{ meta_fields => [ "lang" ] },
	{ meta_fields => [ "type" ] },
	{ meta_fields => [ "documents.format" ] },
	{ meta_fields => [ "editors_name" ] },
	{ meta_fields => [ "publication" ] },
	{ meta_fields => [ "ispublished" ] },
	{ meta_fields => [ "refereed" ] },
    ],
    preamble_phrase => "cgi/advsearch:preamble",
    title_phrase => "cgi/advsearch:adv_search",
    citation => "result",
    page_size => 100,
    order_methods => {
	"byyear" 	 => "-date/title/creators_name",
	"byyearoldest"	 => "date/title/creators_name",
	"byeprinttype"	 => "publication/-date/creators_name/title",
	"byname"  	 => "creators_name/-date/title",
	"bytitle" 	 => "title/-date/creators_name"
    },
    default_order => "byyear",
    show_zero_results => 1,
};

