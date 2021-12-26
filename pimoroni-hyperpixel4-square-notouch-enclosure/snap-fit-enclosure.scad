/*
 * This work is licensed under the Creative Commons Attribution-ShareAlike
 * 4.0 International License. To view a copy of this license, visit
 * https://creativecommons.org/licenses/by-sa/4.0/.
 */

include <../libraries/BOSL/constants.scad>
use <../libraries/BOSL/metric_screws.scad>
use <../libraries/BOSL/shapes.scad>
use <../libraries/BOSL/transforms.scad>
use <../libraries/BOSL/masks.scad>

/*[ Render settings ]*/

// Quality of rounded corners
$fn = 18;

/*[ 3D-printing tools ]*/

// Split the case up so that it can be printed on 220x220mm printers
split_into_parts = true;

// Split the case by this many mm
split_enclosure_by_mm = 50;

/*[ HyperPixel dimensions ]*/

hyperpixel_width=74.80;
hyperpixel_depth=78.25;
hyperpixel_height=3;
hyperpixel_bottom_pad=5;

/*[ Enclosure parameters ]*/

wall_thickness=4;
enclosure_fillet=2;

// tolerance of fitting around HyperPixel
tolerance = 0.50;

/*
 * ______________________________________________________________
 * ==============================================================
 *  DO NOT EDIT ANYTHING BELOW UNLESS YOU KNOW WHAT YOU'RE DOING
 * ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 */

layer_diff=1*0.01;

panel_size=[
    hyperpixel_width,
    hyperpixel_height
];

enclosure_size=[
    hyperpixel_width+(wall_thickness*2),
    hyperpixel_depth+(wall_thickness*2),
    hyperpixel_height+(wall_thickness*2)
];

cavity_size=[
    hyperpixel_width+(tolerance*2),
    hyperpixel_depth+(tolerance*2),
    hyperpixel_height+(tolerance*2)
];

screen_cutout=[
    hyperpixel_width-wall_thickness,
    hyperpixel_depth-wall_thickness-hyperpixel_bottom_pad,
    wall_thickness+layer_diff
];

module shell() {
    difference()
    {
        // main box
        cuboid(enclosure_size, fillet=enclosure_fillet, edges=EDGES_Z_ALL, center=true);
        cuboid(cavity_size, edges=EDGES_Z_ALL, center=true);
        // screen
        translate([0,hyperpixel_bottom_pad/2,wall_thickness])
            cuboid(screen_cutout, fillet=enclosure_fillet/2, edges=EDGES_Z_ALL, center=true);
    }
}

module enclosure() {
    union() {
        shell();
    }
}

module enclosure_joiners() {
}

module enclosure_separator() {
    translate([0,0,enclosure_size[2]/2]) {
        cube([
            enclosure_size[0]+layer_diff, // width
            enclosure_size[1]+layer_diff, // depth
            enclosure_size[2]+layer_diff // height
        ], center=true);
    }
}

module generate_parts() {
    joiner_slop=0.4;
    difference() {
        enclosure();
        enclosure_separator();
    }

    translate([0,0,split_enclosure_by_mm])
    intersection() {
        shell();
        enclosure_separator();
    }

    enclosure_joiners();
}

if (split_into_parts==true) {
    generate_parts();
} else {
    enclosure();
}
