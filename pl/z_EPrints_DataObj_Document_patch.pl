#
# John Salter (j.salter@leeds.ac.uk) - 2021-10-03
#
# This file overwrites the:-
#  - get_url
#  - thumbnail_url
#  - icon_url 
#  methods in the module EPrints::DataObj::Document
# to use https links in preference to http if appropriate.

#start wrapping block
{ 
package EPrints::DataObj::Document;

use strict;
no warnings 'redefine';

sub get_url
{
	my( $self, $file ) = @_;

	my $path = $self->file_path( $file );
	return undef if !defined $path;

	my $url = $self->{session}->config( "http_url" ) . "/";

	# see https://github.com/eprintsug/ulcc-core/blob/master/perl_lib/EPrints/DataObj/Document.pm
	if( $self->{session}->get_conf("securehost") ){
		$url = $self->{session}->config( "https_url" )."/";
	}

	$url .= 'id/eprint/' if $self->{session}->get_conf( "use_long_url_format");

	$url .= $path;

	return $url;
}


sub thumbnail_url
{
	my( $self, $size ) = @_;

	$size = "small" unless defined $size;

	my $relation = "is${size}ThumbnailVersionOf";

	my $thumbnails = $self->search_related( $relation );

	return undef if $thumbnails->count == 0;

	$relation = "has${size}ThumbnailVersion";

	my $path = $self->path;
	$path =~ s! /$ !.$relation/!x;

	if( $self->is_set( "main" ) )
	{
		$path .= URI::Escape::uri_escape_utf8(
			$self->value( "main" ),
			"^A-Za-z0-9\-\._~\/"
		);
	}

	if( $self->{session}->{preparing_static_page} )
	{
		# Added code
		if( $self->{session}->get_conf("securehost") ){
			return $self->{session}->config( "https_url" ) . "/" . $path;
		}
		# End added code
		return $self->{session}->config( "http_url" ). "/" . $path;
	}

	return $self->{session}->current_url(
		host => 0,
		path => "static",
		$path
	);
}

# size => "small","medium","preview" (small is default)
# public => 0 : show thumbnail only on public docs
# public => 1 : show thumbnail on all docs if poss.
sub icon_url 
{
	my( $self, %opts ) = @_;

	$opts{public} = 1 unless defined $opts{public};
	$opts{size} = "small" unless defined $opts{size};

	if( !$opts{public} || $self->is_public )
	{
		my $thumbnail_url = $self->thumbnail_url( $opts{size} );

		return $thumbnail_url if defined $thumbnail_url;
	}

	my $session = $self->{session};
	my $langid = $session->get_langid;
	my @static_dirs = $session->get_repository->get_static_dirs( $langid );

	my $icon = "other.png";
	my $rel_path = "style/images/fileicons";

	my $format = $self->value( "format" );

	# support old-style MIME types e.g. application/zip
	my( $major, $minor ) = split '/', $format, 2;
	$minor = "" if !defined $minor;
	DIR: foreach my $dir (@static_dirs)
	{
		# we'll use the major type if available e.g. 'image.png'
		foreach my $fn ("$major\_$minor.png", "$major.png")
		{
			if( -e "$dir/$rel_path/$fn" )
			{
				$icon = $fn;
				last DIR;
			}
		}
	}

	if( $session->{preparing_static_page} )
	{
		# Added code
		if( $self->{session}->get_conf("securehost") ){
			return $session->config( "https_url" )."/$rel_path/$icon";
		}
		# End added code
		return $session->config( "http_url" )."/$rel_path/$icon";
	}

	return $session->config( "rel_path" )."/$rel_path/$icon";
}

} #end wrapping block
