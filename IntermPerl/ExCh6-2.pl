#!/usr/bin/perl
use strict;
use warnings;

use 5.014;
use Data::Dumper;

use JSON;

open(my $fhr, "<", "ExCh5-2-coconet.dat")
    or die "Can't open < ExCh5-2-coconet.dat: $!";

my %total_bytes;
while ( ! eof($fhr) ) {
    defined( $_ = readline $fhr )
        or die "readline failed: $!";
    # print $_;

    my ($source, $destination, $bytes) = split;
    $total_bytes{$source}{$destination} += $bytes;
}
close $fhr;

#print to_json( \%total_bytes );

#my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time - 15 * 86400);
my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time);
$mon += 1; $year += 1900;
#say "\$hour: $hour, \$min: $min, \$sec: $sec, \$mday: $mday, \$mon: $mon, \$year: ", $year;
#printf "%02d:%02d:%02d %d-%02d-%02d", $hour, $min, $sec, $year, $mon, $mday; say '';
my $today = sprintf "%d-%02d-%02d", $year, $mon, $mday;

open(my $fhw, '>', "ExCh6-2-out-$today")
    or die "Can't open > ExCh6-2-out-$today: $!";
print $fhw to_json( \%total_bytes );
close $fhw;

__END__
Modify the programm from Exercise 1 to use JSON instead of Storable.
