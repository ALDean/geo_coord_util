package geo_coord_util;
sub normalize_longitude($) {
# normalize_longitude
#   parameter(s): 
#       longitude: in decimal degrees
#   returns: longitude normalized to range +/- 180 degrees
	my ($long) = @_;
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

1;
