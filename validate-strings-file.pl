#!/usr/bin/env perl

open(STRINGS_FILE, $ARGV[0]);
@lines = <STRINGS_FILE>;
$linenum = 1;
$errorcount = 0;
foreach $line (@lines) {
	if (!($line =~ m/\w*?\s*?=\s*?"[^"]*?"\;/ || $line =~ m/^\s*?\/\/.*$/ || $line =~ m/^\s*$/)) {
		print "$linenum: $line";
		$errorcount++;
	}
	$linenum++;
}
print "$errorcount errors found in strings file.\n"

