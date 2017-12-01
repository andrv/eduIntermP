#!/usr/bin/perl
use strict;
use warnings;

use 5.014;
use Data::Dumper;

__END__

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
