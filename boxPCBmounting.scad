///@file boxPCBmounting.scad
/*
An open box with...
- 4 PCB mounting pillars (see param pcb)
- 4 or 6 lid mountings (see param pillar6)
- lid screw holes
- param lid=true give the lid
 
NOT included on Render...
- The PCB (but see var pcb)
- screw indicators

© Dave Harris 2022
    
  Add file to project folder and... 
    use<boxPCBmounting.scad>;
*/


boxPCBmounting( // Local test
      lid = false
    , name ="LocalTest"
    , screwR = 1.2
  );



module boxPCBmounting(
      name = "TestBox"//name engraved on base
    , nameSize = 5    // font size
    , lid = false     // false=box, true=lid
    , pcb = true      // true adds PCB mounts
    , pillar6 = false // false=4, true=6
    , pillarR = 2.5   // corner radius
    , wall = 1.5  // Thickness, floor is same
    , screwR = 0.6 // screw hole radius
    , pcbH = 17   // include PCB thickness
    , pcbY = 80   // pcb dimensions
    , pcbX = 50   //   pcbY s/b GT pcbX
    , pcbThick = 1.6 // pcb thickness
    , pcbHoleInset = 3 //center from edge
  )
{
  copyright = "©DaveHarris'22";
  copyrightSize = 3;

  pcbHoleCenY = pcbY -(pcbHoleInset *2);
  pcbHoleCenX = pcbX -(pcbHoleInset *2);

  pcbPillarR = 3.5;
  pcbPillarH = 2.5;

  innerH = lid ? 0 : pcbH +pcbPillarH;
  innerY = pcbY;
  innerX = pcbX +(pillar6 ? 1 : -1);

  cableHoleH = innerH /2;

  dimX = (innerX /2) +pillarR;
  dimY = (innerY /2) +pillarR;

  echo(name,"lid",lid,"pcb",pcb,pcbX,pcbY);
  
  assert( pcbX < pcbY ); // valid check
  assert( pcbX > (pcbThick *3));
  
  $fn = 40;

  difference() // outer
  {
    union()
    {
      difference() // inner
      {
        hull()  // box body
          pillars(
              dimX
            , dimY
            , innerH + wall
            , pillarR
            , six = pillar6
            , z = 0
          );
        
        if( lid == false )
          hull()
            pillars(  // remove inside
                dimX - wall
              , dimY - wall
              , innerH +0.01
              , pillarR
              , z = wall // raise floor
            );
      } // end inner difference
      
      if( lid == false )  
      pillars(   // add lid pillars
          rad = pillarR
        , x = dimX
        , y = dimY
        , h = innerH +wall
        , six = pillar6
        , z = 0
      );

    } // end union

    #pillars(   // cut screw holes
        x = dimX
      , y = dimY 
      , h = innerH +wall +2
      , rad = screwR
      , six = pillar6
      , z = -1 
    );
    
    translate( // engrave name
        [ -dimX /2
        , pcbHoleCenY /2
        , wall ]
    ) linear_extrude( wall /2
          , center=true
      ) text( name, nameSize );
    
    translate( // engrave copyright
        [ -dimX /2
        , -pcbHoleCenY /2
        , wall ]
    ) linear_extrude( wall /2
          , center=true
      ) text(copyright, copyrightSize ); 
      
  } // end outer difference


  if( pcb == true && lid == false)
  { // add PCB
    difference()  // mounting pillar
    {
      pillars(
          x = pcbHoleCenX /2
        , y = pcbHoleCenY /2
        , h = pcbPillarH
        , rad = pcbPillarR
        , z = wall - 0.01 );
      
      // cut screw holes
      #pillars( x = pcbHoleCenX /2
              , y = pcbHoleCenY /2
              , h = pcbPillarH +4
              , rad = screwR
              , z = 0.5 );
        
      // show PCB it wont be rendered.
      %translate(
        [ 0
        , 0
        , pcbPillarH+wall+(pcbThick /2) ]
      ) cube(
           [ pcbX,
             pcbY,
             pcbThick ], center=true
        );
    }
  }


  module pillars( // local scope module()
          x,
          y,
          h,
          rad,
          six = false, // default
          z = 0 )      // default
  {
    // generate screw hole lists
    pillarsX = [-1, 1 ];
    pillarsY = six ? [-1,0,1]:[-1,1];
        // Y has 3 pillar or 2 pillar
  
    for( posX = pillarsX )
      for( posY = pillarsY )
        translate([x*posX, y*posY, z])
          cylinder( h = h, r = rad );
  }

} // end module boxPCBmounting()

//----EoF boxPCBmounting.scad-------
