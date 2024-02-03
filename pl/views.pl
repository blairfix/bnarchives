# Browse views 
#
# allow_null indicates that no value set is a valid result. 
# multiple fields may be specified for one view, but avoid subject or allowing null in this case.

$c->{browse_views} = [
    {
	id => "year",
	menus => [
	    {
		fields => [ "date;res=year" ],
		reverse_order => 1,
		allow_null => 1,
		new_column_at => [10,10],
	    }
	],
	order => "title/creators_name",
	variations => [
	    "DEFAULT",
	    "date;truncate=4,reverse,jump=plain",
	    "creators_name;string,jump=plain",
	    "lang;-date,creators_name,title,jump=plain",
	    "type;-date,creators_name,title,jump=plain",
	],
    },
    {
	id => "creators",
	allow_null => 0,
	hideempty => 1,
	menus => [
	    {
		fields => [ "creators_name" ],
		new_column_at => [2000],
	    },
	],

	order => "-date/title",
	variations => [
	    "DEFAULT",
	    "date;truncate=4,reverse,jump=plain",
	    "creators_name;string,jump=plain",
	    "lang;-date,creators_name,title,jump=plain",
	    "type;-date,creators_name,title,jump=plain",
	],
    },

    {
	id => "subjects",
	menus => [
	    {
		fields => [ "subjects" ],
		hideempty => 1,
	    }
	],
	order => "creators_name/title",
	include => 1,
	variations => [
	    "DEFAULT",
	    "date;truncate=4,reverse,jump=plain",
	    "creators_name;string,jump=plain",
	    "lang;-date,creators_name,title,jump=plain",
	    "type;-date,creators_name,title,jump=plain",
	],
    },
    {
	id => "lang",
	menus => [
	    {
		fields => [ "lang" ],
		hideempty => 1,
	    }
	],
	order => "creators_name/title",
	include => 1,
	variations => [
	    "DEFAULT",
	    "date;truncate=4,reverse,jump=plain",
	    "creators_name;string,jump=plain",
	    "lang;-date,creators_name,title,jump=plain",
	    "type;-date,creators_name,title,jump=plain",
	],
    },
    {
	id => "year2",
	menus => [
	    {
		fields => [ "type" ],
	    }
	],
	order => "-date",
	variations => [
	    "DEFAULT",
	    "date;truncate=4,reverse,jump=plain",
	    "creators_name;string,jump=plain",
	    "lang;-date,creators_name,title,jump=plain",
	    "type;-date,creators_name,title,jump=plain",
	],        
    },
    #{ id=>"doctype", menus=>[ { fields=>"type" } ], order=>"-date" }
];

# examples of some other useful views you might want to add
#
# Browse by the ID's of creators & editors (CV Pages). Useful to import the 
# .include part into your main website or their homepage, rather than access
# directly via the eprints website.
#        {
#                id => "person",
#                menus => [
#			{
#				fields => [ "creators_id","editors_id" ],
#                		allow_null => 0,
#			}
#		],
#                order => "-date/title",
#                noindex => 1,
#                nolink => 1,
#                nocount => 0,
#                include => 1,
#        },

# Browse by the names of creators (less reliable than Id's), section the menu 
# by the first 3 characters of the surname, and if there are more than 30 
# names, split the menu up into sub-pages of around 30.
# Show the list of names in 3 columns.
#
#
#	{ 
#		id => "people", 
#		menus => [ 
#			{ 
#				fields => ["creators_name","editors_name"], 
#				allow_null => 0,
#				grouping_function => "EPrints::Update::Views::group_by_3_characters",
#				group_range_function => "EPrints::Update::Views::cluster_ranges_30",
#				mode => "sections",
#				open_first_section => 1,
#				new_column_at => [0,0],
#			} 
#		],
#		order=>"title",
#	},


# Browse by the type of eprint (poster, report etc).
#{ id=>"type", menus=>[ { fields=>"type" } ], order=>"-date" }

