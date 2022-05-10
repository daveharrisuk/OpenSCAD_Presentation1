///@file 2cyclinder.scad
/*
  Special variables control the number
   of facets used to generate an arc.

  $fa minimum fragment angle, default 12.
  $fs fragment size, default 2.
  $fn number of fragments. default 0.
*/
$fa = 12;
$fs = 2;
$fn = 0; // try different values here...


color("blue")
  cylinder( h=2, r=4 );

// # makes preview of object transparent

#cylinder( h=2, r=6, center=true );

// a cone

cylinder( h=6, r1=3, r2=1, center=true );


#cylinder( h=9, r1=1, r2=2, center=true);


//# sphere( r = 9, $fn=80 );
        // uses an embedded $fn

// see also polyhedron()...


//---------EoF-------