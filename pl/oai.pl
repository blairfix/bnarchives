######################################################################
#
#  OAI Configuration for Archive.
#
######################################################################
#
#
######################################################################

my $oai = {};
$c->{oai} = $oai;

##########################################################################
# OAI-PMH 2.0 
#
# 2.0 requires slightly different schemas and XML to v1.1
##########################################################################

# Site specific **UNIQUE** archive identifier.
# See http://www.openarchives.org/ for existing identifiers.
# This may be different for OAI v2.0
# It should contain a dot (.) which v1.1 can't. This means you can use your
# sites domain as (part of) the base ID - which is pretty darn unique.

# IMPORTANT: Do not register an archive with the default archive_id! 
#$oai->{v2}->{archive_id} = "bnarchives.net";

# Base URL of OAI 2.0
$oai->{v2}->{base_url} = $c->{perl_url}."/oai2";

##########################################################################
# GENERAL OAI CONFIGURATION
# 
# This applies to all versions of OAI.
##########################################################################



# Set Configuration
# Rather than harvest the entire archive, a harvester may harvest only
# one set. Sets are usually subjects, but can be anything you like and are
# defined in the same manner as "browse_views". Only id, allow_null, fields
# are used.
$oai->{sets} = [
#	{ id=>"year", allow_null=>1, fields=>"date" },
#	{ id=>"person", allow_null=>0, fields=>"creators_id/editors_id" },
	{ id=>"status", allow_null=>0, fields=>"ispublished" },
	{ id=>"subjects", allow_null=>0, fields=>"subjects" },
	{ id=>"types", allow_null=>0, fields=>"type" },
];

# Custom sets allow you to create a specific search query related to a set
# e.g. for the EU DRIVER conformance
$oai->{custom_sets} = [
	{ spec => "driver", name => "Open Access DRIVERset", filters => [
		{ meta_fields => [ "full_text_status" ], value => "public", },
	] },
];

# Filter OAI export. If you want to stop certain records being exported
# you can add filters here. These work the same as for a search filter.

$oai->{filters} = [

# Example: don't export any OAI records from before 2003.
#	{ meta_fields => [ "date-effective" ], value=>"2003-" }
];


# This maps eprints document types to mime types if they are not the
# same.
$oai->{mime_types} = {};



########################################################################
#
# Information for "Identify" responses.
# 
# TIP: There is an online tool which we recommend you used to 
#      generate the remainder of this configuration file.
#
#      http://www.opendoar.org/tools/en/policies.php
#
########################################################################

# "content" : Text and/or a URL linking to text describing the content
# of the repository.  It would be appropriate to indicate the language(s)
# of the metadata/data in the repository.

$oai->{content}->{"text"} = undef;
$oai->{content}->{"url"} = $c->{base_url} . "/policies.html";

# "metadataPolicy" : Text and/or a URL linking to text describing policies
# relating to the use of metadata harvested through the OAI interface.

# metadataPolicy{"text"} and/or metadataPolicy{"url"} 
# MUST be defined to comply to OAI.

$oai->{metadata_policy}->{"text"} = <<END;
This site is licensed under a Creative Commons License (Attribution-NonCommercial-NoDeriatives). Unless noted otherwise, you are free to view, download, send, print, web-link and web-post material from these archives with explicit and due attribution of authorship and publication. Commercial use is forbidden. 
END
$oai->{metadata_policy}->{"url"} = undef;

# "dataPolicy" : Text and/or a URL linking to text describing policies
# relating to the data held in the repository.  This may also describe
# policies regarding downloading data (full-content).

# dataPolicy{"text"} and/or dataPolicy{"url"} 
# MUST be defined to comply to OAI.

$oai->{data_policy}->{"text"} = <<END;
This site is licensed under a Creative Commons License (Attribution-NonCommercial-NoDeriatives). Unless noted otherwise, you are free to view, download, send, print, web-link and web-post material from these archives with explicit and due attribution of authorship and publication. Commercial use is forbidden. 
END
$oai->{data_policy}->{"url"} = undef;

# "submissionPolicy" : Text and/or a URL linking to text describing
# policies relating to the submission of content to the repository (or
# other accession mechanisms).

$oai->{submission_policy}->{"text"} = <<END;
No submission-data policy defined. 
This server has not yet been fully configured.
END
$oai->{submission_policy}->{"url"} = undef;

# "comment" : Text and/or a URL linking to text describing anything else
# that is not covered by the fields above. It would be appropriate to
# include additional contact details (additional to the adminEmail that
# is part of the response to the Identify request).

# An array of comments to be returned. May be empty.

$oai->{comments} = [ 
	"This system is running eprints server software (".
		EPrints::Config::get( "version" ).") developed at the ".
		"University of Southampton. For more information see ".
		"http://www.eprints.org/"
];

########################################################################
# This is the end of the block which the DOAR policy tool can help you
# generate.
########################################################################




=head1 COPYRIGHT

=for COPYRIGHT BEGIN

Copyright 2022 University of Southampton.
EPrints 3.4 is supplied by EPrints Services.

http://www.eprints.org/eprints-3.4/

=for COPYRIGHT END

=for LICENSE BEGIN

This file is part of EPrints 3.4 L<http://www.eprints.org/>.

EPrints 3.4 and this file are released under the terms of the
GNU Lesser General Public License version 3 as published by
the Free Software Foundation unless otherwise stated.

EPrints 3.4 is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with EPrints 3.4.
If not, see L<http://www.gnu.org/licenses/>.

=for LICENSE END

