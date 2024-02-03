push @{$c->{fields}->{eprint}},

# chapter
{
    'maxlength' => 5,
    'name' => 'chapter',
    'type' => 'text'
},


# test field
{
    name => 'my_first_new_field',
    type => 'set',
    options => [
	'yes',
	'no',
	'partial',
    ],
    input_rows => 1,
},

;
