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
$fn=18;

/*[ 3D-printing tools ]*/

// Split the case up so that it can snap together
split_into_parts=true;

// Split the case by this many mm
split_enclosure_by_mm=50;

/*[ HyperPixel dimensions ]*/

// width of HyperPixel4 PCB and screen
hyperpixel_width=74.25;

// depth of the HyperPixel4 PCB and screen
hyperpixel_depth=78.25;

// height of the HyperPixel4 PCB and screen
hyperpixel_height=3;

// depth of the bottom screen cover
hyperpixel_bottom_pad=5;

// width of 40-pin header
hyperpixel_header_width=56;

// depth of 40-pin header
hyperpixel_header_depth=5.40;

// height of 40-pin header
hyperpixel_header_height=9;

// header offset depth
hyperpixel_header_y_offset=7;

// GPIO module width
gpio_width=8;

// GPIO module depth
gpio_depth=12.70;

// GPIO module height off of the PCB
gpio_height=4.10;

/*[ Enclosure parameters ]*/

// overall wall thickness
wall_thickness=4;

// top and bottom plate thickness
plate_thickness=1.16;

// round corners
enclosure_fillet=2;

// how long are the snap joint tabs
snap_joint_width=5;

// tolerance of fitting around HyperPixel
tolerance=0.50;

/*[ Preview Settings ]*/

// hide or show the case parts
show_case_parts=true;

// hide or show the hyperpixel preview
show_hyperpixel_preview=false;

/*
 * ______________________________________________________________
 * ==============================================================
 *  DO NOT EDIT ANYTHING BELOW UNLESS YOU KNOW WHAT YOU'RE DOING
 * ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 */

layer_diff=1*0.01;

gpio_y_offset=(43.25-gpio_depth+(gpio_depth/2))-(hyperpixel_depth/2);

hyperpixel_size=[
    hyperpixel_width,
    hyperpixel_depth,
    hyperpixel_height
];

gpio_size=[
    gpio_width,
    gpio_depth,
    gpio_height
];

gpio_cutout_size=[
    gpio_size.x+(tolerance*2),
    gpio_size.y+(tolerance*2),
    gpio_size.z+(tolerance*2)
];

enclosure_size=[
    hyperpixel_size.x+(wall_thickness*2),
    hyperpixel_size.y+(wall_thickness*2),
    hyperpixel_size.z+gpio_size.z+(tolerance*2)+(plate_thickness*2)
];

cavity_size=[
    hyperpixel_size.x+(tolerance*2),
    hyperpixel_size.y+(tolerance*2),
    hyperpixel_size.z+gpio_size.z+(tolerance*2)
];

screen_cutout_size=[
    hyperpixel_size.x-wall_thickness,
    hyperpixel_size.y-wall_thickness-hyperpixel_bottom_pad,
    cavity_size.z+layer_diff
];

hyperpixel_header_size=[
    hyperpixel_header_width+(tolerance*2),
    hyperpixel_header_depth+(tolerance*2),
    hyperpixel_header_height+(tolerance*2)
];

module snap_lip(size, edge) {
    size_outer=[
        size.x,
        size.y,
        size.z
    ];
    size_inner=[
        size.x-wall_thickness,
        size.y-wall_thickness,
        size.z
    ];
    if (edge=="outer") {
        difference() {
            cuboid([size_outer.x+layer_diff, size_outer.y+layer_diff, size_outer.z/2], fillet=enclosure_fillet, edges=EDGES_Z_ALL, center=true);
            cuboid([size_inner.x, size_inner.y, (size_inner.z/2)+(layer_diff*2)], fillet=enclosure_fillet/1.50, edges=EDGES_Z_ALL, center=true);
        }
    } else if (edge=="inner") {
        difference() {
            cuboid([size_inner.x+layer_diff, size_inner.y+layer_diff, size_inner.z/2], fillet=enclosure_fillet/2, edges=EDGES_Z_ALL, center=true);
            cuboid([size_inner.x-(wall_thickness), size_inner.y-(wall_thickness), (size_inner.z/2)+(layer_diff*2)], fillet=enclosure_fillet/2.5, edges=EDGES_Z_ALL, center=true);
        }
    }
}

module hyperpixel_header() {
    translate([
        -5,
        (cavity_size.y/2)-hyperpixel_header_y_offset,
        -(cavity_size.z/2)
    ]) {
        cuboid(hyperpixel_header_size, center=true);
    }
}

