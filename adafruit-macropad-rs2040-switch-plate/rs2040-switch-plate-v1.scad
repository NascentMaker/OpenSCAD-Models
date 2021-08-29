include <BOSL/constants.scad>
use <BOSL/metric_screws.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>
use <BOSL/math.scad>

/* [Customizable Switch Plate] */

// Plate size in mm, X and Y, defaults to the size of the Adafruit Macropad RS2040
plate_size = [78.6,59.7];
// Plate thickness in mm
plate_thickness = 1.5;
// Switch size, defaults to 14,14 for MX-compat
switch_size = [14,14];
// Gap between switches in the plate
switch_gap = 5;
// Number of button columns
colunms = 3;
// Number of button rows
rows = 4;

difference()
{
    cuboid(size=flatten([plate_size, [plate_thickness]]), fillet=2.5, edges=EDGES_Z_ALL, $fn=24);
    grid2d(size=[plate_size[0]-20,plate_size[1]-20],
            spacing=switch_size[0]+switch_gap, cols=colunms, rows=rows, stagger=false)
        cuboid(size=flatten([switch_size, [plate_thickness+0.1]]));
}
