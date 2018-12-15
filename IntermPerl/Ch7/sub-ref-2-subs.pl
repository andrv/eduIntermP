#!/usr/bin/perl
use strict;
use warnings;

use 5.014;
use Data::Dumper;

use File::Find;

sub create_find_callbacks_that_sum_the_size {
    my $total_size = 0;

    return(sub { $total_size += -s if -f }, sub { return $total_size });
}

my ($count_em, $get_results) = create_find_callbacks_that_sum_the_size();
my $start_dir = '/opt/bin';

find($count_em, $start_dir);
my $total_size = &$get_results();

say "total size of $start_dir is $total_size";

__END__

