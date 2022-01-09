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

/*[ Global ]*/

// Quality of rounded corners
$fn=24;

// Show the case parts
show_case_parts=true;

// Show a Jetson Nano preview
show_jetson_nano=true;

/*[ 3D-printing tools ]*/

// Split the case into parts that can be printed
split_into_parts=true;

// Gap between parts, in mm
split_gap=50;

// Tolerance for printed parts, in mm
tolerance=0.75;

/*[ Walls and cutouts ]*/

// Wall thickness, in mm
wall_thickness=2;

// Fillet size of enclosure
enclosure_fillet=3;

/*[ Part dimensions ]*/

// Total size of Jetson Nano module, in mm
nano_size=[99.98, 80.14, 31.52];
nano_size_no_underside=[nano_size.x, nano_size.y, 28.35];

// Size of fan, in mm
fan_size=[40, 40, 20];

// PCB screw size, in mm
pcb_screw_M_size=2.5; // [2, 2.5, 3, 4]

// PCB standoff height, in mm
pcb_standoff_height=6; // [3:10]

/*    __       __        __   __  __  __                     __
 *   / /  ___ / /  ___  / /__/ / / /_/ /  ___   _______  ___/ /__
 *  / _ \/ -_) _ \/ _ \/ / _  / / __/ _ \/ -_) / __/ _ \/ _  / -_)
 * /_.__/\__/_//_/\___/_/\_,_/  \__/_//_/\__/  \__/\___/\_,_/\__/
 */

/* [Hidden] */

include <../libraries/BOSL/constants.scad>
use <../libraries/BOSL/shapes.scad>
use <../libraries/BOSL/transforms.scad>

enclosure_size=[
    nano_size.x+(wall_thickness*2)+tolerance,
    nano_size.y+(wall_thickness*2)+tolerance,
    nano_size.z+(wall_thickness*2)+fan_size.z+tolerance+(pcb_standoff_height/2)
];

layer_diff=1*0.01;

// Fan offset based on the Nano
fan_offset_x=(fan_size.x/2)+8;
fan_offset_y=(nano_size.y/2)-0.6;
fan_offset_z=nano_size.z+layer_diff;

// PCB offset inside case
pcb_offset=wall_thickness+(tolerance/2);
standoff_radius=(pcb_screw_M_size/2)*2.5;

module pcb() {
    // Nano
    color("blue", 0.4) {
        import("jetson-nano.stl");
    }
    // Fan
    color("yellow", 0.2) {
        translate([fan_offset_x, fan_offset_y, fan_offset_z]) {
            cuboid(fan_size, center=false);
        }
    }
}

module pcb_standoffs(radius) {
    pcb_standoff_offset=[
        (((enclosure_size.x-tolerance)/2)-radius)-2.625,
        (((enclosure_size.y-tolerance)/2)-radius)+7.45,
        (pcb_standoff_height/2)+wall_thickness-layer_diff
    ];
    translate(pcb_standoff_offset) {
        yspread(n=2, l=58) {
            xspread(n=2, l=86) {
                translate([radius, radius, 0]) {
                    difference() {
                        cyl(r=radius, h=pcb_standoff_height, center=true);
                        cyl(d=pcb_screw_M_size, h=pcb_standoff_height+(layer_diff*2), center=true);
                    }
                }
            }
        }
    }
}

module port_cutouts(preview_depth=1) {
    ld=layer_diff;
    t=tolerance;
    cd=wall_thickness+tolerance;
    translate([cd, -layer_diff, cd+pcb_standoff_height+0.9+layer_diff]) {
        // USB-C x1
        right(1) cuboid([8.5+t, cd*preview_depth, 2.6+t], align=V_UP, center=false, fillet=0.9, edges=EDGES_Y_TOP);
        // HDMI x1
        right(15.60) cuboid([14.75+t, cd*preview_depth, 5.7+t], align=V_UP, center=false, chamfer=0.9, edges=EDGES_Y_TOP);
        // USB-A x1
        right(34.75) cuboid([14.4+t, cd*preview_depth, 6.35+t], align=V_UP, center=false, chamfer=0.9, edges=EDGES_Y_TOP);
        // USB-A x2
        right(51.6) cuboid([14.4+t, cd*preview_depth, 15+t], align=V_UP, center=false, chamfer=0.9, edges=EDGES_Y_TOP);
        // RJ-45
        right(68.25) cuboid([16+t, cd*preview_depth, 13.25+t], align=V_UP, center=false, chamfer=0.2, edges=EDGES_Y_TOP);
    }
}

module enclosure_separator() {
    translate([-layer_diff, -layer_diff, enclosure_size.z/2]) {
        cube([
            enclosure_size.x+(layer_diff*2), // width
            enclosure_size.y+(layer_diff*2), // depth
            enclosure_size.z+(layer_diff*2) // height
        ], center=false);
    }
}

module shell() {
    difference() {
        cuboid(enclosure_size, center=false, fillet=enclosure_fillet, edges=EDGES_Y_ALL);
        translate([wall_thickness, wall_thickness, wall_thickness]) {
            cuboid([
                enclosure_size.x-(wall_thickness*2),
                enclosure_size.y-(wall_thickness*2),
                enclosure_size.z-(wall_thickness*2)
            ], fillet=enclosure_fillet/2, edges=EDGES_Y_ALL, center=false);
        }
        port_cutouts();
    }
}

module enclosure() {
    union() {
        shell();
        pcb_standoffs(standoff_radius);
    }
}

module enclosure_joiners() {
}

module generate_parts() {
    joiner_slop=0.4;
    difference() {
        enclosure();
        enclosure_separator();
    }

    translate([0, 0, split_gap]) {
        intersection() {
            difference() {
                shell();
            }
            enclosure_separator();
        }
    }

    enclosure_joiners();
}

if ($preview==true && show_jetson_nano==true) {
    color("white", 0.2) pcb_standoffs(standoff_radius);
    pcb_bottom_offset=pcb_standoff_height+wall_thickness-(nano_size.z-nano_size_no_underside.z);
    translate([pcb_offset, pcb_offset, pcb_bottom_offset]) {
        pcb();
    }
    color("green", 0.2) port_cutouts(preview_depth=6);
}

if (show_case_parts==true) {
    color("white", 0.03) {
        if (split_into_parts==true) {
            generate_parts();
        } else {
            enclosure();
        }
    }
}
