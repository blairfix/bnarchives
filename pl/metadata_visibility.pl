# Save this file as (creating directories if necessary):
#     [EPRINTS ROOT]/site_lib/plugins/EPrints/Plugin/CoreOverwrites.pm
# then run:
#     [EPRINTS ROOT]/bin/epadmin test
# to check there's no errors in the code.
#
# If the above is clear, restart Apache and test it out :)
#
# This file 'monkey patches' the core EPrints module. It suppresses the 'redefinition' warnings, so can be a little confusing
# to anyone else trying to debug your system.
#
# This file will survive upgrades, but it is worth comparing the patched method in the existing and new versions of EPrints 
# to see if this needs to be updated.

# Define package to keep Perl/EPrints happy.
package EPrints::Plugin::CoreOverwrites;
use strict;
our @ISA = qw/EPrints::Plugin/;

# now start writing into the package we want to change:
package EPrints::DataObj::EPrint;

use strict;

no warnings 'redefine';

# replace existing method with required version
sub added_to_thread
{
	my( $self, $field, $parent ) = @_;

	return if $parent->value( "eprint_status" ) ne "archive";

	# we are no longer visible
	if( $self->value( "metadata_visibility" ) eq "show" )
	{
    # Don't set this value - we want everything to be searchable!
		# $self->set_value( "metadata_visibility", "no_search" );
		# $self->commit;
	}
}

1;
