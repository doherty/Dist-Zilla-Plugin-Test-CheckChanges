use 5.008;
use strict;
use warnings;

package Dist::Zilla::Plugin::CheckChangesTests;
# ABSTRACT: (DEPRECATED) Release tests for checking changes
# VERSION
use Moose;
use version 0.77;

extends 'Dist::Zilla::Plugin::Test::CheckChanges';
use namespace::autoclean;

before register_component => sub {
    warn '!!! [CheckChangesTests] is deprecated and will be removed in a future release; replace it with [Test::CheckChanges]';
};

__PACKAGE__->meta->make_immutable;
no Moose;
1;

=for test_synopsis
1;
__END__

=head1 SYNOPSIS

B<< Please use L<Dist::Zilla::Plugin::Test::CheckChanges>. >>

In C<dist.ini>:

    [Test::CheckChanges]

=cut
