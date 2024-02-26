
######################################################################
#
# Latest_tool Configuration
#
#  the latest_tool script is used to output the last "n" items 
#  accepted into the repository
#
######################################################################

#$c->{latest_tool_modes} = {
#    default => { citation => "result", max => "200" }
#};

$c->{latest_tool_modes} = {
	default => { citation => "result" },
	fplatest => { citation => "result", max => 3 }
};

# Make sure the appropriate Export plugins are also enabled.
$c->{latest_tool_feeds} = {
#       Atom => { enabled => 1, "label" => "Atom" },
#       RSS => { enabled => 1, "label" => "RSS 1.0" },
        RSS2 => { enabled => 1, "label" => "RSS 2.0" },
};

# Example of a latest_tool mode. This makes a mode=articles option
# which only lists eprints who's type equals "article".
#	
#	articles => {
#		citation => undef,
#		filters => [
#			{ meta_fields => [ "type" ], value => "article" }
#		],
#		max => 20
#	}


