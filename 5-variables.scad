///@file 5-variables.scad
/*
 Variables are more like constants.
 A variable assigned a value twice, only
 last assigned value is used in code.
 v = v +1; // is invalid
*/

string = "Dave wos ere";
range = [ -1 : 2 : 5 ]; //start-1, step+2, <=5
vector = [ 1, 2, 3 ];   // x=1, y=2, z=4
logic = true;   // bool - true/false
flag = undef;   // Unspecial value Un-Defined
height = 10;

 // echo() is debug tool, ouput to console
echo("string", string);
echo("range", range);   // -1: step2 : 5
echo("vector", vector); // 1, 2, 3
echo("logic", logic);   // true or false
echo("flag", flag );    // is undef
echo("height", height ); // number

radius = 1; // Its replaced when run
echo("radius not 1, is", radius );

// overwrite radius with calculation
radius = height / 4;    /* 10/4 = 2.5 */

echo("radius", radius, "h", height );

translate( vector )
{
  cylinder( h = height, r = radius );
  
  innerScope = 10;
  echo("innerScope", innerScope); // is ok
}
/* Variables have scope. When defined in a 
  block, it cant be seen outside of block. */
echo("innerScope", innerScope); // unknown

//---------EoF-------