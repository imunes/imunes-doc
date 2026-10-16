#!/usr/bin/env perl
use strict;
use warnings;

sub expand_includes {
    my ($file, $seen) = @_;

    die "Circular include: $file\n" if $seen->{$file};

    $seen->{$file} = 1;

    open my $fh, "<", $file
        or die "Cannot open $file: $!";

    local $/;
    my $content = <$fh>;
    close $fh;

    $content =~ s!\{\{include:([^}]+)\}\}!
        expand_includes($1, $seen)!gex;

    delete $seen->{$file};

    return $content;
}

for my $file (@ARGV) {
    print expand_includes($file, {});
    print "\n";
}
