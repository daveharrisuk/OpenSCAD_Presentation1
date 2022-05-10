/// @file 4-2Dbasic.scad
/*
 OpenSCAD supports 2D drawings.
  But you cant mix 2D and 3D objects.
*/

$fn = 0;

// this code  will preview...

circle( 10 ); // render fails with this!

// extrude three 2D objects into 3D


// generate a cyclinder

color("green")
  linear_extrude( height=1 )
    circle( 8 );

// generate a twisted pillar

color("blue")
  linear_extrude(height=20, twist=180)
    square( 4, center=true );


color("red")
  translate([2.1, 3.1, 2])
    linear_extrude(height=2 )
      text("May22");
 
 
//---------EoF------- 