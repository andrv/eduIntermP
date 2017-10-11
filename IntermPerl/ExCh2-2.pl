#!/usr/bin/env perl 

use strict;
use warnings;

use 5.014;

use Module::CoreList;

use Data::Dumper;

#print Dumper(Module::CoreList->find_version(5.014002));
my $Modules = Module::CoreList->find_version(5.014002);

foreach my $module(keys %$Modules) {
    say "$module: ", Module::CoreList->first_release_by_date($module);
}
__END__
