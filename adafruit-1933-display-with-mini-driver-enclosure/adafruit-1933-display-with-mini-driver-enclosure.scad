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

/* [Customizable Display Enclosure] */

// Module size in mm, W and H, defaults to the size of the Innolux AT070TN94
module_size = [164.9, 100.0];
// Module depth in mm
module_thickness = 5.7;
// Display active area in mm, W and H
display_active_area_size = [154.08, 85.92];
// Enclosure tolerance in mm
enclosure_tolerance = 1.0; // [0.5, 0.75, 1, 1.25, 1.50, 1.75, 2]
// Enclosure wall depth
enclosure_wall_depth = 5.0;

/*    __       __        __   __  __  __                     __
 *   / /  ___ / /  ___  / /__/ / / /_/ /  ___   _______  ___/ /__
 *  / _ \/ -_) _ \/ _ \/ / _  / / __/ _ \/ -_) / __/ _ \/ _  / -_)
 * /_.__/\__/_//_/\___/_/\_,_/  \__/_//_/\__/  \__/\___/\_,_/\__/
 */

/* [Hidden] */

include <../libraries/BOSL/constants.scad>
use <../libraries/BOSL/shapes.scad>
use <../libraries/BOSL/masks.scad>
use <../libraries/BOSL/transforms.scad>
use <../libraries/BOSL/math.scad>

m_pad = enclosure_tolerance * 2;
e_pad = enclosure_tolerance + enclosure_wall_depth;
extern_size = [module_size[0]+(e_pad*2), module_size[1]+(e_pad*2), module_thickness+(e_pad*2)];

module display_aperture() {
    n_size=[display_active_area_size[0]+m_pad, display_active_area_size[1]+m_pad, module_thickness+m_pad];
    difference() {
        cuboid(size=n_size, fillet=0.75, edges=EDGES_Z_ALL, center=false, $fn=24);
        right(n_size[0]/2) xspread(n_size[0]) #chamfer_mask(l=n_size[1], chamfer=e_pad, orient=ORIENT_Y, center=false);
        back(n_size[1]/2) yspread(n_size[1]) #chamfer_mask(l=n_size[0], chamfer=e_pad, orient=ORIENT_X, center=false);
    }
}

module enclosure() {
    difference() {
        cuboid(size=extern_size, fillet=2.5, edges=EDGES_Z_ALL, center=false, $fn=24);
        translate([e_pad, e_pad, e_pad]) {
            cuboid(size=[module_size[0]+m_pad, module_size[1]+m_pad, module_thickness+m_pad], fillet=0.75, edges=EDGES_Z_ALL, center=false, $fn=24);
            translate([0, e_pad, module_thickness+0.01]) {
                display_aperture();
            }
        }
    }
}

module enclosure_separator() {
    translate([0, 0, extern_size[2]/2]) {
        cuboid(size=[extern_size[0]+0.01, extern_size[1]+0.01, (extern_size[2]/2)+0.01], center=false);
    }
}

module generate_parts() {
    if ($preview==true) {
        enclosure();
    } else {
        difference() {
            enclosure();
            enclosure_separator();
        }

        translate([0, 0, 30]) {
            intersection() {
                enclosure();
                enclosure_separator();
            }
        }
    }
}

generate_parts();

if ($preview==true) {
    translate([e_pad, e_pad, 0]) {
        color("green", 0.15)
        cuboid(size=concat(module_size, module_thickness), $fn=24, center=false);
    }
}
