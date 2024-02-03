push @{$c->{fields}->{eprint}},

# chapter
{
    'maxlength' => 5,
    'name' => 'chapter',
    'type' => 'text'
},

# month
{ 'name' => 'month',
    'type' => 'set',
    'input_rows' => 1,
    'options' => [ 'jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec' ]
},

# conference dates
{
    'maxlength' => 256,
    'name' => 'confdates',
    'type' => 'text'
},

# conference
{
    'name' => 'conference',
    'type' => 'text'
},

# conference location
{
    'name' => 'confloc',
    'type' => 'text'
},

# conference type
{
    'name' => 'conftype',
    'type' => 'text'
},

# institution
{
    'name' => 'institution',
    'type' => 'text'
},

# published status
{
    'options' => [
	'unpub',
	'inpress',
	'pub'
    ],
    'name' => 'ispublished',
    'type' => 'set'
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
