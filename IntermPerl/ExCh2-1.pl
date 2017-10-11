#!/usr/bin/perl

use strict;
use warnings;

use 5.014;

use Cwd;
use File::Spec;

say '';

my $cwd = getcwd;
#say "cwd: $cwd<";

my @cwdpath = File::Spec->splitdir($cwd);
#say "cwdpath: @cwdpath<";

opendir(my $dh, $cwd) or die "Can not open $cwd: $!";
while (readdir $dh) {
#    say
    my $fileFullPath = File::Spec->catfile(@cwdpath, $_);
    say "    $fileFullPath";
}

close $dh;

__END__
