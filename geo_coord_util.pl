#!/usr/bin/perl

package geo_coord_util;

sub normalize_longitude($) {
# normalize_longitude
#   parameter(s): 
#       longitude: in decimal degrees
#   returns: longitude normalized to range +/- 180 degrees
	my ($long) = @_;
	if ( "$long" !~ /^[+-]*\d+\.?\d*$/ ) {
		print STDERR "normalize_longitude: bad number input ($long) \n";
		return(undef);

	}
	my $abs_long = abs($long);
	while ( $abs_long > 180.0 ) {
		$abs_long -= 360.0;
	}
	if ( $long > 0 ) {
		return($abs_long);
	} else {
		return(-$abs_long);
	}
}

sub normalize_longitude_2($) {
# normalize_longitude_2
# This is a refinement of the working algorithm in normalize_longitude
# I'd like to compare the performance of the two...
#   parameter(s): 
#       longitude: in decimal degrees
#   returns: longitude normalized to range +/- 180 degrees
	my ($long) = @_;
	if ( abs($long) > 180 ) {
		return( 180.0-((180.0 - $long)%360.0) );
	} else {
		return($long);
	}
}

1;
