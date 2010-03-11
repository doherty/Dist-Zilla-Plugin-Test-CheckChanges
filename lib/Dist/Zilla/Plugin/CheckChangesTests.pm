use 5.008;
use strict;
use warnings;

package Dist::Zilla::Plugin::CheckChangesTests;
# ABSTRACT: release tests for checking changes
use Moose;
use Test::CheckChanges;
extends 'Dist::Zilla::Plugin::InlineFiles';

__PACKAGE__->meta->make_immutable;
no Moose;
1;

=pod

=for test_synopsis
1;
__END__

=head1 SYNOPSIS

In C<dist.ini>:

    [CheckChangesTests]

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing the
following files

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
