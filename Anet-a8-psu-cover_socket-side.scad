// import("Anet-A8-Power-Switch-Cover-V2.stl", convexity = 5);
include <NopSCADlib/lib.scad>   // Includes all the vitamins and utilities in NopSCADlib but not the printed parts.


// Prism module
module prism(l, w, h)
{
	polyhedron( // pt 0        1        2        3        4        5
	    points = [ [ 0, 0, 0 ], [ l, 0, 0 ], [ l, w, 0 ], [ 0, w, 0 ], [ 0, w, h ], [ l, w, h ] ],
	    faces = [ [ 0, 1, 2, 3 ], [ 5, 4, 3, 2 ], [ 0, 4, 5, 1 ], [ 0, 3, 4 ], [ 5, 2, 1 ] ]);
}


include <Hex-Grid.scad>
////////////////////////////////////////////////////////////////////
// cell: takes three parameters and returns a single hexagonal cell
//
//   SW_hole: scalar value that specifies the width across the flats
//     of the interior hexagon
//   height: scalar value that specifies the height/depth of the
//     cell (i.e. distance from from front to back
//   wall: scalar vale that specifies the thickness of the wall
//     surrounding the interior hex (hole). e.g. if SW_hole is 8
//     and wall is 2 then the total width across the flats of the
//     cell is 8 + 2(2) = 12.
////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////
// Example
// To use call create_grid with
//   size: (x,y,z)
//   SW: (width across the flats of the hex
//   wall: (thickness of wall
////////////////////////////////////////////////////////////////////

translate([ -25, 35, 0.75 ])
{

	create_grid(size = [ 50, 56, 1.5 ], SW = 10, cellwall = 1.2, wall = 2);
}

difference()
{

	union()
	{

		// Socket Plate
		translate([ 0, 7, 0 ])
		{

			cube([ 50, 56, 2 ]);
		}
		// Borders
		// top
		translate([ -50, 63, 0 ])
		{

			cube([ 100, 7, 2 ]);
		}
		// bottom
		translate([ -50, 0, 0 ])
		{

			cube([ 100, 7, 2 ]);
		}
		// side L
		translate([ -57, 0, 0 ])
		{

			cube([ 7, 80, 2 ]);
		}
		// side R

		translate([ 50, 0, 0 ])
		{

			cube([ 7, 80, 2 ]);
		}

		// Triangles
		// left
		translate([ -40, 70, 1.5 ])
		{
			rotate([ 90, 90, 180 ])
			{
				prism(1.5, 10, 10);
				translate([ 0, 10, 0 ])
				{
				}
			}
		}
		// right
		translate([ 40, 70, 1.5 ])
		{
			mirror(v = [ 1, 0, 0 ])
			{

				rotate(a = [ 90, 90, 180 ])
				{
					prism(1.5, 10, 10);
					translate([ 0, 10, 0 ])
					{
					}
				}
			}
		}
	} // end solids union

		// Holes & cuts
	onion()
	{

		// Socket + screw holes

		translate([ 25, 35, 2.1 ])
		{
			rotate([ 0, 0, 180 ])
			{
				// Socket

				iec(IEC_320_C14_switched_fused_inlet);
				// Screw hole
				translate([ 20, 0, -1 ])
				{
					color("LightBlue")
					{
						cylinder(h = 4, d = 3.2, center = true);
					}
				}
				// Screw hole

				translate([ -20, 0, -1 ])
				{
					color("LightBlue")
					{

						cylinder(h = 4, d = 3.2, center = true);
					}
				}
			}
		}
// left
  translate([-52.5, 40 , 1]){
					{
						cylinder(h = 4, d = 3.2, center = true);
					}
 }
// right
  translate([52.5, 40 , 1]){
					{
						cylinder(h = 4, d = 3.2, center = true);
					}
 }





	} // end holes union
}
