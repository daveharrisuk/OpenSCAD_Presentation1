///@file 1cube.scad
/* OpenSCAD - demo - Dave Harris - May22
 The Programmers Solid 3D CAD Modeller

 Using  v2021.01 on Ubuntu.
See https://openscad.org/downloads
    https://openscad.org/cheatsheet
Important keyboard keys...
 F5 previews the 3D model code.
 F6 renders model, ready for export.
 F7 exports model to .STL file
Keep an eye on lower panes,
      named Console and Error-Log.
 
OpenSCAD dimensions are in 'unit's,
 the Slicer program, scales units.

Origin is at intersection of 3 axes. */

cube( 3 ); // object 1, size 3 units.

# cube(4);  // object 2, encloses obj 1.
            // # is a debug feature

cube( 5, center=true );    // object 3.

/* A vector is position of a point in
   space. It is expressed as [x, y, z].
   Can also specify an object size    */

color("blue")              // object 4.
  cube( [ 1, 2, 15 ], center=true ); 

/* color() is an OpenSCAD debug feature.
   Colour is not exported to STL file.
   color() statement applies ONLY to
   the statement or block that follows.

 The above 4 objects are in an implicit
  union, that is they form one object.
 A union is explicit when defined by
   a union() block.                  */
//---------EoF-------