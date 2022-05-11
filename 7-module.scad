///@file 7-module.scad
/*
 module() is equivalent to a
   subroutine but has no return value.
   
 Libraries...
   include<x.scad>; // 'includes' everything.
   use<x.scad>; // 'includes' modules only.
*/

use <boxPCBmounting.scad>;


difference()
{
  boxPCBmounting(
        lid = false
      , name ="CANMIO"
      , pcbX = 50
      , pcbY = 80
      , pcbH = 17
      , screwR = 0.8
  );
  
  translate( // cut cable hole
      [ -17
      , - 50
      , 5  ]
  ) cube(
      [ 35
      , 100
      , 9  ], center=false 
    );  
}


//-------EoF 7-module.scad----------
