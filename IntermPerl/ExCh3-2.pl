#!/usr/bin/perl

use strict;
use warnings;

use 5.014;

use Data::Dumper;

my $dir = '/etc';
my $intro = 'Please enter search pattern';

say "$intro:";

while ((my $regexp = <STDIN>) ne "\n") {
    chomp $regexp;
    my $compiled = eval {qr/$regexp/};
    unless ($@) {
        opendir(my $dh, $dir) or die "Can not open $dir $!";
        my @content;
        push @content, $_ while readdir $dh;
        close $dh;
#        say "the input is: ", $regexp;
#        say "compiled regexp is: $compiled";
        my @result = grep /$compiled/, @content;
        say "@result";
        say "$intro:";
    }
    else {
        say "Something is wrong with pattern: $@";
        say "$intro again:";
        next;
    }
}

say "Done";

__END__
