/*     _   __                           __  __  ___      __
 *    / | / /___ ______________  ____  / /_/  |/  /___ _/ /_____  _____
 *   /  |/ / __ `/ ___/ ___/ _ \/ __ \/ __/ /|_/ / __ `/ //_/ _ \/ ___/
 *  / /|  / /_/ (__  ) /__/  __/ / / / /_/ /  / / /_/ / ,< /  __/ /
 * /_/ |_/\__,_/____/\___/\___/_/ /_/\__/_/  /_/\__,_/_/|_|\___/_/
 *
 * This work is licensed under the Creative Commons Attribution-ShareAlike
 * 4.0 International License. To view a copy of this license, visit
 * https://creativecommons.org/licenses/by-sa/4.0/.
 */

/*                __             _
 *  ______ _____ / /____  __ _  (_)__ ___ ____
 * / __/ // (_-</ __/ _ \/  ' \/ /_ // -_) __/
 * \__/\_,_/___/\__/\___/_/_/_/_//__/\__/_/
 */

/* [Customizable Switch Plate] */

// Plate size in mm, X and Y, defaults to the size of the Adafruit Macropad RS2040
plate_size = [78.6, 59.7];
// Plate thickness in mm
plate_thickness = 1.5;
// Switch size, defaults to 14,14 for MX-compat
switch_size = [14,14];
// Gap between switches in the plate
switch_gap = 5; // [1:10]
// Number of button columns
colunms = 3; // [1:10]
// Number of button rows
rows = 4; // [1:10]

/*    __       __        __   __  __  __                     __
 *   / /  ___ / /  ___  / /__/ / / /_/ /  ___   _______  ___/ /__
 *  / _ \/ -_) _ \/ _ \/ / _  / / __/ _ \/ -_) / __/ _ \/ _  / -_)
 * /_.__/\__/_//_/\___/_/\_,_/  \__/_//_/\__/  \__/\___/\_,_/\__/
 */

/* [Hidden] */

include <../libraries/BOSL/constants.scad>
use <../libraries/BOSL/shapes.scad>
use <../libraries/BOSL/transforms.scad>
use <../libraries/BOSL/math.scad>

difference()
{
    cuboid(size=flatten([plate_size, [plate_thickness]]), fillet=2.5, edges=EDGES_Z_ALL, $fn=24);
    grid2d(size=[plate_size[0]-20,plate_size[1]-20],
            spacing=switch_size[0]+switch_gap, cols=colunms, rows=rows, stagger=false)
        cuboid(size=flatten([switch_size, [plate_thickness+0.1]]));
}
