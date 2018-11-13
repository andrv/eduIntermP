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
    $total_bytes{$source}{$destination} += $bytes;
#    $total_bytes{$source}{summa} += $bytes;
}
close $fhr;

#print Dumper \%total_bytes;

open(my $fhw, ">", "ExCh5-3-coconet.dat")
    or die "Can't open > ExCh5-3-coconet.dat: $!";

for my $source (sort keys %total_bytes) {
    say $fhw $source;
    for my $destination (sort keys %{ $total_bytes{$source} }) {
        say $fhw "  $destination $total_bytes{$source}{$destination}";
    }
}

close $fhw;

__END__
The program from Exercise 3 in Chapter 5 needs to read the entire data file
each time it runs. However, the Professor has a new router logfile each day and
doesn’t want to keep all that data in one giant file thattakes longer and
longer to process.  Fix up that program to keep the running totals in a data
file so the Professor can run it on each day’s logs to get the new totals. Use
the Storable module.
