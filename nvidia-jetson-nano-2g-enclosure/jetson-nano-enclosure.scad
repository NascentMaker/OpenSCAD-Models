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
tolerance=0.5;

/*[ Walls and cutouts ]*/

// Wall thickness, in mm
wall_thickness=2;

// Side wall thickness, in mm
side_wall_thickness=4;

// Fillet size of enclosure
enclosure_fillet=3;

// Include a cutout for a panel-mounted power switch?
include_power_switch=true;

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
use <../libraries/BOSL/math.scad>

enclosure_size=[
    nano_size.x+(side_wall_thickness*2)+tolerance,
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
pcb_side_offset=side_wall_thickness+(tolerance/2);
standoff_radius=(pcb_screw_M_size/2)*2.5;

module pcb() {
    // Nano
    color("blue", 0.3) {
        import("jetson-nano.stl");
    }
    // Fan
    color("yellow", 0.1) {
        translate([fan_offset_x, fan_offset_y, fan_offset_z]) {
            cuboid(fan_size, center=false);
        }
    }
}

module pcb_standoffs(radius) {
    t=tolerance;
    h_t=t/2;
    pcb_standoff_offset=[
        ((enclosure_size.x/2)-radius)-3,
        ((enclosure_size.y/2)-radius)+7.1,
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

module vent_cutout(h=5, d=9, spacing=2, area=25) {
    hexregion = [for (a = [0:60:359.9]) (area+layer_diff)*[cos(a), sin(a)]];
    grid2d(spacing=d+spacing, stagger=true, in_poly=hexregion) {
        zrot(180/6) {
            cylinder(h=h, d=d/cos(180/6)+0.01, $fn=6);
        }
    }
}

module vent_cutouts() {
    // left vent cutout
    translate([side_wall_thickness+layer_diff, (enclosure_size.y/2)+15, (enclosure_size.z/2)+3]) {
        rot([90, 0, 0]) {
            rot(from=V_LEFT, to=V_DOWN) {
                vent_cutout(h=side_wall_thickness+(layer_diff*2), d=7, area=20, spacing=1.5);
            }
        }
    }
    // right vent cutout
    translate([enclosure_size.x+layer_diff, (enclosure_size.y/2)+15, (enclosure_size.z/2)-3]) {
        rot([90, 0, 0]) {
            rot(from=V_LEFT, to=V_DOWN) {
                vent_cutout(h=side_wall_thickness+(layer_diff*2), d=7, area=20, spacing=1.5);
            }
        }
    }
    // top vent cutout
    translate([(enclosure_size.x/2)-2, (enclosure_size.y/2)+19, enclosure_size.z-wall_thickness-layer_diff]) {
        vent_cutout(h=side_wall_thickness+(layer_diff*2), d=7, area=20, spacing=1.5);
    }
    // bottom vent cutout
    translate([(enclosure_size.x/2), (enclosure_size.y/2), -layer_diff]) {
        vent_cutout(h=side_wall_thickness+(layer_diff*2), d=7, area=30, spacing=1.5);
    }
}

module power_switch() {
    t=tolerance;
    h_t=t/2;
    swt=side_wall_thickness+t;
    diam=15.75+t;
    c_o=16;
    switch_cutout_radius=diam/2;
    switch_position = [
        -layer_diff, c_o, enclosure_size.z-c_o
    ];
    translate(switch_position) {
        xcyl(r=switch_cutout_radius, center=false, l=swt);
    }
}

module port_cutouts(preview_depth=1) {
    ld=layer_diff;
    t=tolerance;
    h_t=t/2;
    cd=wall_thickness+t;
    scd=side_wall_thickness+t;
    if (include_power_switch==true) {
        power_switch();
    }
    translate([scd+0.35, -layer_diff, wall_thickness+pcb_standoff_height+1.55-h_t+layer_diff]) {
        // USB-C x125
        right(1.2-h_t) cuboid([9+t, cd*preview_depth, 3.25+t], align=V_UP, center=false, fillet=1, edges=EDGES_Y_TOP);
        // HDMI x1
        right(15.85-h_t) cuboid([15.05+t, cd*preview_depth, 6.3+t], align=V_UP, center=false, chamfer=0.25, edges=EDGES_Y_TOP);
        // USB-A x1
        right(35.5-h_t) cuboid([13.3+t, cd*preview_depth, 7.10+t], align=V_UP, center=false, chamfer=0.25, edges=EDGES_Y_TOP);
        // USB-A x2
        right(52.5-h_t) cuboid([13.5+t, cd*preview_depth, 15.7+t], align=V_UP, center=false, chamfer=0.25, edges=EDGES_Y_TOP);
        // RJ-45
        right(68.5-h_t) cuboid([16+t, cd*preview_depth, 13.7+t], align=V_UP, center=false, chamfer=0.25, edges=EDGES_Y_TOP);
    }
}

module enclosure_separator(intersect=false) {
    z_offset=enclosure_size.z/2;
    left_lip_height=intersect==true?18-(tolerance/2):18;
    right_lip_height=intersect==true?18+(tolerance/2):18;
    modifier=(intersect==true?(tolerance/2):0);
    translate([-layer_diff, -layer_diff, z_offset]) {
        difference() {
            cube([
                enclosure_size.x+(layer_diff*2), // width
                enclosure_size.y+(layer_diff*2), // depth
                z_offset+(layer_diff*2) // height
            ], center=false);
            translate([enclosure_size.x-wall_thickness+layer_diff-modifier, wall_thickness, -layer_diff]) {
                cube([
                    wall_thickness+layer_diff+modifier,
                    enclosure_size.y-(wall_thickness*2),
                    right_lip_height
                ]);
            }
        }
        translate([-layer_diff, wall_thickness, -left_lip_height+layer_diff]) {
            cube([
                wall_thickness+layer_diff-modifier,
                enclosure_size.y-(wall_thickness*2),
                left_lip_height
            ]);
        }
    }
}

module shell() {
    difference() {
        cuboid(enclosure_size, center=false, fillet=enclosure_fillet, edges=EDGES_Y_ALL);
        translate([side_wall_thickness-(tolerance/2), wall_thickness, wall_thickness]) {
            cuboid([
                enclosure_size.x-(side_wall_thickness*2)+tolerance,
                enclosure_size.y-(wall_thickness*2),
                enclosure_size.z-(wall_thickness*2)
            ], fillet=enclosure_fillet/2, edges=EDGES_Y_ALL, center=false);
        }
        port_cutouts();
        vent_cutouts();
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
        enclosure_separator(intersect=false);
    }

    translate([0, 0, split_gap]) {
        intersection() {
            difference() {
                shell();
            }
            enclosure_separator(intersect=true);
        }
    }

    enclosure_joiners();
}

if ($preview==true && show_jetson_nano==true) {
    color("white", 0.2) pcb_standoffs(standoff_radius);
    pcb_bottom_offset=pcb_standoff_height+wall_thickness-(nano_size.z-nano_size_no_underside.z);
    translate([pcb_side_offset, pcb_offset, pcb_bottom_offset]) {
        pcb();
    }
    if (split_into_parts==false) {
        color("green", 0.4) port_cutouts(preview_depth=6);
    }
}

if (show_case_parts==true) {
    if (split_into_parts==true) {
        generate_parts();
    } else {
        color("white", 0.03) enclosure();
    }
}
