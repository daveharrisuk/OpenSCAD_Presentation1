///@file 3translate.scad
/*
 translate()
  Translate, moves, its child elements
  along a specified vector.
 It is a prefix statement.
*/

$fa = 12; // try different values...
$fs = 2;
$fn = 50; // $fn is commonly used.

/* $fn=40 renders this in 5 seconds
   $fn=60 renders in 11 seconds
   $fn=100 renders in 33 seconds
   $fn above 100 IS SLOOOOW to render.
*/


translate( [ -2, -1, 3 ] )
  cube([ 1, 1, 6 ], center=true);

/* Use { and } for a block of
   statements
*/

// translate a block of 2 items
translate([ 2, 2, -3 ])
{
  cube([1, 1, 6], center=true); // child2
  #sphere( r=2 );               // child3
};

// translate a union of items
translate([ -2, -1, -4 ])
  union() // an explicit union
  {
    cube([1, 1, 5], center=true);
    #sphere( r=2.4 );
  };

//---------EoF-------