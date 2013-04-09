
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Release tests for checking changes",
  "dist_author" => [
    "Marcel Gr\303\274nauer <marcel\@cpan.org>",
    "Mike Doherty <doherty\@cpan.org>"
  ],
  "dist_name" => "Dist-Zilla-Plugin-Test-CheckChanges",
  "dist_version" => "2.000002",
  "license" => "perl",
  "module_name" => "Dist::Zilla::Plugin::Test::CheckChanges",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Dist::Zilla::Plugin::InlineFiles" => 0,
    "Moose" => 0,
    "Test::CheckChanges" => 0,
    "namespace::autoclean" => 0,
    "perl" => "5.008",
    "strict" => 0,
    "version" => "0.77",
    "warnings" => 0
  },
  "script_files" => [],
  "test_requires" => {
    "File::Find" => 0,
    "File::Path" => 0,
    "File::Temp" => 0,
    "Moose::Autobox" => 0,
    "Test::DZil" => 0,
    "Test::More" => "0.96",
    "Test::Output" => 0,
    "autodie" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
