include <threads-scad/threads.scad> 

$fn = $preview ? 32 : 64;

mirror([1,0,0])
{
	translate([ 0, -40, 0 ])
	{

		difference()
		{
			// solids
			union()
			{

				// Borders
				// bottom
				translate([ -18, 73, 0 ])
				{

					cube([ 36, 7, 2 ]);
				}
				// top

				// color("black")

				    translate([ -18, 0, 0 ])
				{

					cube([ 36, 7, 2 ]);
				    translate([ 18, 0, 0 ])
{
					cylinder(h = 2, d = 7, center = false);
}
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

					translate([ 5, 16.1, 0 ])
					{
						cube([ 2, 15.8, 2 ]);
					}
					translate([ 5, 48.1, 0 ])
					{

						cube([ 2, 15.8, 2 ]);
					}
				}

				// nutholder
				translate([ 19, 36.5, 2 ])
				{

					difference()
					{
						union()
						{

							cube(size = [ 4, 7, 3.5 ]);

							translate([ 0, 3.5, 3.5 ])
							{
								rotate([ 0, 90, 0 ])

								{

									cylinder(h = 4, d = 7, center = false);
								}
							}
						}

						translate([ 2, 3.5, 3.5 ])
						{
							rotate([ 0, 90, 0 ])
							{
								cylinder(h = 6, d = 3.2, center = true);
							}
						}
					}
				}

				// nutholder 2
				translate([ -25, 50, 2 ])
				{

					difference()
					{
						union()
						{

							cube(size = [ 4, 7, 3.5 ]);

							translate([ 0, 3.5, 3.5 ])
							{
								rotate([ 0, 90, 0 ])

								{

									cylinder(h = 4, d = 7, center = false);
								}
							}
						}

						translate([ 2, 3.5, 3.5 ])
						{
							rotate([ 0, 90, 0 ])
							{
								cylinder(h = 6, d = 3.2, center = true);
							}
						}
					}
				}
			}
			// holes
			union()
			{
				// Nut
				translate([ -22, 53.5, 5.5 ])
				{
					rotate([ 0, 90, 0 ])
					{
						color("blue")
						{
							MetricNut(3, thickness = 2);
						}
					}
				}
				// Nut
				translate([ 18, 40, 5.5 ])
				{
					rotate([ 0, 90, 0 ])
					{
						color("blue")
						{
							MetricNut(3, thickness = 2);
						}
					}
				}

				translate([ 0, 40, 2 ])
				{

					cube([ 37, 67, 3 ], center = true);
				}

				translate([ 0, 0, 0 ])
				{
					rotate([ 0, 0, 0 ])
					{
						cylinder(h = 6, d = 3.2, center = true);
					}
				}
			}
		} // end Diff
	}



}

