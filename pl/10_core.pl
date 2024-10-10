# This file was created by bin/epadmin
# You can regenerate this file by doing ./bin/epadmin config_core bnarchives
$c->{host} = 'bnarchives.net';
$c->{port} = '80';
$c->{aliases} = [
                  {
                    'redirect' => 'yes',
                    'name' => 'localhost'
                  },
                  {
                    'name' => 'bnarchives.yorku.ca',
                    'redirect' => 'yes'
                  },
                  {
                    'redirect' => 'yes',
                    'name' => 'bnarchives.economicsfromthetopdown.ca'
                  }
                ];
$c->{securehost} = 'bnarchives.net';
$c->{secureport} = 443;
$c->{http_root} = undef;
