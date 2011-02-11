use strict;
use warnings;
use Test::More tests => 3;

BEGIN { 
	use_ok 'Emailesque', 'email'; 
}

my $msg = {
    to      => 'recipient@nowhere.example.net',
    from    => 'sender@emailesque.example.com',
    message => 'You will never receive this',
    path    => '/usr/sbin/sendmail',
};

eval { email() };

# using email keyword

ok $@, 'email with no args dies';

# using OO style

eval { Emailesque->new->send() };

ok $@, 'oo email with no args fails';
