#!/usr/bin/perl
use strict;
use warnings;

use 5.014;
use Data::Dumper;

use Storable qw(nstore);

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

#my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time - 15 * 86400);
my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time);
$mon += 1; $year += 1900;
#say "\$hour: $hour, \$min: $min, \$sec: $sec, \$mday: $mday, \$mon: $mon, \$year: ", $year;
#printf "%02d:%02d:%02d %d-%02d-%02d", $hour, $min, $sec, $year, $mon, $mday; say '';
my $today = sprintf "%d-%02d-%02d", $year, $mon, $mday;

nstore \%total_bytes, "totals-$today";

__END__
The program from Exercise 3 in Chapter 5 needs to read the entire data file
each time it runs. However, the Professor has a new router logfile each day and
doesn’t want to keep all that data in one giant file that takes longer and
longer to process.  Fix up that program to keep the running totals in a data
file so the Professor can run it on each day’s logs to get the new totals. Use
the Storable module.
