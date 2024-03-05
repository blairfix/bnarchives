# Save this file into:
#     [EPRINTS ROOT]/archives/[ARCHIVEID/cfg/cfg.d/
# then run:
#     [EPRINTS ROOT]/bin/epadmin test
# to check there's no errors in the code.
#
# If the above is clear, restart Apache and test it out :)
 
$c->add_dataset_trigger( 'eprint', EPrints::Const::EP_TRIGGER_BEFORE_COMMIT, sub
{
  my( %args ) = @_;
  my( $repo, $eprint, $changed ) = @args{qw( repository dataobj changed )};

  # The 'changed' hash is keyed on the field name, and contains the old values for any changed fields.
  
  # Has the field we're interested in changed? If not, return
  return if !exists $changed->{'metadata_visibilty'};
  
  # If we need the old value:
  #     my $old_metadata_vis = $changed->{'metadata_visibilty'};
  # The dataobject ($eprint in this case) has the new values:
  my $new_metadata_vis = $eprint->get_value( 'metadata_visibilty' );
  
  # if the new value is 
  if( defined $new_metadata_vis && $new_metadata_vis eq 'no_search' )
  {
    $eprint->set_value( 'metadata_visibilty', 'show' );
  }

});
