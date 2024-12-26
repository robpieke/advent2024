#!/usr/bin/env perl

use strict;
use warnings;

my $safe = 0;

open my $input, "input.txt";
while (my $line = <$input>) {
    $line =~ s/\R//g;
    my @nums = split ' ', $line;
    for (-1 .. $#nums) {
        my @lnums = @nums;
        if ($_ >= 0) {
            splice @lnums, $_, 1;
        }
        my @snums = sort { $a <=> $b } @lnums;
        my @rsnums = sort { $b <=> $a } @lnums;
        my $lline = join ' ', @lnums;
        if ((join ' ', @snums) ne $lline and (join ' ', @rsnums) ne $lline) {
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
            last;
        }
    }
}
close $input;

print("${safe}\n");
