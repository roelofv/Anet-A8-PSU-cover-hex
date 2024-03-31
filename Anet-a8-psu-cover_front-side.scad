

include <Hex-Grid.scad>

difference()
{
	// solids
	union()
	{

		// Borders
		// top
		translate([ -18, 73, 0 ])
		{

			cube([ 36, 7, 2 ]);
		}
		// bottom
		translate([ -18, 0, 0 ])
		{

			cube([ 36, 7, 2 ]);
		}
		// side L
		translate([ -25, 0, 0 ])
		{

			cube([ 7, 80, 2 ]);
		}
		// side R

		translate([ 18, 0, 0 ])
		{

			cube([ 5, 80, 2 ]);
		}

	// grid
		translate([ 0, 40, 0.75 ])
		{

			create_grid(size = [ 38, 66, 1.5 ], SW = 10, cellwall = 1.2, wall = 2);
		}
	// nutholder ??





	}
	// holes
	union()
	{
	}
}
