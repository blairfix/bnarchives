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

# keywords
{
    'name' => 'keywords',
    'type' => 'longtext',
    'input_rows' => 2
},

# notes
{
    'name' => 'note',
    'type' => 'longtext',
    'input_rows' => 3
},






;
