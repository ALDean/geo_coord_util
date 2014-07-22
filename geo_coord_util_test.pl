require "geo_coord_util.pl";

sub normalize_longitude_test {
# Unit Test for geo_coord_util:normalize_longitude( longitude ) ;
	my %test_cases;
	$test_cases{190} = -170;
	$test_cases{-210} = 150;
	$test_cases{720} = 0;
	$test_cases{-750} = -30;
	$test_cases{-890} = -170;
	$test_cases{920} = -160;

	$test_cases{85} = 85;
	$test_cases{0} = 0;
	$test_cases{-50.55} = -50.55;
	$test_cases{-180} = -180.0;
	$test_cases{180} = 180.0;

	my $passed = 1;
	foreach $case ( keys(%test_cases) ) {
		$normalized = &geo_coord_util::normalize_longitude($case);
		if ( $test_cases{$case} != $normalized ) {
			$passed = 0;	
			print STDERR "failed: case $case result: $normalized expected: $test_cases{$case}\n";
		}
	}
	return($passed);
}

if ( &normalize_longitude_test ) {
	print STDERR "normalize_longitude_test: passed!\n";
}
