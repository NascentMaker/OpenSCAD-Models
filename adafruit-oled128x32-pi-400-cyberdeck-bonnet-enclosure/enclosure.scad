/*
 * This work is licensed under the Creative Commons Attribution-ShareAlike
 * 4.0 International License. To view a copy of this license, visit
 * https://creativecommons.org/licenses/by-sa/4.0/.
 */

include <BOSL/constants.scad>
use <BOSL/metric_screws.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

/* [Customizable Parameters] */

wall_thickness=1.6;

bonnet_width=65.06;
bonnet_depth=30.61;
cyberdeck_width=65.37;
cyberdeck_depth=31.13;

cyberdeck_x_hole_distance=58;
cyberdeck_y_hole_distance=23.4;
cyberdeck_hole_diameter=3;

bonnet_deck_height=12.88;
bonnet_deck_oled_height=15.00;

bonnet_oled_left=2;
bonnet_oled_right=2;
bonnet_oled_top=6;
bonnet_oled_bottom=8.5;

enclosure_fillet=2.5;

enclosure_size=[
    cyberdeck_width+(wall_thickness*2),
    cyberdeck_depth+(wall_thickness*2),
    bonnet_deck_oled_height+(wall_thickness*2)
];

cavity_size=[
    cyberdeck_width,
    cyberdeck_depth,
    bonnet_deck_oled_height
];

panel_window_size=[
    bonnet_width-bonnet_oled_left-bonnet_oled_right,
    bonnet_depth-bonnet_oled_top-bonnet_oled_bottom,
    wall_thickness+0.01
];

bottom_opening_size=[
    cyberdeck_x_hole_distance-(wall_thickness*4),
    cyberdeck_depth,
    wall_thickness+0.01
];

difference()
{
    cuboid(enclosure_size, fillet=enclosure_fillet, edges=EDGES_Z_BK, $fn=24, center=true);
    forward(wall_thickness+0.01)
        cuboid(cavity_size, fillet=enclosure_fillet, edges=EDGES_Z_BK, $fn=24, center=true);
    up((bonnet_deck_oled_height/2)+(wall_thickness/2))
    back(bonnet_oled_top/2)
        cuboid(panel_window_size, fillet=enclosure_fillet/2, edges=EDGES_Z_ALL, $fn=24, center=true);
    forward(wall_thickness*5)
    down((bonnet_deck_oled_height/2)+(wall_thickness/2))
        cuboid(bottom_opening_size, fillet=enclosure_fillet/2, edges=EDGES_Z_BK, $fn=24, center=true);
}

forward(wall_thickness+(cyberdeck_y_hole_distance/2))
down((bonnet_deck_oled_height/2)-(wall_thickness/2))
xspread(n=2, spacing=cyberdeck_x_hole_distance)
    cyl(d=cyberdeck_hole_diameter*0.80, l=2, $fn=24, center=true);