module hyperpixel_standoffs() {
    translate([0, -4, -(((cavity_size.z-gpio_size.z)/2)-layer_diff)]) {
        yspread(l=49, n=2) {
            xspread(l=58, n=2) {
                cyl(l=gpio_size.z+(layer_diff*2), d=3+(tolerance*2), center=true);
            }
        }
    }
}

module hyperpixel_mount_towers() {
    translate([-5, 8.12, -((cavity_size.z/2)-layer_diff)]) {
        yspread(l=49, n=2) {
            xspread(l=58, n=2) {
                downcyl(l=plate_thickness+(layer_diff*2), d=5.40+(tolerance*2));
            }
        }
    }
}

module enclosure_snap_lip(position="top", edge="outer") {
    snap_lip(enclosure_size, edge);
}

module snap_joint_hole() {
    right(tolerance-layer_diff) {
        cube([
            (wall_thickness/4)+layer_diff,
            snap_joint_width+layer_diff,
            (enclosure_size.z/8)+layer_diff
        ], center=true);
    }
}

module snap_joint_tab() {
    right(-(tolerance/4)) {
        difference() {
            cuboid([
                (wall_thickness/4)-(tolerance/4)+layer_diff,
                snap_joint_width-(tolerance/2),
                (enclosure_size.z/8)-(tolerance)
            ], center=true);
            right(0.25) {
                mirror([1, 0, 1]) {
                    right_triangle([
                        (wall_thickness/4)-(tolerance/4)+layer_diff,
                        snap_joint_width-(tolerance/2)+layer_diff,
                        (enclosure_size.z/8)-(tolerance/4)+layer_diff
                    ], center=true);
                }
            }
        }
    }
}

module snap_joints_y_spread(type="tab") {
    yspread(l=hyperpixel_depth-(wall_thickness*2), n=3) {
        if (type=="tab") {
            snap_joint_tab();
        } else if (type=="hole") {
            translate([0, 0, (cavity_size.z/2)-((enclosure_size.z/8)+layer_diff)]) {
                snap_joint_hole();
            }
        }
    }
}

module snap_joints_y(type="tab") {
    translate([(enclosure_size.x/2)-(wall_thickness/2), 0, -(cavity_size.z/6)]) {
        snap_joints_y_spread(type);
    }
    translate([-((enclosure_size.x/2)-(wall_thickness/2)), 0, -(cavity_size.z/6)]) {
        mirror([1, 0, 0]) {
            snap_joints_y_spread(type);
        }
    }
}

module snap_joints(type="tab") {
    if (type=="tab") {
        snap_joints_y(type);
    } else if (type=="hole") {
        snap_joints_y(type);
    }
}

module gpio_module(size) {
    translate([
        -((hyperpixel_size.x-gpio_size.x)/2)+2.9,
        gpio_y_offset,
        -(hyperpixel_size.z/2)
    ]) {
        cube(size, center=true);
    }
}

module hyperpixel_module(size) {
    up(gpio_size.z/2)
        cube(size, center=true);
}

module shell() {
    difference() {
        // main box
        cuboid(enclosure_size, fillet=enclosure_fillet, edges=EDGES_Z_ALL, center=true);
        cuboid(cavity_size, edges=EDGES_Z_ALL, center=true);
        hyperpixel_mount_towers();
        hyperpixel_header();
        // screen
        translate([0, hyperpixel_bottom_pad/2, plate_thickness*2])
            cuboid(screen_cutout_size, fillet=enclosure_fillet/2, edges=EDGES_Z_ALL, center=true);
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
    translate([0, 0, enclosure_size.z/2]) {
        cube([
            enclosure_size.x+layer_diff, // width
            enclosure_size.y+layer_diff, // depth
            enclosure_size.z+layer_diff // height
        ], center=true);
    }
}

module generate_parts() {
    joiner_slop=0.4;
    difference() {
        enclosure();
        enclosure_snap_lip(position="top", edge="outer");
        enclosure_separator();
    }
    hyperpixel_standoffs();
    snap_joints(type="tab");

    translate([0, 0, split_enclosure_by_mm]) {
        intersection() {
            difference() {
                shell();
                snap_joints(type="hole");
                enclosure_snap_lip(position="top", edge="inner");
            }
            enclosure_separator();
        }
    }

    enclosure_joiners();
}

if (show_case_parts==true) {
    if (split_into_parts==true) {
        generate_parts();
    } else {
        enclosure();
    }
}

if ($preview==true && show_hyperpixel_preview==true) {
    color("green", 0.4) gpio_module(gpio_size);
    color("gray", 0.3) hyperpixel_module(hyperpixel_size);
}
