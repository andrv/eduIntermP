#!/usr/bin/perl
use strict;
use warnings;

use 5.014;
use Data::Dumper;

sub skipper_greets {
    my $person = shift;
    say "Skipper: Hey there, $person";
}

sub gilligan_greets {
    my $person = shift;

    if ($person eq "Skipper") {
        say "Gilligan: Sir, yes, sir, $person!";
    }
    else {
        say "Gilligan: Hi, $person!";
    }
}

skipper_greets("Gilligan");
gilligan_greets("Skipper");

__END__

