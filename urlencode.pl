#!/usr/bin/perl
use URI::Escape;
use strict;
 
my $joined_args = join(' ', @ARGV);
my $escaped_uri = uri_escape($joined_args);
 
print "$escaped_uri\n"; 
