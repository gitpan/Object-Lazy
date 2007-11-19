package Object::Lazy::Ref;

use strict;
use warnings;

our $VERSION = '0.01';

my %register;

BEGIN {
    *CORE::GLOBAL::ref = sub ($) {
        my $ref = shift;
        return exists $register{$ref}
               ? $register{$ref}
               : CORE::ref($ref);
    }
}

sub register {
    my $object = shift;

    $register{$object} = $object->{ref};

    return;
}

1;

__END__

=pod

=head1 NAME

Object::Lazy::Ref - Simulation of C<ref $object> for Object::Lazy

=head1 VERSION

0.01

=head1 SYNOPSIS

 use Object::Lazy::Ref;

 Object::Lazy::Ref::register($object);

=head1 DESCRIPTION

Simulation of C<ref $obj> for Object::Lazy

=head1 SUBROUTINES/METHODS

=head2 sub register

switch on the simulation.

 Object::Lazy::Ref::register($object);

=head1 DIAGNOSTICS

nothing

=head1 CONFIGURATION AND ENVIRONMENT

nothing

=head1 DEPENDENCIES

nothing

=head1 INCOMPATIBILITIES

not known

=head1 BUGS AND LIMITATIONS

not known

=head1 AUTHOR

Steffen Winkler

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2007,
Steffen Winkler
C<< <steffenw@cpan.org> >>.
All rights reserved.

This module is free software;
you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut