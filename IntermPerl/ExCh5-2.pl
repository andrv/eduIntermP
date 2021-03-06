#!/usr/bin/perl
use strict;
use warnings;

use 5.014;
use Data::Dumper;

open(my $fh, "<", "ExCh5-2-coconet.dat")
    or die "Can't open < ExCh5-2-coconet.dat: $!";

my %total_bytes;
while ( ! eof($fh) ) {
    defined( $_ = readline $fh )
        or die "readline failed: $!";
    # print $_;

    my ($source, $destination, $bytes) = split;
    $total_bytes{$source}{$destination} += $bytes;
    $total_bytes{$source}{summa} += $bytes;
}
close $fh;

# print Dumper \%total_bytes;

for my $source (sort { $total_bytes{$b}{summa} <=> $total_bytes{$a}{summa} } keys %total_bytes) {
    for my $destination (sort { $total_bytes{$source}{$b} <=> $total_bytes{$source}{$a} } keys %{ $total_bytes{$source} }) {
        say "$source => $destination: $total_bytes{$source}{$destination} bytes";
    }
    say '';
}

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
