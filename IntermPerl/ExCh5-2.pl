#!/usr/bin/perl
use strict;
use warnings;

use 5.014;
use Data::Dumper;

# Modify the code from this chapter so that each source machine’s
# portion of the output shows the total bytes from that machine. List
# the source machines in order from most to least data transferred.
# Within each group, list the destination machines in order from most
# to least data transferred to that target from the source machine:
#
#    professor.hut => gilligan.hut: 1845
#    professor.hut => maryann.hut: 90
#
# The result should be that the machine that sent the most data will be
# the first source machine in the list, and the first destination
# should be the machine to which it sent the most data.
#

open(my $fh, "<", "ExCh5-2-coconet.dat")
    or die "Can't open < ExCh5-2-coconet.dat: $!";

my %total_bytes;
while ( ! eof($fh) ) {
    defined( $_ = readline $fh )
        or die "readline failed: $!";
    # print $_;

    my ($source, $destination, $bytes) = split;
    $total_bytes{$source}{$destination} += $bytes;
}

# print Dumper \%total_bytes;

for my $source (sort keys %total_bytes) {
    for my $destination (sort keys %{ $total_bytes{$source} }) {
        say "$source => $destination: $total_bytes{$source}{$destination} bytes";
    }
    say '';
}
close $fh;

__END__
# make_coconet_data.pl

my $records = $ARGV[0] // 10_000;

my @network = (
	[ qw(crew.hut gilligan skipper) ],
	[ qw(girl.hut ginger maryann) ],
	[ qw(hut professor) ],
	[ qw(copyroom.hut laser3 fileserver) ],
	);

my @hosts = map {
	my( $domain, @hosts ) = @$_;
	
	map { "$_.$domain" } @hosts;
	} @network;

foreach( 1 .. $records ) {
	my( $host1, $host2 ) = map { $hosts[ rand @hosts ] } 1..2;
	my $bytes = int rand 10_000;
	say join "\t", $host1, $host2, $bytes;
	}
