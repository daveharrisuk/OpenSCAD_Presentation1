///@file 6-boolean.scad
/*
3 boolean operations...
  - union()
     Creates a union of all its
     child nodes. The sum of all.
  - difference()
     Subtracts the second (and all further)
     child nodes from the first child.
  - intersection()
     Creates the intersection of all child 
     nodes. Keeps all overlapping portions.
*/
$fn = 80;

intersection()
{
  color("yellow") sphere( 10.2 );
  
  difference()
  {
    union()
    {
      color("blue")
        cylinder( r = 10.1, h = 11
                , center=true ) ;
      
      color("green")
        cylinder( r = 6, h = 17
                , center=true );
    } // end union
    
    /* cut out a cone */
    cylinder( r1 = 2, r2 = 4, h = 22
             , center=true
    );
    
  } // end difference
} // end intersection

//---------EoF-------
