#!/usr/bin/perl

use strict;
use warnings;

use 5.014;
use Data::Dumper;

use File::Spec;

my $dir = '/etc';

#print Dumper \@ARGV;
#foreach my $file (@ARGV) {
##    print Dumper(File::Spec->catfile($dir, $file));
##    print Dumper(stat(File::Spec->catfile($dir, $file)));
#}

my @smallFiles = grep {
    my @stats = stat(File::Spec->catfile($dir, $_));
    $stats[7] < 1000
} @ARGV;
#print Dumper \@smallFiles;

say "small files in $dir:";
my @output = map {"    $_\n"} @smallFiles;
#print Dumper \@output;

print for @output;

__END__
