push @{$c->{fields}->{eprint}},


# alternative location
{
    'name' => 'altloc',
    'multiple' => 1,
    'type' => 'url'
},

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

# language
{
    'options' => [
	'Arabic',
	'Chinese',
	'Dutch',
	'English',
	'French',
	'German',
	'Greek',
	'Hebrew',
	'Italian',
	'Japanese',
	'Korean',
	'Portuguese',
	'Russian',
	'South Asian',
	'Spanish',
	'Turkish',
	'Vietnamese',
	'Other'
    ],
    'name' => 'lang',
    'type' => 'set'
},

# public domain
{
    name => 'pubdom',
    type => 'set',
    options => [
	'Yes',
	'No',
	'Unspecified'
    ]
}


# report number
{
    'name' => 'reportno',
    'type' => 'text'
},

# thesis type
{
    'name' => 'thesistype',
    'type' => 'text'
},


;
