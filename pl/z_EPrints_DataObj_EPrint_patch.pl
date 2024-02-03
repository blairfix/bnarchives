#
# John Salter (j.salter@leeds.ac.uk) - 2021-10-03
#
# This file overwrites the:-
#  - get_url
#  - thumbnail_url
#  - icon_url 
#  methods in the module EPrints::DataObj::EPrint
# to use https links in preference to http if appropriate.

#start wrapping block
{ 
package EPrints::DataObj::EPrint;

use strict;
no warnings 'redefine';

sub url_stem
{
	my( $self ) = @_;

	my $repository = $self->{session}->get_repository;

	my $url;
	if( $repository->get_conf("securehost") )
	{
		$url = $repository->get_conf( "https_url" );
	}
	else
	{
		$url = $repository->get_conf( "http_url" );
	}
	$url .= '/';
	$url .= 'id/eprint/' if $repository->get_conf( "use_long_url_format");
	$url .= $self->get_value( "eprintid" )+0;
	$url .= '/';

	return $url;
}

} #end wrapping block
