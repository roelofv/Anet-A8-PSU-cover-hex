// import("Anet-A8-Power-Switch-Cover-V2.stl", convexity = 5);
include <NopSCADlib/lib.scad>   // Includes all the vitamins and utilities in NopSCADlib but not the printed parts.
include <BOSL2/std.scad>

// Prism module
module prism(l, w, h)
{
	polyhedron( // pt 0        1        2        3        4        5
	    points = [ [ 0, 0, 0 ], [ l, 0, 0 ], [ l, w, 0 ], [ 0, w, 0 ], [ 0, w, h ], [ l, w, h ] ],
	    faces = [ [ 0, 1, 2, 3 ], [ 5, 4, 3, 2 ], [ 0, 4, 5, 1 ], [ 0, 3, 4 ], [ 5, 2, 1 ] ]);
}

// variables

thickness = 3;




difference()
{

	union()
	{

		// Socket Plate
		translate([ 0, 7, 0 ])
		{

			cube([ 50, 56, thickness ]);
		}
		// Borders
		// top
		translate([ -50, 63, 0 ])
		{

			cube([ 100, 7, thickness ]);
		}
		// bottom
		translate([ -50, 0, 0 ])
		{

			cube([ 100, 7, thickness ]);
		}
		// side L
		translate([ -55, 0, 0 ])
		{

			cube([ 5, 80, thickness ]);

			translate([ -2, 0, 0 ])
			{

				cube([ thickness, 15.9, thickness ]);
			}
			translate([ -2, 31.9, 0 ])
			{

				cube([ thickness, 15.8, thickness ]);
			}
			translate([ -2, 80 - 15.9, 0 ])
			{

				cube([ thickness, 15.9, thickness ]);
			}
		}
		// side R

		translate([ 50, 0, 0 ])
		{

			cube([ 5, 80, thickness ]);
			translate([ 5, 0, 0 ])
			{

				cube([ thickness, 15.9, thickness ]);
			}
			translate([ 5, 31.9, 0 ])
			{

				cube([ thickness, 15.8, thickness ]);
			}
			translate([ 5, 80 - 15.9, 0 ])
			{

				cube([ thickness, 15.9, thickness ]);
			}
		}

		// Triangles
		// left
		translate([ -40, 70, 2 ])
		{
			rotate([ 90, 90, 180 ])
			{
				prism(2, 10, 10);
				translate([ 0, 10, 0 ])
				{
				}
			}
		}
		// right
		translate([ 40, 70, 2 ])
		{
			mirror(v = [ 1, 0, 0 ])
			{

				rotate(a = [ 90, 90, 180 ])
				{
					prism(2, 10, 10);
					translate([ 0, 10, 0 ])
					{
					}
				}
			}
		}
	} // end solids union

	// Holes & cuts
	// onion()
	//{

		translate([ -25, 35, 1 ])
		{
			color("LightBlue")

			    cube([ 51.4, 57.4, thickness ], center = true);
		}

		// Socket + screw holes

		translate([ 25, 35, thickness+0.1 ])
		{
			rotate([ 0, 0, 180 ])
			{
				// Socket
					color("LightBlue")

					scale([1.1,1.1,1.1]){

				iec(IEC_320_C14_switched_fused_inlet);
				// Screw hole
					}

				translate([ 20, 0, -2 ])
				{
					color("LightBlue")
					{
						cylinder(h = 4, d = 3.2, center = true);
					}
				}
				// Screw hole

				translate([ -20, 0, -2 ])
				{
					color("LightBlue")
					{

						cylinder(h = 4, d = 3.2, center = true);
					}
				}
			}
		}


	//} // end holes union
}
