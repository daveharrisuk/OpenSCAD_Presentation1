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
$fn = 40;

intersection()
{
  sphere( r = 10 ); // round off the ends
  
  difference()
  {
    union()
    {    // sum 1st and 2nd children
      color("blue") 
        cylinder( r=5, h=20, center=true);
      
      rotate( [0, 135, -45] )
        cylinder(r=2, h=25, center=true);
    } // end union
    
    // cut-out the next 2 children
  
    rotate( [0, 45, -45] )
      cylinder( r=2, h=25, center=true);
    
    translate( [0, 0, -10] )
      rotate( [0, 45, -45] )
        cylinder( r=1, h=20, center=true); 
  } // end difference
  
} // end intersection

//---------EoF-------