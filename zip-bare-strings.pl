#!/usr/bin/env perl

open(PREFIX_FILE, $ARGV[0]);
open(SUFFIX_FILE, $ARGV[1]);
open(OUTPUT_FILE, '>', $ARGV[2]);

@prefix_lines = <PREFIX_FILE>;
@suffix_lines = <SUFFIX_FILE>;

for my $index (0 .. $#prefix_lines) {
	if ($prefix_lines[$index] =~ m/^\s*?\/\/.*$/ || $prefix_lines[$index] =~ m/^\s*$/) {
		print OUTPUT_FILE $prefix_lines[$index];
	}
	else {
		chomp $prefix_lines[$index];
		chomp $suffix_lines[$index];
		print OUTPUT_FILE $prefix_lines[$index] . $suffix_lines[$index] . "\n";
	}
}

