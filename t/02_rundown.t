use strict;
use warnings;
use Test::More tests => 5;
use Test::Exception;

BEGIN { 
	use_ok 'Emailesque', 'email'; 
}

my $msg = {
    to      => 'recipient@nowhere.example.net',
    from    => 'sender@emailesque.example.com',
    message => 'You will never receive this',
    path    => '/usr/sbin/sendmail',
};

my $e = email();

# using email keyword

ok ! email(), 'email with no args fails';

ok ! $e, 'email with no args fails';

# using OO style

ok ! Emailesque->new->send(), 'oo email with no args fails';

$e = Emailesque->new->send(); $e = "$e" unless $e;

ok $e, 'oo email with no args fails with msg - ' . $e;
