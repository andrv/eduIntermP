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

## set up the subroutines
my %subs;
foreach my $dir (qw(/usr/bin /usr/lib /usr/local)) {
    my ($callback, $getter) = create_find_callbacks_that_sum_the_size();
    $subs{$dir}{CALLBACK}   = $callback;
    $subs{$dir}{GETTER}     = $getter;
}

## gather the data
for my $dir (keys %subs) {
    find($subs{$dir}{CALLBACK}, $dir);
}

## show gathered
for my $dir (keys %subs) {
    my $sum = $subs{$dir}{GETTER}->();
    say "$dir has $sum bytes";
}

__END__

