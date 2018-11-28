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

sub professor_greets {
    my $person = shift;
    say "Professor: By my calculations, you must be $person!";
}

skipper_greets("Gilligan");
gilligan_greets("Skipper");
professor_greets('Gilligan');
professor_greets('Skipper');
skipper_greets('Professor');
gilligan_greets('Professor');

__END__

