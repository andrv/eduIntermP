#!/usr/bin/perl
use strict;
use warnings;

use 5.014;
use Data::Dumper;

my %greets = (
    Skipper => sub {
        my $person = shift;
        say "Skipper: Hey there, $person!";
    },
    Gilligan => sub {
        my $person = shift;
        if ($person eq 'Skipper') {
            say "Gilligan: Sir, yes, sir, $person!";
        }
        else {
            say "Gilligan: Hi, $person!";
        }
    },
    Professor => sub {
        my $person = shift;
        say "Professor: By my calculation, you must be $person!";
    },
    Ginger => sub {
        my $person = shift;
        say "Ginger: (in sultry voice) Well hello, $person!";
    },
);

my @room; # initially empty
for my $person (qw(Gilligan Skipper Professor Ginger)) {
    say '';
    say "$person walks into the room";
    for my $room_person (@room) {
        $greets{$person}->($room_person); # speaks
        $greets{$room_person}->($person); # gets reply
    }
    push @room, $person; # come in, get comfy
}

__END__

