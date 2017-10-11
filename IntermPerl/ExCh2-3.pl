#!/usr/bin/perl

use strict;
use warnings;

use 5.014;

use Data::Dumper;

use Business::ISBN;

my $isbn13 = Business::ISBN->new('9781449393090');

#print Dumper $isbn13;
#say $isbn13->as_string;

say 'group code: ', $isbn13->group_code;
say 'publisher code: ', $isbn13->publisher_code;
__END__
