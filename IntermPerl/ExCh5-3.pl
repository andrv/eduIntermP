#!/usr/bin/perl
use strict;
use warnings;

use 5.014;
use Data::Dumper;

open(my $fhr, "<", "ExCh5-2-coconet.dat")
    or die "Can't open < ExCh5-2-coconet.dat: $!";

my %total_bytes;
while ( ! eof($fhr) ) {
    defined( $_ = readline $fhr )
        or die "readline failed: $!";
    # print $_;

    my ($source, $destination, $bytes) = split;
}
close $fhr;

#print Dumper \%total_bytes;

open(my $fhw, ">", "ExCh5-3-coconet.dat")
    or die "Can't open > ExCh5-3-coconet.dat: $!";

for my $source (sort keys %total_bytes) {
    say $fhw $source;
}
close $fhw;

__END__
Starting with your data structure from Exercise 2, rewrite the coconet.dat
file so that it’s in the same format, but sorted by source machine. Report
each destination machine once per source machine along with total bytes
transferred. The destination machines should be indented under the source
machine name and be sorted by the machine name:
ginger.hut
  maryann.hut 13744
professor.hut
  gilligan.hut 1845
  maryann.hut 90
thurston.howell.hut
  lovey.howell.hut 97560
...
