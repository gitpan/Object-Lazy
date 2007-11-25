#!perl -T

use 5.006001;
use strict;
use warnings;
use Test::More tests => 4;

BEGIN {
    use_ok('Object::Lazy');
    use_ok('Object::Lazy::Ref');
}

# ref
my $object = Object::Lazy->new({
    build => \&NotExists,
    ref   => 'MyClass',
});
is ref $object, 'MyClass', 'ref is MyClass';
is ref {}, 'HASH', 'ref is HASH';