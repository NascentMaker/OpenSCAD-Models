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

/* [Customizable Parameters] */

wall_thickness=2;

bonnet_width=65.06;
bonnet_depth=30.61;
cyberdeck_width=65.37;
cyberdeck_depth=31.13;

cyberdeck_x_hole_distance=58;
cyberdeck_y_hole_distance=23.4;
cyberdeck_hole_diameter=3;

bonnet_deck_height=12.88;
bonnet_deck_oled_height=15.60;

bonnet_oled_left=2;
bonnet_oled_right=2;
bonnet_oled_top=6;
bonnet_oled_bottom=8.5;

oled_visible_area_top=8;
oled_visible_area=[60, 16];

enclosure_fillet=2.5;

/*    __       __        __   __  __  __                     __
 *   / /  ___ / /  ___  / /__/ / / /_/ /  ___   _______  ___/ /__
 *  / _ \/ -_) _ \/ _ \/ / _  / / __/ _ \/ -_) / __/ _ \/ _  / -_)
 * /_.__/\__/_//_/\___/_/\_,_/  \__/_//_/\__/  \__/\___/\_,_/\__/
 */

/* [Hidden] */

include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>

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
    oled_visible_area[0],
    oled_visible_area[1],
    wall_thickness+0.01
];

bottom_opening_size=[
    cyberdeck_x_hole_distance-(wall_thickness*4),
    cyberdeck_depth,
    wall_thickness+0.01
];

difference()
{
    // main box
    cuboid(enclosure_size, fillet=enclosure_fillet, edges=EDGES_Z_BK, $fn=24, center=true);
    forward(wall_thickness+0.01)
        cuboid(cavity_size, fillet=enclosure_fillet, edges=EDGES_Z_BK, $fn=24, center=true);

    // window
    up((bonnet_deck_oled_height/2)+(wall_thickness/2))
    back((oled_visible_area_top/2)-wall_thickness)
        cuboid(panel_window_size, fillet=enclosure_fillet/2, edges=EDGES_Z_ALL, $fn=24, center=true);

    // bottom opening
    forward(wall_thickness*5)
    down((bonnet_deck_oled_height/2)+(wall_thickness/2))
        cuboid(bottom_opening_size, fillet=enclosure_fillet/2, edges=EDGES_Z_BK, $fn=24, center=true);

    forward(wall_thickness+(cyberdeck_y_hole_distance/2))
    down((bonnet_deck_oled_height/2)+(wall_thickness/2))
    xspread(n=2, spacing=cyberdeck_x_hole_distance)
        cyl(d=cyberdeck_hole_diameter*0.80, l=wall_thickness+0.01, $fn=24, center=true);
}
