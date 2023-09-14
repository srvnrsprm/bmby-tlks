#!/usr/bin/perl -w
use 5.010;
use CGI;
use Image::Magick;
use constant FONTS_DIR => "/usr/share/fonts/truetype/lohit-tamil";

my $q = new CGI;
my $font = "Lohit-Tamil";
my $size = 40;
my $string = 'Bombay Talkies';
my $color = 'black';
$font =~ s/\W//g;
my $image = new Image::Magick( size => '500x100' );
$image->Read( 'xc:orangered' );
#$image->Annotate( font => "\@@{[ FONTS_DIR ]}/$font.ttf",
$image->Annotate( font => "/usr/share/fonts/truetype/liberation/LiberationMono-BoldItalic.ttf",
  pen => "white",
  pointsize => $size,
  gravity => North,
  text => $string );
$image->Blur( 100 );
$image->Roll( "+5+5" );
$image->Annotate( font => "/usr/share/fonts/truetype/liberation/LiberationMono-BoldItalic.ttf",
  pen => "white",
  pointsize => 20,
  gravity => SouthEast,
  text => "Market's the most favored suppliers" );

#$image->Annotate( font => "\@@{[ FONTS_DIR ]}/$font.ttf",
#$image->Annotate( font => "/usr/share/fonts/truetype/liberation/LiberationMono-BoldItalic.ttf",
#  pen => $color,
#  pointsize => $size,
#  gravity => 'Center',
#  text => $string );
print $q->header( "image/jpeg" );
binmode STDOUT;
$image->Write( "jpeg:-" );
