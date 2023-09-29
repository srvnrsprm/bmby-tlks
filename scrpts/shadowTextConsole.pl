#!/usr/bin/perl -w
use 5.010;
use Image::Magick;

my $size = 40;
my $string = 'Bombay Talkies';
my $color = 'black';
my $image = new Image::Magick( size => '600x100' );
$image->Read( 'xc:orangered' );
$image->Annotate( font => "victoriaTypewriter.ttf",
  pen => "white",
  pointsize => $size,
  gravity => North,
  text => $string );
$image->Blur( 100 );
$image->Roll( "+5+5" );
$image->Annotate( font => "victoriaTypewriter.ttf",
  pen => "white",
  pointsize => 20,
  gravity => SouthEast,
  text => "For amazing experience at affordable rates" );

binmode STDOUT;
$image->Write( "jpeg:-" );
