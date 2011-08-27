use 5.008;
use strict;
use warnings;

package Dist::Zilla::Plugin::Test::CheckChanges;
# ABSTRACT: Release tests for checking changes
# VERSION
use Moose;

extends 'Dist::Zilla::Plugin::InlineFiles';
__PACKAGE__->meta->make_immutable;
no Moose;
1;

=for test_synopsis
1;
__END__

=head1 SYNOPSIS

In C<dist.ini>:

    [CheckChangesTests]

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing the
following file:

  xt/release/check-changes.t - a standard Test::CheckChanges test

=cut
__DATA__
___[ xt/release/check-changes.t ]___
#!perl

use Test::More;

eval "use Test::CheckChanges";
plan skip_all => "Test::CheckChanges required for testing changes"
  if $@;
ok_changes();
