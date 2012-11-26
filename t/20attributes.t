#!/usr/bin/perl -w
use strict;

use Test::More tests => 41;
use CPAN::Testers::Data::Uploads;

use lib 't';
use CTDU_Testing;

ok( my $obj = CTDU_Testing::getObj(), "got object" );

# test the attributes generated by Class::Accessor::Chained::Fast

# predefined attributes
foreach my $k ( qw/
    uploads
    cpan
    logfile
    logclean
    lastfile
    mupdate
/ ){
  my $label = "[$k]";
  SKIP: {
    ok( $obj->can($k), "$label can" )
	or skip "'$k' attribute missing", 3;
    isnt( $obj->$k(), undef, "$label has default" );
    is( $obj->$k(123), 123, "$label set" ); # chained, so returns object, not value.
    is( $obj->$k, 123, "$label get" );
  };
}

# undefined attributes
foreach my $k ( qw/
    backpan
    mgenerate
    mbackup
    mreindex
/ ){
  my $label = "[$k]";
  SKIP: {
    ok( $obj->can($k), "$label can" )
	or skip "'$k' attribute missing", 3;
    is( $obj->$k(), undef, "$label has no default" );
    is( $obj->$k(123), 123, "$label set" ); # chained, so returns object, not value.
    is( $obj->$k, 123, "$label get" );
  };
}

# TODO -- test these:
#	$MAX_ID;

