#!/usr/bin/perl

use strict;
use warnings;

use 5.014;
use Data::Dumper;

my %gilligan_info = (
	name     => 'Gilligan', 
	hat      => 'White', 
	shirt    => 'Red', 
	position => 'First Mate',
    location => 'The Island.',
);
my %skipper_info = (
	name     => 'Skipper',
	hat      => 'Black',
	shirt    => 'Blue',
	position => 'Captain',
    location => 'The Island.',
);

my @crew = (
    \%gilligan_info,
    \%skipper_info,
    {
        name => 'Mr. Howell',
        hat => 'deep blue',
        shirt => 'beige',
        position=> 'passenger',
        location => 'The Island Country Club.',
    },
    {
        name => 'Mrs. Howell',
        hat => 'pink',
        shirt => 'violet',
        position=> 'passenger',
        location => 'The Island Country Club.',
    },
);

my $format = "%-15s %-7s %-17s %-15s\n"; 
printf $format, qw(Name Shirt Hat Position); 

foreach my $crewmember (@crew) {
	printf $format, 
		$crewmember->{'name'}, 
		$crewmember->{'shirt'}, 
		$crewmember->{'hat'}, 
		$crewmember->{'position'};
}

## location
say;
foreach my $crewmember (@crew) {
    say "$crewmember->{name} at $crewmember->{location}";
}
