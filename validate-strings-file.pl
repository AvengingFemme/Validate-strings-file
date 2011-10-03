#!/usr/bin/env perl

open(STRINGS_FILE, $ARGV[0]);
@lines = <STRINGS_FILE>;
$linenum = 1;
$errorcount = 0;
$dupecount = 0;
$errorexists = 0;
$blankline = 0;
%hash = ();
foreach $line (@lines) {
	if (!($line =~ m/(\w*?)\s*?=\s*?"[^"]*?"\;/)) {
		$errorexists = 1;
	}
	if ($line =~ m/^\s*?\/\/.*$/ || $line =~ m/^\s*$/) {
		$blankline = 1;
	}

	if($errorexists && !$blankline) {
		print "LINE $linenum-ERROR: $line";
		$errorcount++;
	}
	if (!$blankline) {
		if($hash{$1}) {
			$dupecount++;
			print "LINE $linenum-DUPLICATE:$1 is a duplicate key of LINE $hash{$1}\n";
		}
		else {
			$hash{$1} = $linenum;
		}
	}


	$linenum++;
	$errorexists = 0;
	$blankline = 0;
}
print "$errorcount errors found in strings file.\n$dupecount duplicates found in strings file\n";

