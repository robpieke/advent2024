#!/usr/bin/env perl

use strict;
use warnings;

my $safe = 0;

open my $input, "input.txt";
while (my $line = <$input>) {
    $line =~ s/\R//g;
    my @nums = split ' ', $line;
    my @snums = sort { $a <=> $b } @nums;
    my @rsnums = sort { $b <=> $a } @nums;
    if ((join ' ', @snums) ne $line and (join ' ', @rsnums) ne $line) {
        next;
    }
    my $prev = $snums[0] - 1;
    my $ok = 1;
    for my $el (@snums) {
        if (($el == $prev) or ($el - $prev > 3)) {
            $ok = 0;
            last;
        }
        $prev = $el;
    }
    if ($ok) {
        $safe += 1;
    }
}
close $input;

print("${safe}\n");
