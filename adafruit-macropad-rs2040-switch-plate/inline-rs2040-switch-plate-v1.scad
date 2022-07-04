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

//////////////////////////////////////////////////////////////////////
// LibFile: constants.scad
//   Useful Constants.
//   To use this, add the following line to the top of your file.
//   ```
//   include <BOSL/constants.scad>
//   ```
//////////////////////////////////////////////////////////////////////

/*
BSD 2-Clause License

Copyright (c) 2017, Revar Desmera
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/


// Section: General Constants

PRINTER_SLOP = 0.20;  // The printer specific amount of slop in mm to print with to make parts fit exactly.  You may need to override this value for your printer.



// Section: Directional Vectors
//   Vectors useful for `rotate()`, `mirror()`, and `align` arguments for `cuboid()`, `cyl()`, etc.

// Constant: V_LEFT
// Description: Vector pointing left.  [-1,0,0]
// Example(3D): Usage with `align`
//   cuboid(20, align=V_LEFT);
V_LEFT  = [-1,  0,  0];

// Constant: V_RIGHT
// Description: Vector pointing right.  [1,0,0]
// Example(3D): Usage with `align`
//   cuboid(20, align=V_RIGHT);
V_RIGHT = [ 1,  0,  0];

// Constant: V_FWD
// Description: Vector pointing forward.  [0,-1,0]
// Example(3D): Usage with `align`
//   cuboid(20, align=V_FWD);
V_FWD   = [ 0, -1,  0];

// Constant: V_BACK
// Description: Vector pointing back.  [0,1,0]
// Example(3D): Usage with `align`
//   cuboid(20, align=V_BACK);
V_BACK  = [ 0,  1,  0];

// Constant: V_DOWN
// Description: Vector pointing down.  [0,0,-1]
// Example(3D): Usage with `align`
//   cuboid(20, align=V_DOWN);
V_DOWN  = [ 0,  0, -1];

// Constant: V_UP
// Description: Vector pointing up.  [0,0,1]
// Example(3D): Usage with `align`
//   cuboid(20, align=V_UP);
V_UP    = [ 0,  0,  1];

// Constant: V_ALLPOS
// Description: Vector pointing right, back, and up.  [1,1,1]
// Example(3D): Usage with `align`
//     cuboid(20, align=V_ALLPOS);
V_ALLPOS = [ 1,  1,  1];  // Vector pointing X+,Y+,Z+.

// Constant: V_ALLNEG
// Description: Vector pointing left, forwards, and down.  [-1,-1,-1]
// Example(3D): Usage with `align`
//     cuboid(20, align=V_ALLNEG);
V_ALLNEG = [-1, -1, -1];  // Vector pointing X-,Y-,Z-.

// Constant: V_ZERO
// Description: Zero vector.  Centered.  [0,0,0]
// Example(3D): Usage with `align`
//     cuboid(20, align=V_ZERO);
V_ZERO   = [ 0,  0,  0];  // Centered zero vector.


// Section: Vector Aliases
//   Useful aliases for use with `align`.

V_CENTER = V_ZERO;  // Centered, alias to `V_ZERO`.
V_ABOVE  = V_UP;    // Vector pointing up, alias to `V_UP`.
V_BELOW  = V_DOWN;  // Vector pointing down, alias to `V_DOWN`.
V_BEFORE = V_FWD;   // Vector pointing forward, alias to `V_FWD`.
V_BEHIND = V_BACK;  // Vector pointing back, alias to `V_BACK`.

V_TOP    = V_UP;    // Vector pointing up, alias to `V_UP`.
V_BOTTOM = V_DOWN;  // Vector pointing down, alias to `V_DOWN`.
V_FRONT  = V_FWD;   // Vector pointing forward, alias to `V_FWD`.
V_REAR   = V_BACK;  // Vector pointing back, alias to `V_BACK`.



// Section: Pre-Orientation Alignments
//   Constants for pre-orientation alignments.


// Constant: ALIGN_POS
// Description: Align the axis-positive end to the origin.
// Example(3D): orient=ORIENT_X
//     cyl(d1=10, d2=5, h=20, orient=ORIENT_X, align=ALIGN_POS);
// Example(3D): orient=ORIENT_Y
//     cyl(d1=10, d2=5, h=20, orient=ORIENT_Y, align=ALIGN_POS);
// Example(3D): orient=ORIENT_Z
//     cyl(d1=10, d2=5, h=20, orient=ORIENT_Z, align=ALIGN_POS);
// Example(3D): orient=ORIENT_XNEG
//     cyl(d1=10, d2=5, h=20, orient=ORIENT_XNEG, align=ALIGN_POS);
// Example(3D): orient=ORIENT_YNEG
//     cyl(d1=10, d2=5, h=20, orient=ORIENT_YNEG, align=ALIGN_POS);
// Example(3D): orient=ORIENT_ZNEG
//     cyl(d1=10, d2=5, h=20, orient=ORIENT_ZNEG, align=ALIGN_POS);
ALIGN_POS = 1;


ALIGN_CENTER =  0;  // Align centered.

// Constant: ALIGN_NEG
// Description: Align the axis-negative end to the origin.
// Example(3D): orient=ORIENT_X
//     cyl(d1=10, d2=5, h=20, orient=ORIENT_X, align=ALIGN_NEG);
// Example(3D): orient=ORIENT_Y
//     cyl(d1=10, d2=5, h=20, orient=ORIENT_Y, align=ALIGN_NEG);
// Example(3D): orient=ORIENT_Z
//     cyl(d1=10, d2=5, h=20, orient=ORIENT_Z, align=ALIGN_NEG);
// Example(3D): orient=ORIENT_XNEG
//     cyl(d1=10, d2=5, h=20, orient=ORIENT_XNEG, align=ALIGN_NEG);
// Example(3D): orient=ORIENT_YNEG
//     cyl(d1=10, d2=5, h=20, orient=ORIENT_YNEG, align=ALIGN_NEG);
// Example(3D): orient=ORIENT_ZNEG
//     cyl(d1=10, d2=5, h=20, orient=ORIENT_ZNEG, align=ALIGN_NEG);
ALIGN_NEG = -1;


// CommonCode:
//   orientations = [
//       ORIENT_X,        ORIENT_Y,        ORIENT_Z,
//       ORIENT_XNEG,     ORIENT_YNEG,     ORIENT_ZNEG,
//       ORIENT_X_90,     ORIENT_Y_90,     ORIENT_Z_90,
//       ORIENT_XNEG_90,  ORIENT_YNEG_90,  ORIENT_ZNEG_90,
//       ORIENT_X_180,    ORIENT_Y_180,    ORIENT_Z_180,
//       ORIENT_XNEG_180, ORIENT_YNEG_180, ORIENT_ZNEG_180,
//       ORIENT_X_270,    ORIENT_Y_270,    ORIENT_Z_270,
//       ORIENT_XNEG_270, ORIENT_YNEG_270, ORIENT_ZNEG_270
//   ];
//   axiscolors = ["red", "forestgreen", "dodgerblue"];
//   module text3d(text, h=0.01, size=3) {
//       linear_extrude(height=h, convexity=10) {
//           text(text=text, size=size, valign="center", halign="center");
//       }
//   }
//   module orient_cube(ang) {
//       color("lightgray") cube(20, center=true);
//       color(axiscolors.x) up  ((20-1)/2+0.01) back ((20-1)/2+0.01) cube([18,1,1], center=true);
//       color(axiscolors.y) up  ((20-1)/2+0.01) right((20-1)/2+0.01) cube([1,18,1], center=true);
//       color(axiscolors.z) back((20-1)/2+0.01) right((20-1)/2+0.01) cube([1,1,18], center=true);
//       for (axis=[0:2], neg=[0:1]) {
//           idx = axis + 3*neg + 6*ang/90;
//           rotate(orientations[idx]) {
//               up(10) {
//                   fwd(4) color("black") text3d(text=str(ang), size=4);
//                   back(4) color(axiscolors[axis]) text3d(text=str(["X","Y","Z"][axis], ["+","NEG"][neg]), size=4);
//               }
//           }
//       }
//   }


// Section: Standard Orientations
//   Orientations for `cyl()`, `prismoid()`, etc.  They take the form of standard [X,Y,Z]
//   rotation angles for rotating a vertical shape into the given orientations.
// Figure(Spin): Standard Orientations
//   orient_cube(0);

ORIENT_X        = [ 90,   0,  90];  // Orient along the X axis.
ORIENT_Y        = [ 90,   0, 180];  // Orient along the Y axis.
ORIENT_Z        = [  0,   0,   0];  // Orient along the Z axis.
ORIENT_XNEG     = [ 90,   0, -90];  // Orient reversed along the X axis.
ORIENT_YNEG     = [ 90,   0,   0];  // Orient reversed along the Y axis.
ORIENT_ZNEG     = [  0, 180,   0];  // Orient reversed along the Z axis.


// Section: Orientations Rotated 90º
//   Orientations for `cyl()`, `prismoid()`, etc.  They take the form of standard [X,Y,Z]
//   rotation angles for rotating a vertical shape into the given orientations.
// Figure(Spin): Orientations Rotated 90º
//   orient_cube(90);

ORIENT_X_90     = [ 90, -90,  90];  // Orient along the X axis, then rotate 90 degrees counter-clockwise on that axis, as seen when facing the origin from that axis orientation.
ORIENT_Y_90     = [ 90, -90, 180];  // Orient along the Y axis, then rotate 90 degrees counter-clockwise on that axis, as seen when facing the origin from that axis orientation.
ORIENT_Z_90     = [  0,   0,  90];  // Orient along the Z axis, then rotate 90 degrees counter-clockwise on that axis, as seen when facing the origin from that axis orientation.
ORIENT_XNEG_90  = [  0, -90,   0];  // Orient reversed along the X axis, then rotate 90 degrees counter-clockwise on that axis, as seen when facing the origin from that axis orientation.
ORIENT_YNEG_90  = [ 90, -90,   0];  // Orient reversed along the Y axis, then rotate 90 degrees counter-clockwise on that axis, as seen when facing the origin from that axis orientation.
ORIENT_ZNEG_90  = [  0, 180, -90];  // Orient reversed along the Z axis, then rotate 90 degrees counter-clockwise on that axis, as seen when facing the origin from that axis orientation.


// Section: Orientations Rotated 180º
//   Orientations for `cyl()`, `prismoid()`, etc.  They take the form of standard [X,Y,Z]
//   rotation angles for rotating a vertical shape into the given orientations.
// Figure(Spin): Orientations Rotated 180º
//   orient_cube(180);

ORIENT_X_180    = [-90,   0, -90];  // Orient along the X axis, then rotate 180 degrees counter-clockwise on that axis, as seen when facing the origin from that axis orientation.
ORIENT_Y_180    = [-90,   0,   0];  // Orient along the Y axis, then rotate 180 degrees counter-clockwise on that axis, as seen when facing the origin from that axis orientation.
ORIENT_Z_180    = [  0,   0, 180];  // Orient along the Z axis, then rotate 180 degrees counter-clockwise on that axis, as seen when facing the origin from that axis orientation.
ORIENT_XNEG_180 = [-90,   0,  90];  // Orient reversed along the X axis, then rotate 180 degrees counter-clockwise on that axis, as seen when facing the origin from that axis orientation.
ORIENT_YNEG_180 = [-90,   0, 180];  // Orient reversed along the Y axis, then rotate 180 degrees counter-clockwise on that axis, as seen when facing the origin from that axis orientation.
ORIENT_ZNEG_180 = [  0, 180, 180];  // Orient reversed along the Z axis, then rotate 180 degrees counter-clockwise on that axis, as seen when facing the origin from that axis orientation.


// Section: Orientations Rotated 270º
//   Orientations for `cyl()`, `prismoid()`, etc.  They take the form of standard [X,Y,Z]
//   rotation angles for rotating a vertical shape into the given orientations.
// Figure(Spin): Orientations Rotated 270º
//   orient_cube(270);

ORIENT_X_270    = [ 90,  90,  90];  // Orient along the X axis, then rotate 270 degrees counter-clockwise on that axis, as seen when facing the origin from that axis orientation.
ORIENT_Y_270    = [ 90,  90, 180];  // Orient along the Y axis, then rotate 270 degrees counter-clockwise on that axis, as seen when facing the origin from that axis orientation.
ORIENT_Z_270    = [  0,   0, -90];  // Orient along the Z axis, then rotate 270 degrees counter-clockwise on that axis, as seen when facing the origin from that axis orientation.
ORIENT_XNEG_270 = [ 90,  90, -90];  // Orient reversed along the X axis, then rotate 270 degrees counter-clockwise on that axis, as seen when facing the origin from that axis orientation.
ORIENT_YNEG_270 = [ 90,  90,   0];  // Orient reversed along the Y axis, then rotate 270 degrees counter-clockwise on that axis, as seen when facing the origin from that axis orientation.
ORIENT_ZNEG_270 = [  0, 180,  90];  // Orient reversed along the Z axis, then rotate 270 degrees counter-clockwise on that axis, as seen when facing the origin from that axis orientation.


// Section: Individual Edges
//   Constants for specifying edges for `cuboid()`, etc.

EDGE_TOP_BK = [[1,0,0,0], [0,0,0,0], [0,0,0,0]];  // Top Back edge.
EDGE_TOP_FR = [[0,1,0,0], [0,0,0,0], [0,0,0,0]];  // Top Front edge.
EDGE_BOT_FR = [[0,0,1,0], [0,0,0,0], [0,0,0,0]];  // Bottom Front Edge.
EDGE_BOT_BK = [[0,0,0,1], [0,0,0,0], [0,0,0,0]];  // Bottom Back Edge.

EDGE_TOP_RT = [[0,0,0,0], [1,0,0,0], [0,0,0,0]];  // Top Right edge.
EDGE_TOP_LF = [[0,0,0,0], [0,1,0,0], [0,0,0,0]];  // Top Left edge.
EDGE_BOT_LF = [[0,0,0,0], [0,0,1,0], [0,0,0,0]];  // Bottom Left edge.
EDGE_BOT_RT = [[0,0,0,0], [0,0,0,1], [0,0,0,0]];  // Bottom Right edge.

EDGE_BK_RT  = [[0,0,0,0], [0,0,0,0], [1,0,0,0]];  // Back Right edge.
EDGE_BK_LF  = [[0,0,0,0], [0,0,0,0], [0,1,0,0]];  // Back Left edge.
EDGE_FR_LF  = [[0,0,0,0], [0,0,0,0], [0,0,1,0]];  // Front Left edge.
EDGE_FR_RT  = [[0,0,0,0], [0,0,0,0], [0,0,0,1]];  // Front Right edge.

// Section: Sets of Edges
//   Constants for specifying edges for `cuboid()`, etc.

EDGES_X_TOP = [[1,1,0,0], [0,0,0,0], [0,0,0,0]];  // Both X-aligned Top edges.
EDGES_X_BOT = [[0,0,1,1], [0,0,0,0], [0,0,0,0]];  // Both X-aligned Bottom edges.
EDGES_X_FR  = [[0,1,1,0], [0,0,0,0], [0,0,0,0]];  // Both X-aligned Front edges.
EDGES_X_BK  = [[1,0,0,1], [0,0,0,0], [0,0,0,0]];  // Both X-aligned Back edges.
EDGES_X_ALL = [[1,1,1,1], [0,0,0,0], [0,0,0,0]];  // All four X-aligned edges.

EDGES_Y_TOP = [[0,0,0,0], [1,1,0,0], [0,0,0,0]];  // Both Y-aligned Top edges.
EDGES_Y_BOT = [[0,0,0,0], [0,0,1,1], [0,0,0,0]];  // Both Y-aligned Bottom edges.
EDGES_Y_LF  = [[0,0,0,0], [0,1,1,0], [0,0,0,0]];  // Both Y-aligned Left edges.
EDGES_Y_RT  = [[0,0,0,0], [1,0,0,1], [0,0,0,0]];  // Both Y-aligned Right edges.
EDGES_Y_ALL = [[0,0,0,0], [1,1,1,1], [0,0,0,0]];  // All four Y-aligned edges.

EDGES_Z_BK  = [[0,0,0,0], [0,0,0,0], [1,1,0,0]];  // Both Z-aligned Back edges.
EDGES_Z_FR  = [[0,0,0,0], [0,0,0,0], [0,0,1,1]];  // Both Z-aligned Front edges.
EDGES_Z_LF  = [[0,0,0,0], [0,0,0,0], [0,1,1,0]];  // Both Z-aligned Left edges.
EDGES_Z_RT  = [[0,0,0,0], [0,0,0,0], [1,0,0,1]];  // Both Z-aligned Right edges.
EDGES_Z_ALL = [[0,0,0,0], [0,0,0,0], [1,1,1,1]];  // All four Z-aligned edges.

EDGES_LEFT   = [[0,0,0,0], [0,1,1,0], [0,1,1,0]];  // All four Left edges.
EDGES_RIGHT  = [[0,0,0,0], [1,0,0,1], [1,0,0,1]];  // All four Right edges.
EDGES_FRONT  = [[0,1,1,0], [0,0,0,0], [0,0,1,1]];  // All four Front edges.
EDGES_BACK   = [[1,0,0,1], [0,0,0,0], [1,1,0,0]];  // All four Back edges.
EDGES_BOTTOM = [[0,0,1,1], [0,0,1,1], [0,0,0,0]];  // All four Bottom edges.
EDGES_TOP    = [[1,1,0,0], [1,1,0,0], [0,0,0,0]];  // All four Top edges.

EDGES_NONE = [[0,0,0,0], [0,0,0,0], [0,0,0,0]];  // No edges.
EDGES_ALL  = [[1,1,1,1], [1,1,1,1], [1,1,1,1]];  // All edges.


// Section: Edge Helpers

EDGE_OFFSETS = [   // Array of XYZ offsets to the center of each edge.
	[[0, 1, 1], [ 0,-1, 1], [ 0,-1,-1], [0, 1,-1]],
	[[1, 0, 1], [-1, 0, 1], [-1, 0,-1], [1, 0,-1]],
	[[1, 1, 0], [-1, 1, 0], [-1,-1, 0], [1,-1, 0]]
];


// Function: corner_edge_count()
// Description: Counts how many given edges intersect at a specific corner.
// Arguments:
//   edges = Standard edges array.
//   v = Vector pointing to the corner to count edge intersections at.
function corner_edge_count(edges, v) =
	(v[2]<=0)? (
		(v[1]<=0)? (
			(v[0]<=0)? (
				edges[0][2] + edges[1][2] + edges[2][2]
			) : (
				edges[0][2] + edges[1][3] + edges[2][3]
			)
		) : (
			(v[0]<=0)? (
				edges[0][3] + edges[1][2] + edges[2][1]
			) : (
				edges[0][3] + edges[1][3] + edges[2][0]
			)
		)
	) : (
		(v[1]<=0)? (
			(v[0]<=0)? (
				edges[0][1] + edges[1][1] + edges[2][2]
			) : (
				edges[0][1] + edges[1][0] + edges[2][3]
			)
		) : (
			(v[0]<=0)? (
				edges[0][0] + edges[1][1] + edges[2][1]
			) : (
				edges[0][0] + edges[1][0] + edges[2][0]
			)
		)
	);



// vim: noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 nowrap
//////////////////////////////////////////////////////////////////////
// LibFile: shapes.scad
//   Common useful shapes and structured objects.
//   To use, add the following lines to the beginning of your file:
//   ```
//   include <BOSL/constants.scad>
//   use <BOSL/shapes.scad>
//   ```
//////////////////////////////////////////////////////////////////////

/*
BSD 2-Clause License

Copyright (c) 2017, Revar Desmera
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/


//////////////////////////////////////////////////////////////////////
// LibFile: transforms.scad
//   This is the file that the most commonly used transformations, distributors, and mutator are in.
//   To use, add the following lines to the beginning of your file:
//   ```
//   include <BOSL/constants.scad>
//   use <BOSL/transforms.scad>
//   ```
//////////////////////////////////////////////////////////////////////

/*
BSD 2-Clause License

Copyright (c) 2017, Revar Desmera
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/


//////////////////////////////////////////////////////////////////////
// LibFile: math.scad
//   Math helper functions.
//   To use, add the following lines to the beginning of your file:
//   ```
//   use <BOSL/math.scad>
//   ```
//////////////////////////////////////////////////////////////////////

/*
BSD 2-Clause License

Copyright (c) 2017, Revar Desmera
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/


//////////////////////////////////////////////////////////////////////
// LibFile: compat.scad
//   Backwards Compatability library
//   To use, include this line at the top of your file:
//   ```
//   use <compat.scad>
//   ```
//////////////////////////////////////////////////////////////////////


/*
BSD 2-Clause License

Copyright (c) 2017, Revar Desmera
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/


// Section: Functions


// Function: default()
// Description:
//   Returns the value given as `v` if it is not `undef`.
//   Otherwise, returns the value of `dflt`.
// Arguments:
//   v = Value to pass through if not `undef`.
//   dflt = Value to return if `v` *is* `undef`.
function default(v,dflt=undef) = v==undef? dflt : v;


// Function: is_def()
// Description: Returns true if given value is not `undef`.
function is_def(v) = (version_num() > 20190100)? !is_undef(v) : (v != undef);


// Function: is_str()
// Description: Given a value, returns true if it is a string.
function is_str(v) = (version_num() > 20190100)? is_string(v) : (v=="" || (is_def(v) && is_def(v[0]) && (len(str(v,v)) == len(v)*2)));


// Function: is_boolean()
// Description: Given a value, returns true if it is a boolean.
function is_boolean(v) = (version_num() > 20190100)? is_bool(v) : (!is_str(v) && (str(v) == "true" || str(v) == "false"));


// Function: is_scalar()
// Description: Given a value, returns true if it is a scalar number.
function is_scalar(v) = (version_num() > 20190100)? is_num(v) : (!is_boolean(v) && is_def(v+0));


// Function: is_array()
// Description: Given a value, returns true if it is an array/list/vector.
function is_array(v) = (version_num() > 20190100)? is_list(v) : (v==[] || (is_def(v[0]) && !is_str(v) ));


// Function: get_radius()
// Description:
//   Given various radii and diameters, returns the most specific radius.
//   If a diameter is most specific, returns half its value, giving the radius.
//   If no radii or diameters are defined, returns the value of dflt.
//   Value specificity order is r1, d1, r, d, then dflt
// Arguments:
//   r1 = Most specific radius.
//   d1 = Most specific Diameter.
//   r = Most general radius.
//   d = Most general diameter.
//   dflt = Value to return if all other values given are `undef`.
function get_radius(r1=undef, r=undef, d1=undef, d=undef, dflt=undef) = (
	is_def(r1)? r1 :
	is_def(d1)? d1/2 :
	is_def(r)? r :
	is_def(d)? d/2 :
	dflt
);


// Function: Len()
// Description:
//   Given an array, returns number of items in array.  Otherwise returns `undef`.
function Len(v) = is_array(v)? len(v) : undef;


// Function: remove_undefs()
// Description: Removes all `undef`s from a list.
function remove_undefs(v) = [for (x = v) if (is_def(x)) x];


// Function: first_defined()
// Description:
//   Returns the first item in the list that is not `undef`.
//   If all items are `undef`, or list is empty, returns `undef`.
function first_defined(v) = remove_undefs(v)[0];


// Function: any_defined()
// Description:
//   Returns true if any item in the given array is not `undef`.
function any_defined(v) = len(remove_undefs(v))>0;


// Function: scalar_vec3()
// Usage:
//   scalar_vec3(v, [dflt]);
// Description:
//   If `v` is a scalar, and `dflt==undef`, returns `[v, v, v]`.
//   If `v` is a scalar, and `dflt!=undef`, returns `[v, dflt, dflt]`.
//   If `v` is a vector, returns the first 3 items, with any missing values replaced by `dflt`.
//   If `v` is `undef`, returns `undef`.
// Arguments:
//   v = Value to return vector from.
//   dflt = Default value to set empty vector parts from.
function scalar_vec3(v, dflt=undef) =
	!is_def(v)? undef :
	is_array(v)? [for (i=[0:2]) default(v[i], default(dflt, 0))] :
	is_def(dflt)? [v,dflt,dflt] : [v,v,v];



// Function: f_echo()
// Description: If possible, echo a message from a function.
function f_echo(msg) = (version_num() > 20190100)? echo(msg) : 0;


// Section: Modules


// Module: assert_in_list()
// Usage:
//   assert_in_list(argname, val, l, [idx]);
// Description:
//   Emulates the newer OpenSCAD `assert()` with an `in_list()` test.
//   You can also use this as a function call from a function.
// Arguments:
//   argname = The name of the argument value being tested.
//   val = The value to test if it exists in the list.
//   l = The list to look for `val` in.
//   idx = If given, and `l` is a list of lists, look for `val` in the given index of each sublist.
module assert_in_list(argname, val, l, idx=undef) {
	succ = search([val], l, num_returns_per_match=1, index_col_num=idx) != [[]];
	if (!succ) {
		msg = str(
			"In argument '", argname, "', ",
			(is_str(val)? str("\"", val, "\"") : val),
			" must be one of ",
			(is_def(idx)? [for (v=l) v[idx]] : l)
		);
		assertion(succ, msg);
	}
}

function assert_in_list(argname, val, l, idx=undef) =
	let(succ = search([val], l, num_returns_per_match=1, index_col_num=idx) != [[]])
	succ? 0 : let(
		msg = str(
			"In argument '", argname, "', ",
			(is_str(val)? str("\"", val, "\"") : val),
			" must be one of ",
			(is_def(idx)? [for (v=l) v[idx]] : l)
		)
	) assertion(succ, msg);


// Module: assertion()
// Usage:
//   assertion(succ, msg);
// Description:
//   Backwards compatible assert() semi-replacement.
//   If `succ` is false, then print an error with `msg`.
//   You can also use this as a function call from a function.
// Arguments:
//   succ = If this is `false`, trigger the assertion.
//   msg = The message to emit if `succ` is `false`.
module assertion(succ, msg) {
	if (version_num() > 20190100) {
		// assert() will echo the variable name, and `succ` looks confusing there.  So we store it in FAILED.
		FAILED = succ;
		assert(FAILED, msg);
	} else if (!succ) {
		echo_error(msg);
	}
}

function assertion(succ, msg) =
	(version_num() > 20190100)? let(FAILED=succ) assert(FAILED, msg) : 0;


// Module: echo_error()
// Usage:
//   echo_error(msg, [pfx]);
// Description:
//   Emulates printing of an error message.  The text will be shaded red.
//   You can also use this as a function call from a function.
// Arguments:
//   msg = The message to print.
//   pfx = The prefix to print before `msg`.  Default: `ERROR`
module echo_error(msg, pfx="ERROR") {
	echo(str("<p style=\"background-color: #ffb0b0\"><b>", pfx, ":</b> ", msg, "</p>"));
}

function echo_error(msg, pfx="ERROR") =
	f_echo(str("<p style=\"background-color: #ffb0b0\"><b>", pfx, ":</b> ", msg, "</p>"));


// Module: echo_warning()
// Usage:
//   echo_warning(msg, [pfx]);
// Description:
//   Emulates printing of a warning message.  The text will be shaded yellow.
//   You can also use this as a function call from a function.
// Arguments:
//   msg = The message to print.
//   pfx = The prefix to print before `msg`.  Default: `WARNING`
module echo_warning(msg, pfx="WARNING") {
	echo(str("<p style=\"background-color: #ffffb0\"><b>", pfx, ":</b> ", msg, "</p>"));
}

function echo_warning(msg, pfx="WARNING") =
	f_echo(str("<p style=\"background-color: #ffffb0\"><b>", pfx, ":</b> ", msg, "</p>"));


// Module: deprecate()
// Usage:
//   deprecate(name, [suggest]);
// Description:
//   Show module deprecation warnings.
//   You can also use this as a function call from a function.
// Arguments:
//   name = The name of the module that is deprecated.
//   suggest = If given, the module to recommend using instead.
module deprecate(name, suggest=undef) {
	echo_warning(pfx="DEPRECATED",
		str(
			"`<code>", name, "</code>` is deprecated and should not be used.",
			!is_def(suggest)? "" : str(
				"  You should use `<code>", suggest, "</code>` instead."
			)
		)
	);
}

function deprecate(name, suggest=undef) =
	echo_warning(pfx="DEPRECATED",
		str(
			"`<code>", name, "</code>` is deprecated and should not be used.",
			!is_def(suggest)? "" : str(
				"  You should use `<code>", suggest, "</code>` instead."
			)
		)
	);


// Module: deprecate_argument()
// Usage:
//   deprecate(name, arg, [suggest]);
// Description:
//   Show argument deprecation warnings.
//   You can also use this as a function call from a function.
// Arguments:
//   name = The name of the module/function the deprecated argument is used in.
//   arg = The name of the deprecated argument.
//   suggest = If given, the argument to recommend using instead.
module deprecate_argument(name, arg, suggest=undef) {
	echo_warning(pfx="DEPRECATED ARG", str(
		"In `<code>", name, "</code>`, ",
		"the argument `<code>", arg, "</code>` ",
		"is deprecated and should not be used.",
		!is_def(suggest)? "" : str(
			"  You should use `<code>", suggest, "</code>` instead."
		)
	));
}

function deprecate_argument(name, arg, suggest=undef) =
	echo_warning(pfx="DEPRECATED ARG", str(
		"In `<code>", name, "</code>`, ",
		"the argument `<code>", arg, "</code>` ",
		"is deprecated and should not be used.",
		!is_def(suggest)? "" : str(
			"  You should use `<code>", suggest, "</code>` instead."
		)
	));



// vim: noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 nowrap


// Section: Math Constants

PHI = (1+sqrt(5))/2;  // The golden ratio phi.

EPSILON = 1e-9;  // A really small value useful in comparing FP numbers.  ie: abs(a-b)<EPSILON



// Function: Cpi()
// Status: DEPRECATED, use `PI` instead.
// Description:
//   Returns the value of pi.
function Cpi() = PI;  // Deprecated!  Use the variable PI instead.


// Section: Simple Calculations

// Function: quant()
// Description:
//   Quantize a value `x` to an integer multiple of `y`, rounding to the nearest multiple.
// Arguments:
//   x = The value to quantize.
//   y = The multiple to quantize to.
function quant(x,y) = floor(x/y+0.5)*y;


// Function: quantdn()
// Description:
//   Quantize a value `x` to an integer multiple of `y`, rounding down to the previous multiple.
// Arguments:
//   x = The value to quantize.
//   y = The multiple to quantize to.
function quantdn(x,y) = floor(x/y)*y;


// Function: quantup()
// Description:
//   Quantize a value `x` to an integer multiple of `y`, rounding up to the next multiple.
// Arguments:
//   x = The value to quantize.
//   y = The multiple to quantize to.
function quantup(x,y) = ceil(x/y)*y;


// Function: constrain()
// Usage:
//   constrain(v, minval, maxval);
// Description:
//   Constrains value to a range of values between minval and maxval, inclusive.
// Arguments:
//   v = value to constrain.
//   minval = minimum value to return, if out of range.
//   maxval = maximum value to return, if out of range.
function constrain(v, minval, maxval) = min(maxval, max(minval, v));


// Function: min_index()
// Usage:
//   min_index(vals);
// Description:
//   Returns the index of the minimal value in the given list.
function min_index(vals, _minval, _minidx, _i=0) =
	_i>=len(vals)? _minidx :
	min_index(
		vals,
		((_minval == undef || vals[_i] < _minval)? vals[_i] : _minval),
		((_minval == undef || vals[_i] < _minval)? _i : _minidx),
		_i+1
	);


// Function: max_index()
// Usage:
//   max_index(vals);
// Description:
//   Returns the index of the maximum value in the given list.
function max_index(vals, _maxval, _maxidx, _i=0) =
	_i>=len(vals)? _maxidx :
	max_index(
		vals,
		((_maxval == undef || vals[_i] > _maxval)? vals[_i] : _maxval),
		((_maxval == undef || vals[_i] > _maxval)? _i : _maxidx),
		_i+1
	);


// Function: posmod()
// Usage:
//   posmod(x,m)
// Description:
//   Returns the positive modulo `m` of `x`.  Value returned will be in the range 0 ... `m`-1.
//   This if useful for normalizing angles to 0 ... 360.
// Arguments:
//   x = The value to constrain.
//   m = Modulo value.
function posmod(x,m) = (x%m+m)%m;


// Function: modrange()
// Usage:
//   modrange(x, y, m, [step])
// Description:
//   Returns a normalized list of values from `x` to `y`, by `step`, modulo `m`.  Wraps if `x` > `y`.
// Arguments:
//   x = The start value to constrain.
//   y = The end value to constrain.
//   m = Modulo value.
//   step = Step by this amount.
// Examples:
//   modrange(90,270,360, step=45);   // Outputs [90,135,180,225,270]
//   modrange(270,90,360, step=45);   // Outputs [270,315,0,45,90]
//   modrange(90,270,360, step=-45);  // Outputs [90,45,0,315,270]
//   modrange(270,90,360, step=-45);  // Outputs [270,225,180,135,90]
function modrange(x, y, m, step=1) =
	let(
		a = posmod(x, m),
		b = posmod(y, m),
		c = step>0? (a>b? b+m : b) : (a<b? b-m : b)
	) [for (i=[a:step:c]) (i%m+m)%m];


// Function: gaussian_rand()
// Usage:
//   gaussian_rand(mean, stddev)
// Description:
//   Returns a random number with a gaussian/normal distribution.
// Arguments:
//   mean = The average random number returned.
//   stddev = The standard deviation of the numbers to be returned.
function gaussian_rand(mean, stddev) = let(s=rands(0,1,2)) mean + stddev*sqrt(-2*ln(s.x))*cos(360*s.y);


// Function: log_rand()
// Usage:
//   log_rand(minval, maxval, factor);
// Description:
//   Returns a single random number, with a logarithmic distribution.
// Arguments:
//   minval = Minimum value to return.
//   maxval = Maximum value to return.  `minval` <= X < `maxval`.
//   factor = Log factor to use.  Values of X are returned `factor` times more often than X+1.
function log_rand(minval, maxval, factor) = -ln(1-rands(1-1/pow(factor,minval), 1-1/pow(factor,maxval), 1)[0])/ln(factor);


// Function: segs()
// Description:
//   Calculate the standard number of sides OpenSCAD would give a circle based on `$fn`, `$fa`, and `$fs`.
// Arguments:
//   r = Radius of circle to get the number of segments for.
function segs(r) =
	$fn>0? ($fn>3? $fn : 3) :
	ceil(max(5, min(360/$fa, abs(r)*2*PI/$fs)));


// Function: lerp()
// Description: Interpolate between two values or vectors.
// Arguments:
//   a = First value.
//   b = Second value.
//   u = The proportion from `a` to `b` to calculate.  Valid range is 0.0 to 1.0, inclusive.
function lerp(a,b,u) = (1-u)*a + u*b;


// Function: hypot()
// Description: Calculate hypotenuse length of a 2D or 3D triangle.
// Arguments:
//   x = Length on the X axis.
//   y = Length on the Y axis.
//   z = Length on the Z axis.
function hypot(x,y,z=0) = norm([x,y,z]);


// Function: hypot3()
// Status: DEPRECATED, use `norm([x,y,z])` instead.
// Description: Calculate hypotenuse length of 3D triangle.
// Arguments:
//   x = Length on the X axis.
//   y = Length on the Y axis.
//   z = Length on the Z axis.
function hypot3(x,y,z) = norm([x,y,z]);


// Function: distance()
// Status: DEPRECATED, use `norm(p2-p1)` instead.  It's shorter.
// Description: Returns the distance between a pair of 2D or 3D points.
function distance(p1, p2) = norm(point3d(p2)-point3d(p1));


// Function: sinh()
// Description: Takes a value `x`, and returns the hyperbolic sine of it.
function sinh(x) = (exp(x)-exp(-x))/2;


// Function: cosh()
// Description: Takes a value `x`, and returns the hyperbolic cosine of it.
function cosh(x) = (exp(x)+exp(-x))/2;


// Function: tanh()
// Description: Takes a value `x`, and returns the hyperbolic tangent of it.
function tanh(x) = sinh(x)/cosh(x);


// Function: asinh()
// Description: Takes a value `x`, and returns the inverse hyperbolic sine of it.
function asinh(x) = ln(x+sqrt(x*x+1));


// Function: acosh()
// Description: Takes a value `x`, and returns the inverse hyperbolic cosine of it.
function acosh(x) = ln(x+sqrt(x*x-1));


// Function: atanh()
// Description: Takes a value `x`, and returns the inverse hyperbolic tangent of it.
function atanh(x) = ln((1+x)/(1-x))/2;


// Function: sum()
// Description:
//   Returns the sum of all entries in the given array.
//   If passed an array of vectors, returns a vector of sums of each part.
// Arguments:
//   v = The vector to get the sum of.
// Example:
//   sum([1,2,3]);  // returns 6.
//   sum([[1,2,3], [3,4,5], [5,6,7]]);  // returns [9, 12, 15]
function sum(v, i=0, tot=undef) = i>=len(v)? tot : sum(v, i+1, ((tot==undef)? v[i] : tot+v[i]));


// Function: sum_of_squares()
// Description:
//   Returns the sum of the square of each element of a vector.
// Arguments:
//   v = The vector to get the sum of.
// Example:
//   sum_of_squares([1,2,3]);  // returns 14.
function sum_of_squares(v, i=0, tot=0) = sum(vmul(v,v));


// Function: sum_of_sines()
// Usage:
//   sum_of_sines(a,sines)
// Description:
//   Gives the sum of a series of sines, at a given angle.
// Arguments:
//   a = Angle to get the value for.
//   sines = List of [amplitude, frequency, offset] items, where the frequency is the number of times the cycle repeats around the circle.
function sum_of_sines(a, sines) =
	sum([
		for (s = sines) let(
			ss=point3d(s),
			v=ss.x*sin(a*ss.y+ss.z)
		) v
	]);


// Function: mean()
// Description:
//   Returns the mean of all entries in the given array.
//   If passed an array of vectors, returns a vector of mean of each part.
// Arguments:
//   v = The list of values to get the mean of.
// Example:
//   mean([2,3,4]);  // returns 3.
//   mean([[1,2,3], [3,4,5], [5,6,7]]);  // returns [3, 4, 5]
function mean(v) = sum(v)/len(v);


// Section: Comparisons and Logic


// Function: compare_vals()
// Usage:
//   compare_vals(a, b);
// Description:
//   Compares two values.  Lists are compared recursively.
//   Results are undefined if the two values are not of similar types.
// Arguments:
//   a = First value to compare.
//   b = Second value to compare.
function compare_vals(a, b) =
	(a==b)? 0 :
	(a==undef)? -1 :
	(b==undef)? 1 :
	((a==[] || a=="" || a[0]!=undef) && (b==[] || b=="" || b[0]!=undef))? (
		compare_lists(a, b)
	) : (a<b)? -1 :
	(a>b)? 1 : 0;


// Function: compare_lists()
// Usage:
//   compare_lists(a, b)
// Description:
//   Compare contents of two lists.
//   Returns <0 if `a`<`b`.
//   Returns 0 if `a`==`b`.
//   Returns >0 if `a`>`b`.
//   Results are undefined if elements are not of similar types.
// Arguments:
//   a = First list to compare.
//   b = Second list to compare.
function compare_lists(a, b, n=0) =
	let(
		// This curious construction enables tail recursion optimization.
		cmp = (a==b)? 0 :
			(len(a)<=n)? -1 :
			(len(b)<=n)? 1 :
			(a==a[n] || b==b[n])? (
				a<b? -1 : a>b? 1 : 0
			) : compare_vals(a[n], b[n])
	)
	(cmp != 0 || a==b)? cmp :
	compare_lists(a, b, n+1);


// Function: any()
// Description:
//   Returns true if any item in list `l` evaluates as true.
//   If `l` is a lists of lists, `any()` is applied recursively to each sublist.
// Arguments:
//   l = The list to test for true items.
// Example:
//   any([0,false,undef]);  // Returns false.
//   any([1,false,undef]);  // Returns true.
//   any([1,5,true]);       // Returns true.
//   any([[0,0], [0,0]]);   // Returns false.
//   any([[0,0], [1,0]]);   // Returns true.
function any(l, i=0, succ=false) =
	(i>=len(l) || succ)? succ :
	any(
		l, i=i+1, succ=(
			is_array(l[i])? any(l[i]) :
			!(!l[i])
		)
	);


// Function: all()
// Description:
//   Returns true if all items in list `l` evaluate as true.
//   If `l` is a lists of lists, `all()` is applied recursively to each sublist.
// Arguments:
//   l = The list to test for true items.
// Example:
//   all([0,false,undef]);  // Returns false.
//   all([1,false,undef]);  // Returns false.
//   all([1,5,true]);       // Returns true.
//   all([[0,0], [0,0]]);   // Returns false.
//   all([[0,0], [1,0]]);   // Returns false.
//   all([[1,1], [1,1]]);   // Returns true.
function all(l, i=0, fail=false) =
	(i>=len(l) || fail)? (!fail) :
	all(
		l, i=i+1, fail=(
			is_array(l[i])? !all(l[i]) :
			!l[i]
		)
	);


// Function: count_true()
// Usage:
//   count_true(l)
// Description:
//   Returns the number of items in `l` that evaluate as true.
//   If `l` is a lists of lists, this is applied recursively to each
//   sublist.  Returns the total count of items that evaluate as true
//   in all recursive sublists.
// Arguments:
//   l = The list to test for true items.
//   nmax = If given, stop counting if `nmax` items evaluate as true.
// Example:
//   count_true([0,false,undef]);  // Returns 0.
//   count_true([1,false,undef]);  // Returns 1.
//   count_true([1,5,false]);      // Returns 2.
//   count_true([1,5,true]);       // Returns 3.
//   count_true([[0,0], [0,0]]);   // Returns 0.
//   count_true([[0,0], [1,0]]);   // Returns 1.
//   count_true([[1,1], [1,1]]);   // Returns 4.
//   count_true([[1,1], [1,1]], nmax=3);  // Returns 3.
function count_true(l, nmax=undef, i=0, cnt=0) =
	(i>=len(l) || (nmax!=undef && cnt>=nmax))? cnt :
	count_true(
		l=l, nmax=nmax, i=i+1, cnt=cnt+(
			is_array(l[i])? count_true(l[i], nmax=nmax-cnt) :
			(l[i]? 1 : 0)
		)
	);



// Section: List/Array Operations


// Function: cdr()
// Status: DEPRECATED, use `slice(list,1,-1)` instead.
// Description: Returns all but the first item of a given array.
// Arguments:
//   list = The list to get the tail of.
function cdr(list) = len(list)<=1? [] : [for (i=[1:len(list)-1]) list[i]];


// Function: replist()
// Usage:
//   replist(val, n)
// Description:
//   Generates a list or array of `n` copies of the given `list`.
//   If the count `n` is given as a list of counts, then this creates a
//   multi-dimensional array, filled with `val`.
// Arguments:
//   val = The value to repeat to make the list or array.
//   n = The number of copies to make of `val`.
// Example:
//   replist(1, 4);        // Returns [1,1,1,1]
//   replist(8, [2,3]);    // Returns [[8,8,8], [8,8,8]]
//   replist(0, [2,2,3]);  // Returns [[[0,0,0],[0,0,0]], [[0,0,0],[0,0,0]]]
//   replist([1,2,3],3);   // Returns [[1,2,3], [1,2,3], [1,2,3]]
function replist(val, n, i=0) =
	is_scalar(n)? [for(j=[1:n]) val] :
	(i>=len(n))? val :
	[for (j=[1:n[i]]) replist(val, n, i+1)];


// Function: in_list()
// Description: Returns true if value `x` is in list `l`.
// Arguments:
//   x = The value to search for.
//   l = The list to search.
//   idx = If given, searches the given subindexes for matches for `x`.
// Example:
//   in_list("bar", ["foo", "bar", "baz"]);  // Returns true.
//   in_list("bee", ["foo", "bar", "baz"]);  // Returns false.
//   in_list("bar", [[2,"foo"], [4,"bar"], [3,"baz"]], idx=1);  // Returns true.
function in_list(x,l,idx=undef) = search([x], l, num_returns_per_match=1, index_col_num=idx) != [[]];


// Function: slice()
// Description:
//   Returns a slice of a list.  The first item is index 0.
//   Negative indexes are counted back from the end.  The last item is -1.
// Arguments:
//   arr = The array/list to get the slice of.
//   st = The index of the first item to return.
//   end = The index after the last item to return, unless negative, in which case the last item to return.
// Example:
//   slice([3,4,5,6,7,8,9], 3, 5);   // Returns [6,7]
//   slice([3,4,5,6,7,8,9], 2, -1);  // Returns [5,6,7,8,9]
//   slice([3,4,5,6,7,8,9], 1, 1);   // Returns []
//   slice([3,4,5,6,7,8,9], 6, -1);  // Returns [9]
//   slice([3,4,5,6,7,8,9], 2, -2);  // Returns [5,6,7,8]
function slice(arr,st,end) = let(
		s=st<0?(len(arr)+st):st,
		e=end<0?(len(arr)+end+1):end
	) (s==e)? [] : [for (i=[s:e-1]) if (e>s) arr[i]];


// Function: wrap_range()
// Status: DEPRECATED, use `select()` instead.
// Description:
//   Returns a portion of a list, wrapping around past the beginning, if end<start.
//   The first item is index 0. Negative indexes are counted back from the end.
//   The last item is -1.  If only the `start` index is given, returns just the value
//   at that position.
// Usage:
//   wrap_range(list,start)
//   wrap_range(list,start,end)
// Arguments:
//   list = The list to get the portion of.
//   start = The index of the first item.
//   end = The index of the last item.
function wrap_range(list, start, end=undef) = select(list,start,end);


// Function: select()
// Description:
//   Returns a portion of a list, wrapping around past the beginning, if end<start.
//   The first item is index 0. Negative indexes are counted back from the end.
//   The last item is -1.  If only the `start` index is given, returns just the value
//   at that position.
// Usage:
//   select(list,start)
//   select(list,start,end)
// Arguments:
//   list = The list to get the portion of.
//   start = The index of the first item.
//   end = The index of the last item.
// Example:
//   l = [3,4,5,6,7,8,9];
//   select(l, 5, 6);   // Returns [8,9]
//   select(l, 5, 8);   // Returns [8,9,3,4]
//   select(l, 5, 2);   // Returns [8,9,3,4,5]
//   select(l, -3, -1); // Returns [7,8,9]
//   select(l, 3, 3);   // Returns [6]
//   select(l, 4);      // Returns 7
//   select(l, -2);     // Returns 8
//   select(l, [1:3]);  // Returns [4,5,6]
//   select(l, [1,3]);  // Returns [4,6]
function select(list, start, end=undef) =
	let(l=len(list))
	(list==[])? [] :
	end==undef? (
		is_scalar(start)?
			let(s=(start%l+l)%l) list[s] :
			[for (i=start) list[(i%l+l)%l]]
	) : (
		let(s=(start%l+l)%l, e=(end%l+l)%l)
		(s<=e)?
			[for (i = [s:e]) list[i]] :
			concat([for (i = [s:l-1]) list[i]], [for (i = [0:e]) list[i]])
	);


// Function: reverse()
// Description: Reverses a list/array.
// Arguments:
//   list = The list to reverse.
// Example:
//   reverse([3,4,5,6]);  // Returns [6,5,4,3]
function reverse(list) = [ for (i = [len(list)-1 : -1 : 0]) list[i] ];


// Function: array_subindex()
// Description:
//   For each array item, return the indexed subitem.
//   Returns a list of the values of each vector at the specfied
//   index list or range.  If the index list or range has
//   only one entry the output list is flattened.
// Arguments:
//   v = The given list of lists.
//   idx = The index, list of indices, or range of indices to fetch.
// Example:
//   v = [[[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]];
//   array_subindex(v,2);      // Returns [3, 7, 11, 15]
//   array_subindex(v,[2,1]);  // Returns [[3, 2], [7, 6], [11, 10], [15, 14]]
//   array_subindex(v,[1:3]);  // Returns [[2, 3, 4], [6, 7, 8], [10, 11, 12], [14, 15, 16]]
function array_subindex(v, idx) = [
	for(val=v) let(value=[for(i=idx) val[i]])
		len(value)==1 ? value[0] : value
];


// Function: list_range()
// Usage:
//   list_range(n, [s], [e], [step])
//   list_range(e, [step])
//   list_range(s, e, [step])
// Description:
//   Returns a list, counting up from starting value `s`, by `step` increments,
//   until either `n` values are in the list, or it reaches the end value `e`.
// Arguments:
//   n = Desired number of values in returned list, if given.
//   s = Starting value.  Default: 0
//   e = Ending value to stop at, if given.
//   step = Amount to increment each value.  Default: 1
// Example:
//   list_range(4);                  // Returns [0,1,2,3]
//   list_range(n=4, step=2);        // Returns [0,2,4,6]
//   list_range(n=4, s=3, step=3);   // Returns [3,6,9,12]
//   list_range(n=5, s=0, e=10);     // Returns [0, 2.5, 5, 7.5, 10]
//   list_range(e=3);                // Returns [0,1,2,3]
//   list_range(e=6, step=2);        // Returns [0,2,4,6]
//   list_range(s=3, e=5);           // Returns [3,4,5]
//   list_range(s=3, e=8, step=2);   // Returns [3,5,7]
//   list_range(s=4, e=8, step=2);   // Returns [4,6,8]
//   list_range(n=4, s=[3,4], step=[2,3]);  // Returns [[3,4], [5,7], [7,10], [9,13]]
function list_range(n=undef, s=0, e=undef, step=1) =
	(n!=undef && e!=undef)? [for (i=[0:1:n-1]) s+(e-s)*i/(n-1)] :
	(n!=undef)? [for (i=[0:n-1]) let(v=s+step*i) v] :
	(e!=undef)? [for (v=[s:step:e]) v] :
	assertion(false, "Must supply one of `n` or `e`.");


// Function: array_shortest()
// Description:
//   Returns the length of the shortest sublist in a list of lists.
// Arguments:
//   vecs = A list of lists.
function array_shortest(vecs) = min([for (v = vecs) len(v)]);


// Function: array_longest()
// Description:
//   Returns the length of the longest sublist in a list of lists.
// Arguments:
//   vecs = A list of lists.
function array_longest(vecs) = max([for (v = vecs) len(v)]);


// Function: array_pad()
// Description:
//   If the list `v` is shorter than `minlen` length, pad it to length with the value given in `fill`.
// Arguments:
//   v = A list.
//   minlen = The minimum length to pad the list to.
//   fill = The value to pad the list with.
function array_pad(v, minlen, fill=undef) = let(l=len(v)) [for (i=[0:max(l,minlen)-1]) i<l? v[i] : fill];


// Function: array_trim()
// Description:
//   If the list `v` is longer than `maxlen` length, truncates it to be `maxlen` items long.
// Arguments:
//   v = A list.
//   minlen = The minimum length to pad the list to.
function array_trim(v, maxlen) = maxlen<1? [] : [for (i=[0:min(len(v),maxlen)-1]) v[i]];


// Function: array_fit()
// Description:
//   If the list `v` is longer than `length` items long, truncates it to be exactly `length` items long.
//   If the list `v` is shorter than `length` items long, pad it to length with the value given in `fill`.
// Arguments:
//   v = A list.
//   minlen = The minimum length to pad the list to.
//   fill = The value to pad the list with.
function array_fit(v, length, fill) = let(l=len(v)) (l==length)? v : (l>length)? array_trim(v,length) : array_pad(v,length,fill);


// Function: enumerate()
// Description:
//   Returns a list, with each item of the given list `l` numbered in a sublist.
//   Something like: `[[0,l[0]], [1,l[1]], [2,l[2]], ...]`
// Arguments:
//   l = List to enumerate.
//   idx = If given, enumerates just the given subindex items of `l`.
// Example:
//   enumerate(["a","b","c"]);  // Returns: [[0,"a"], [1,"b"], [2,"c"]]
//   enumerate([[88,"a"],[76,"b"],[21,"c"]], idx=1);  // Returns: [[0,"a"], [1,"b"], [2,"c"]]
//   enumerate([["cat","a",12],["dog","b",10],["log","c",14]], idx=[1:2]);  // Returns: [[0,"a",12], [1,"b",10], [2,"c",14]]
function enumerate(l,idx=undef) =
	(l==[])? [] :
	(idx==undef)?
		[for (i=[0:len(l)-1]) [i,l[i]]] :
		[for (i=[0:len(l)-1]) concat([i], [for (j=idx) l[i][j]])];


// Function: array_zip()
// Usage:
//   array_zip(v1, v2, v3, [fit], [fill]);
//   array_zip(vecs, [fit], [fill]);
// Description:
//   Zips together corresponding items from two or more lists.
//   Returns a list of lists, where each sublist contains corresponding
//   items from each of the input lists.  `[[A1, B1, C1], [A2, B2, C2], ...]`
// Arguments:
//   vecs = A list of two or more lists to zipper together.
//   fit = If `fit=="short"`, the zips together up to the length of the shortest list in vecs.  If `fit=="long"`, then pads all lists to the length of the longest, using the value in `fill`.  If `fit==false`, then requires all lists to be the same length.  Default: false.
//   fill = The default value to fill in with if one or more lists if short.  Default: undef
// Example:
//   v1 = [1,2,3,4];
//   v2 = [5,6,7];
//   v3 = [8,9,10,11];
//   array_zip(v1,v3);                       // returns [[1,8], [2,9], [3,10], [4,11]]
//   array_zip([v1,v3]);                     // returns [[1,8], [2,9], [3,10], [4,11]]
//   array_zip([v1,v2], fit="short");        // returns [[1,5], [2,6], [3,7]]
//   array_zip([v1,v2], fit="long");         // returns [[1,5], [2,6], [3,7], [4,undef]]
//   array_zip([v1,v2], fit="long, fill=0);  // returns [[1,5], [2,6], [3,7], [4,0]]
//   array_zip([v1,v2,v3], fit="long");      // returns [[1,5,8], [2,6,9], [3,7,10], [4,undef,11]]
// Example:
//   v1 = [[1,2,3], [4,5,6], [7,8,9]];
//   v2 = [[20,19,18], [17,16,15], [14,13,12]];
//   array_zip(v1,v2);    // Returns [[1,2,3,20,19,18], [4,5,6,17,16,15], [7,8,9,14,13,12]]
function array_zip(vecs, v2, v3, fit=false, fill=undef) =
	(v3!=undef)? array_zip([vecs,v2,v3], fit=fit, fill=fill) :
	(v2!=undef)? array_zip([vecs,v2], fit=fit, fill=fill) :
	let(
		dummy1 = assert_in_list("fit", fit, [false, "short", "long"]),
		minlen = array_shortest(vecs),
		maxlen = array_longest(vecs),
		dummy2 = (fit==false)? assertion(minlen==maxlen, "Input vectors must have the same length") : 0
	) (fit == "long")?
		[for(i=[0:maxlen-1]) [for(v=vecs) for(x=(i<len(v)? v[i] : (fill==undef)? [fill] : fill)) x] ] :
		[for(i=[0:minlen-1]) [for(v=vecs) for(x=v[i]) x] ];



// Function: array_group()
// Description:
//   Takes a flat array of values, and groups items in sets of `cnt` length.
//   The opposite of this is `flatten()`.
// Arguments:
//   v = The list of items to group.
//   cnt = The number of items to put in each grouping.
//   dflt = The default value to fill in with is the list is not a multiple of `cnt` items long.
// Example:
//   v = [1,2,3,4,5,6];
//   array_group(v,2) returns [[1,2], [3,4], [5,6]]
//   array_group(v,3) returns [[1,2,3], [4,5,6]]
//   array_group(v,4,0) returns [[1,2,3,4], [5,6,0,0]]
function array_group(v, cnt=2, dflt=0) = [for (i = [0:cnt:len(v)-1]) [for (j = [0:cnt-1]) default(v[i+j], dflt)]];


// Function: flatten()
// Description: Takes a list of lists and flattens it by one level.
// Arguments:
//   l = List to flatten.
// Example:
//   flatten([[1,2,3], [4,5,[6,7,8]]]) returns [1,2,3,4,5,[6,7,8]]
function flatten(l) = [for (a = l) for (b = a) b];


// Function: sort()
// Usage:
//   sort(arr, [idx])
// Description:
//   Sorts the given list using `compare_vals()`.  Results are undefined if list elements are not of similar type.
// Arguments:
//   arr = The list to sort.
//   idx = If given, the index, range, or list of indices of sublist items to compare.
// Example:
//   l = [45,2,16,37,8,3,9,23,89,12,34];
//   sorted = sort(l);  // Returns [2,3,8,9,12,16,23,34,37,45,89]
function sort(arr, idx=undef) =
	(len(arr)<=1) ? arr :
	let(
		pivot = arr[floor(len(arr)/2)],
		pivotval = idx==undef? pivot : [for (i=idx) pivot[i]],
		compare = [
			for (entry = arr) let(
				val = idx==undef? entry : [for (i=idx) entry[i]],
				cmp = compare_vals(val, pivotval)
			) cmp
		],
		lesser  = [ for (i = [0:len(arr)-1]) if (compare[i] < 0) arr[i] ],
		equal   = [ for (i = [0:len(arr)-1]) if (compare[i] ==0) arr[i] ],
		greater = [ for (i = [0:len(arr)-1]) if (compare[i] > 0) arr[i] ]
	)
	concat(sort(lesser,idx), equal, sort(greater,idx));


// Function: sortidx()
// Description:
//   Given a list, calculates the sort order of the list, and returns
//   a list of indexes into the original list in that sorted order.
//   If you iterate the returned list in order, and use the list items
//   to index into the original list, you will be iterating the original
//   values in sorted order.
// Example:
//   lst = ["d","b","e","c"];
//   idxs = sortidx(lst);  // Returns: [1,3,0,2]
//   ordered = [for (i=idxs) lst[i]];  // Returns: ["b", "c", "d", "e"]
// Example:
//   lst = [
//   	["foo", 88, [0,0,1], false],
//   	["bar", 90, [0,1,0], true],
//   	["baz", 89, [1,0,0], false],
//   	["qux", 23, [1,1,1], true]
//   ];
//   idxs1 = sortidx(lst, idx=1); // Returns: [3,0,2,1]
//   idxs2 = sortidx(lst, idx=0); // Returns: [1,2,0,3]
//   idxs3 = sortidx(lst, idx=[1,3]); // Returns: [3,0,2,1]
function sortidx(l, idx=undef) =
	(l==[])? [] :
	let(
		ll=enumerate(l,idx=idx),
		sidx = [1:len(ll[0])-1]
	)
	array_subindex(sort(ll, idx=sidx), 0);


// Function: unique()
// Usage:
//   unique(arr);
// Description:
//   Returns a sorted list with all repeated items removed.
// Arguments:
//   arr = The list to uniquify.
function unique(arr) =
	len(arr)<=1? arr : let(
		sorted = sort(arr)
	) [
		for (i=[0:len(sorted)-1])
			if (i==0 || (sorted[i] != sorted[i-1]))
				sorted[i]
	];



// Function: list_remove()
// Usage:
//   list_remove(list, elements)
// Description:
//   Remove all items from `list` whose indexes are in `elements`.
// Arguments:
//   list = The list to remove items from.
//   elements = The list of indexes of items to remove.
function list_remove(list, elements) = [
	for (i = [0:len(list)-1]) if (!search(i, elements)) list[i]
];



// Internal.  Not exposed.
function _array_dim_recurse(v) =
    !is_list(v[0])?  (
		sum( [for(entry=v) is_list(entry) ? 1 : 0]) == 0 ? [] : [undef]
	) : let(
		firstlen = len(v[0]),
		first = sum( [for(entry = v) len(entry) == firstlen  ? 0 : 1]   ) == 0 ? firstlen : undef,
		leveldown = flatten(v)
	) is_list(leveldown[0])? (
		concat([first],_array_dim_recurse(leveldown))
	) : [first];


// Function: array_dim()
// Usage:
//   array_dim(v, [depth])
// Description:
//   Returns the size of a multi-dimensional array.  Returns a list of
//   dimension lengths.  The length of `v` is the dimension `0`.  The
//   length of the items in `v` is dimension `1`.  The length of the
//   items in the items in `v` is dimension `2`, etc.  For each dimension,
//   if the length of items at that depth is inconsistent, `undef` will
//   be returned.  If no items of that dimension depth exist, `0` is
//   returned.  Otherwise, the consistent length of items in that
//   dimensional depth is returned.
// Arguments:
//   v = Array to get dimensions of.
//   depth = Dimension to get size of.  If not given, returns a list of dimension lengths.
// Examples:
//   array_dim([[[1,2,3],[4,5,6]],[[7,8,9],[10,11,12]]]);     // Returns [2,2,3]
//   array_dim([[[1,2,3],[4,5,6]],[[7,8,9],[10,11,12]]], 0);  // Returns 2
//   array_dim([[[1,2,3],[4,5,6]],[[7,8,9],[10,11,12]]], 2);  // Returns 3
//   array_dim([[[1,2,3],[4,5,6]],[[7,8,9]]]);                // Returns [2,undef,3]
function array_dim(v, depth=undef) =
	(depth == undef)? (
		concat([len(v)], _array_dim_recurse(v))
	) : (depth == 0)? (
		len(v)
	) : (
		let(dimlist = _array_dim_recurse(v))
		(depth > len(dimlist))? 0 : dimlist[depth-1]
	);



// Section: Vector Manipulation

// Function: vmul()
// Description:
//   Element-wise vector multiplication.  Multiplies each element of vector `v1` by
//   the corresponding element of vector `v2`.  Returns a vector of the products.
// Arguments:
//   v1 = The first vector.
//   v2 = The second vector.
// Example:
//   vmul([3,4,5], [8,7,6]);  // Returns [24, 28, 30]
function vmul(v1, v2) = [for (i = [0:len(v1)-1]) v1[i]*v2[i]];


// Function: vdiv()
// Description:
//   Element-wise vector division.  Divides each element of vector `v1` by
//   the corresponding element of vector `v2`.  Returns a vector of the quotients.
// Arguments:
//   v1 = The first vector.
//   v2 = The second vector.
// Example:
//   vdiv([24,28,30], [8,7,6]);  // Returns [3, 4, 5]
function vdiv(v1, v2) = [for (i = [0:len(v1)-1]) v1[i]/v2[i]];


// Function: vabs()
// Description: Returns a vector of the absolute value of each element of vector `v`.
// Arguments:
//   v = The vector to get the absolute values of.
function vabs(v) = [for (x=v) abs(x)];


// Function: normalize()
// Description:
//   Returns unit length normalized version of vector v.
// Arguments:
//   v = The vector to normalize.
function normalize(v) = v/norm(v);


// Function: vector2d_angle()
// Status: DEPRECATED, use `vector_angle()` instead.
// Usage:
//   vector2d_angle(v1,v2);
// Description:
//   Returns angle in degrees between two 2D vectors.
// Arguments:
//   v1 = First 2D vector.
//   v2 = Second 2D vector.
function vector2d_angle(v1,v2) = vector_angle(v1,v2);


// Function: vector3d_angle()
// Status: DEPRECATED, use `vector_angle()` instead.
// Usage:
//   vector3d_angle(v1,v2);
// Description:
//   Returns angle in degrees between two 3D vectors.
// Arguments:
//   v1 = First 3D vector.
//   v2 = Second 3D vector.
function vector3d_angle(v1,v2) = vector_angle(v1,v2);


// Function: vector_angle()
// Usage:
//   vector_angle(v1,v2);
// Description:
//   Returns angle in degrees between two vectors of similar dimensions.
// Arguments:
//   v1 = First vector.
//   v2 = Second vector.
// NOTE: constrain() corrects crazy FP rounding errors that exceed acos()'s domain.
function vector_angle(v1,v2) = acos(constrain((v1*v2)/(norm(v1)*norm(v2)), -1, 1));


// Function: vector_axis()
// Usage:
//   vector_xis(v1,v2);
// Description:
//   Returns the vector perpendicular to both of the given vectors.
// Arguments:
//   v1 = First vector.
//   v2 = Second vector.
function vector_axis(v1,v2) =
	let(
		eps = 1e-6,
		v1 = point3d(v1/norm(v1)),
		v2 = point3d(v2/norm(v2)),
		v3 = (norm(v1-v2) > eps && norm(v1+v2) > eps)? v2 :
			(norm(vabs(v2)-V_UP) > eps)? V_UP :
			V_RIGHT
	) normalize(cross(v1,v3));


// Section: Coordinates Manipulation

// Function: point2d()
// Description:
//   Returns a 2D vector/point from a 2D or 3D vector.
//   If given a 3D point, removes the Z coordinate.
// Arguments:
//   p = The coordinates to force into a 2D vector/point.
function point2d(p) = [for (i=[0:1]) (p[i]==undef)? 0 : p[i]];


// Function: path2d()
// Description:
//   Returns a list of 2D vectors/points from a list of 2D or 3D vectors/points.
//   If given a 3D point list, removes the Z coordinates from each point.
// Arguments:
//   points = A list of 2D or 3D points/vectors.
function path2d(points) = [for (point = points) point2d(point)];


// Function: point3d()
// Description:
//   Returns a 3D vector/point from a 2D or 3D vector.
// Arguments:
//   p = The coordinates to force into a 3D vector/point.
function point3d(p) = [for (i=[0:2]) (p[i]==undef)? 0 : p[i]];


// Function: path3d()
// Description:
//   Returns a list of 3D vectors/points from a list of 2D or 3D vectors/points.
// Arguments:
//   points = A list of 2D or 3D points/vectors.
function path3d(points) = [for (point = points) point3d(point)];


// Function: translate_points()
// Usage:
//   translate_points(pts, v);
// Description:
//   Moves each point in an array by a given amount.
// Arguments:
//   pts = List of points to translate.
//   v = Amount to translate points by.
function translate_points(pts, v=[0,0,0]) = [for (pt = pts) pt+v];


// Function: scale_points()
// Usage:
//   scale_points(pts, v, [cp]);
// Description:
//   Scales each point in an array by a given amount, around a given centerpoint.
// Arguments:
//   pts = List of points to scale.
//   v = A vector with a scaling factor for each axis.
//   cp = Centerpoint to scale around.
function scale_points(pts, v=[0,0,0], cp=[0,0,0]) = [for (pt = pts) [for (i = [0:len(pt)-1]) (pt[i]-cp[i])*v[i]+cp[i]]];


// Function: rotate_points2d()
// Usage:
//   rotate_points2d(pts, ang, [cp]);
// Description:
//   Rotates each 2D point in an array by a given amount, around an optional centerpoint.
// Arguments:
//   pts = List of 3D points to rotate.
//   ang = Angle to rotate by.
//   cp = 2D Centerpoint to rotate around.  Default: `[0,0]`
function rotate_points2d(pts, ang, cp=[0,0]) = let(
		m = matrix3_zrot(ang)
	) [for (pt = pts) m*point3d(pt-cp)+cp];


// Function: rotate_points3d()
// Usage:
//   rotate_points3d(pts, v, [cp], [reverse]);
//   rotate_points3d(pts, v, axis, [cp], [reverse]);
//   rotate_points3d(pts, from, to, v, [cp], [reverse]);
// Description:
//   Rotates each 3D point in an array by a given amount, around a given centerpoint.
// Arguments:
//   pts = List of points to rotate.
//   v = Rotation angle(s) in degrees.
//   axis = If given, axis vector to rotate around.
//   cp = Centerpoint to rotate around.
//   from = If given, the vector to rotate something from.  Used with `to`.
//   to = If given, the vector to rotate something to.  Used with `from`.
//   reverse = If true, performs an exactly reversed rotation.
function rotate_points3d(pts, v=0, cp=[0,0,0], axis=undef, from=undef, to=undef, reverse=false) =
	let(
		dummy = assertion(is_def(from)==is_def(to), "`from` and `to` must be given together."),
		mrot = reverse? (
			is_def(from)? (
				let (
					from = from / norm(from),
					to = to / norm(from),
					ang = vector_angle(from, to),
					axis = vector_axis(from, to)
				)
				matrix4_rot_by_axis(from, -v) * matrix4_rot_by_axis(axis, -ang)
			) : is_def(axis)? (
				matrix4_rot_by_axis(axis, -v)
			) : is_scalar(v)? (
				matrix4_zrot(-v)
			) : (
				matrix4_xrot(-v.x) * matrix4_yrot(-v.y) * matrix4_zrot(-v.z)
			)
		) : (
			is_def(from)? (
				let (
					from = from / norm(from),
					to = to / norm(from),
					ang = vector_angle(from, to),
					axis = vector_axis(from, to)
				)
				matrix4_rot_by_axis(axis, ang) * matrix4_rot_by_axis(from, v)
			) : is_def(axis)? (
				matrix4_rot_by_axis(axis, v)
			) : is_scalar(v)? (
				matrix4_zrot(v)
			) : (
				matrix4_zrot(v.z) * matrix4_yrot(v.y) * matrix4_xrot(v.x)
			)
		),
		m = matrix4_translate(cp) * mrot * matrix4_translate(-cp)
	) [for (pt = pts) point3d(m*concat(point3d(pt),[1]))];



// Function: rotate_points3d_around_axis()
// Status: DEPRECATED, use `rotate_points3d(pts, v=ang, axis=u, cp=cp)` instead.
// Usage:
//   rotate_points3d_around_axis(pts, ang, u, [cp])
// Description:
//   Rotates each 3D point in an array by a given amount, around a given centerpoint and axis.
// Arguments:
//   pts = List of 3D points to rotate.
//   ang = Angle to rotate by.
//   u = Vector of the axis to rotate around.
//   cp = 3D Centerpoint to rotate around.
function rotate_points3d_around_axis(pts, ang, u=[0,0,0], cp=[0,0,0]) = let(
		m = matrix4_rot_by_axis(u, ang)
	) [for (pt = pts) m*concat(point3d(pt)-cp, 0)+cp];


// Section: Coordinate Systems

// Function: polar_to_xy()
// Usage:
//   polar_to_xy(r, theta);
//   polar_to_xy([r, theta]);
// Description:
//   Convert polar coordinates to 2D cartesian coordinates.
//   Returns [X,Y] cartesian coordinates.
// Arguments:
//   r = distance from the origin.
//   theta = angle in degrees, counter-clockwise of X+.
// Examples:
//   xy = polar_to_xy(20,30);
//   xy = polar_to_xy([40,60]);
function polar_to_xy(r,theta=undef) = let(
		rad = theta==undef? r[0] : r,
		t = theta==undef? r[1] : theta
	) rad*[cos(t), sin(t)];


// Function: xy_to_polar()
// Usage:
//   xy_to_polar(x,y);
//   xy_to_polar([X,Y]);
// Description:
//   Convert 2D cartesian coordinates to polar coordinates.
//   Returns [radius, theta] where theta is the angle counter-clockwise of X+.
// Arguments:
//   x = X coordinate.
//   y = Y coordinate.
// Examples:
//   plr = xy_to_polar(20,30);
//   plr = xy_to_polar([40,60]);
function xy_to_polar(x,y=undef) = let(
		xx = y==undef? x[0] : x,
		yy = y==undef? x[1] : y
	) [norm([xx,yy]), atan2(yy,xx)];


// Function: xyz_to_planar()
// Usage:
//   xyz_to_planar(point, a, b, c);
// Description:
//   Given three points defining a plane, returns the projected planar
//   [X,Y] coordinates of the closest point to a 3D `point`.  The origin
//   of the planar coordinate system [0,0] will be at point `a`, and the
//   Y+ axis direction will be towards point `b`.  This coordinate system
//   can be useful in taking a set of nearly coplanar points, and converting
//   them to a pure XY set of coordinates for manipulation, before convering
//   them back to the original 3D plane.
function xyz_to_planar(point, a, b, c) = let(
	u = normalize(b-a),
	v = normalize(c-a),
	n = normalize(cross(u,v)),
	w = normalize(cross(n,u)),
	relpoint = point-a
) [relpoint * w, relpoint * u];


// Function: planar_to_xyz()
// Usage:
//   planar_to_xyz(point, a, b, c);
// Description:
//   Given three points defining a plane, converts a planar [X,Y]
//   coordinate to the actual corresponding 3D point on the plane.
//   The origin of the planar coordinate system [0,0] will be at point
//   `a`, and the Y+ axis direction will be towards point `b`.
function planar_to_xyz(point, a, b, c) = let(
	u = normalize(b-a),
	v = normalize(c-a),
	n = normalize(cross(u,v)),
	w = normalize(cross(n,u))
) a + point.x * w + point.y * u;


// Function: cylindrical_to_xyz()
// Usage:
//   cylindrical_to_xyz(r, theta, z)
//   cylindrical_to_xyz([r, theta, z])
// Description:
//   Convert cylindrical coordinates to 3D cartesian coordinates.  Returns [X,Y,Z] cartesian coordinates.
// Arguments:
//   r = distance from the Z axis.
//   theta = angle in degrees, counter-clockwise of X+ on the XY plane.
//   z = Height above XY plane.
// Examples:
//   xyz = cylindrical_to_xyz(20,30,40);
//   xyz = cylindrical_to_xyz([40,60,50]);
function cylindrical_to_xyz(r,theta=undef,z=undef) = let(
		rad = theta==undef? r[0] : r,
		t = theta==undef? r[1] : theta,
		zed = theta==undef? r[2] : z
	) [rad*cos(t), rad*sin(t), zed];


// Function: xyz_to_cylindrical()
// Usage:
//   xyz_to_cylindrical(x,y,z)
//   xyz_to_cylindrical([X,Y,Z])
// Description:
//   Convert 3D cartesian coordinates to cylindrical coordinates.
//   Returns [radius,theta,Z]. Theta is the angle counter-clockwise
//   of X+ on the XY plane.  Z is height above the XY plane.
// Arguments:
//   x = X coordinate.
//   y = Y coordinate.
//   z = Z coordinate.
// Examples:
//   cyl = xyz_to_cylindrical(20,30,40);
//   cyl = xyz_to_cylindrical([40,50,70]);
function xyz_to_cylindrical(x,y=undef,z=undef) = let(
		p = is_scalar(x)? [x, default(y,0), default(z,0)] : point3d(x)
	) [norm([p.x,p.y]), atan2(p.y,p.x), p.z];


// Function: spherical_to_xyz()
// Usage:
//   spherical_to_xyz(r, theta, phi);
//   spherical_to_xyz([r, theta, phi]);
// Description:
//   Convert spherical coordinates to 3D cartesian coordinates.
//   Returns [X,Y,Z] cartesian coordinates.
// Arguments:
//   r = distance from origin.
//   theta = angle in degrees, counter-clockwise of X+ on the XY plane.
//   phi = angle in degrees from the vertical Z+ axis.
// Examples:
//   xyz = spherical_to_xyz(20,30,40);
//   xyz = spherical_to_xyz([40,60,50]);
function spherical_to_xyz(r,theta=undef,phi=undef) = let(
		rad = theta==undef? r[0] : r,
		t = theta==undef? r[1] : theta,
		p = theta==undef? r[2] : phi
	) rad*[sin(p)*cos(t), sin(p)*sin(t), cos(p)];


// Function: xyz_to_spherical()
// Usage:
//   xyz_to_spherical(x,y,z)
//   xyz_to_spherical([X,Y,Z])
// Description:
//   Convert 3D cartesian coordinates to spherical coordinates.
//   Returns [r,theta,phi], where phi is the angle from the Z+ pole,
//   and theta is degrees counter-clockwise of X+ on the XY plane.
// Arguments:
//   x = X coordinate.
//   y = Y coordinate.
//   z = Z coordinate.
// Examples:
//   sph = xyz_to_spherical(20,30,40);
//   sph = xyz_to_spherical([40,50,70]);
function xyz_to_spherical(x,y=undef,z=undef) = let(
		p = is_scalar(x)? [x, default(y,0), default(z,0)] : point3d(x)
	) [norm(p), atan2(p.y,p.x), atan2(norm([p.x,p.y]),p.z)];


// Function: altaz_to_xyz()
// Usage:
//   altaz_to_xyz(alt, az, r);
//   altaz_to_xyz([alt, az, r]);
// Description:
//   Convert altitude/azimuth/range coordinates to 3D cartesian coordinates.
//   Returns [X,Y,Z] cartesian coordinates.
// Arguments:
//   alt = altitude angle in degrees above the XY plane.
//   az = azimuth angle in degrees clockwise of Y+ on the XY plane.
//   r = distance from origin.
// Examples:
//   xyz = altaz_to_xyz(20,30,40);
//   xyz = altaz_to_xyz([40,60,50]);
function altaz_to_xyz(alt,az=undef,r=undef) = let(
		p = az==undef? alt[0] : alt,
		t = 90 - (az==undef? alt[1] : az),
		rad = az==undef? alt[2] : r
	) rad*[cos(p)*cos(t), cos(p)*sin(t), sin(p)];


// Function: xyz_to_altaz()
// Usage:
//   xyz_to_altaz(x,y,z);
//   xyz_to_altaz([X,Y,Z]);
// Description:
//   Convert 3D cartesian coordinates to altitude/azimuth/range coordinates.
//   Returns [altitude,azimuth,range], where altitude is angle above the
//   XY plane, azimuth is degrees clockwise of Y+ on the XY plane, and
//   range is the distance from the origin.
// Arguments:
//   x = X coordinate.
//   y = Y coordinate.
//   z = Z coordinate.
// Examples:
//   aa = xyz_to_altaz(20,30,40);
//   aa = xyz_to_altaz([40,50,70]);
function xyz_to_altaz(x,y=undef,z=undef) = let(
		p = is_scalar(x)? [x, default(y,0), default(z,0)] : point3d(x)
	) [atan2(p.z,norm([p.x,p.y])), atan2(p.x,p.y), norm(p)];


// Section: Matrix Manipulation

// Function: ident()
// Description: Create an `n` by `n` identity matrix.
// Arguments:
//   n = The size of the identity matrix square, `n` by `n`.
function ident(n) = [for (i = [0:n-1]) [for (j = [0:n-1]) (i==j)?1:0]];



// Function: matrix_transpose()
// Description: Returns the transposition of the given matrix.
// Example:
//   m = [
//       [11,12,13,14],
//       [21,22,23,24],
//       [31,32,33,34],
//       [41,42,43,44]
//   ];
//   tm = matrix_transpose(m);
//   // Returns:
//   // [
//   //     [11,21,31,41],
//   //     [12,22,32,42],
//   //     [13,23,33,43],
//   //     [14,24,34,44]
//   // ]
function matrix_transpose(m) = [for (i=[0:len(m[0])-1]) [for (j=[0:len(m)-1]) m[j][i]]];



// Function: mat3_to_mat4()
// Description: Takes a 3x3 matrix and returns its 4x4 equivalent.
function mat3_to_mat4(m) = concat(
	[for (r = [0:2])
		concat(
			[for (c = [0:2]) m[r][c]],
			[0]
		)
	],
	[[0, 0, 0, 1]]
);



// Function: matrix3_translate()
// Description:
//   Returns the 3x3 matrix to perform a 2D translation.
// Arguments:
//   v = 2D Offset to translate by.  [X,Y]
function matrix3_translate(v) = [
	[1, 0, v.x],
	[0, 1, v.y],
	[0 ,0,   1]
];


// Function: matrix4_translate()
// Description:
//   Returns the 4x4 matrix to perform a 3D translation.
// Arguments:
//   v = 3D offset to translate by.  [X,Y,Z]
function matrix4_translate(v) = [
	[1, 0, 0, v.x],
	[0, 1, 0, v.y],
	[0, 0, 1, v.z],
	[0 ,0, 0,   1]
];


// Function: matrix3_scale()
// Description:
//   Returns the 3x3 matrix to perform a 2D scaling transformation.
// Arguments:
//   v = 2D vector of scaling factors.  [X,Y]
function matrix3_scale(v) = [
	[v.x,   0, 0],
	[  0, v.y, 0],
	[  0,   0, 1]
];


// Function: matrix4_scale()
// Description:
//   Returns the 4x4 matrix to perform a 3D scaling transformation.
// Arguments:
//   v = 3D vector of scaling factors.  [X,Y,Z]
function matrix4_scale(v) = [
	[v.x,   0,   0, 0],
	[  0, v.y,   0, 0],
	[  0,   0, v.z, 0],
	[  0,   0,   0, 1]
];


// Function: matrix3_zrot()
// Description:
//   Returns the 3x3 matrix to perform a rotation of a 2D vector around the Z axis.
// Arguments:
//   ang = Number of degrees to rotate.
function matrix3_zrot(ang) = [
	[cos(ang), -sin(ang), 0],
	[sin(ang),  cos(ang), 0],
	[       0,         0, 1]
];


// Function: matrix4_xrot()
// Description:
//   Returns the 4x4 matrix to perform a rotation of a 3D vector around the X axis.
// Arguments:
//   ang = number of degrees to rotate.
function matrix4_xrot(ang) = [
	[1,        0,         0,   0],
	[0, cos(ang), -sin(ang),   0],
	[0, sin(ang),  cos(ang),   0],
	[0,        0,         0,   1]
];


// Function: matrix4_yrot()
// Description:
//   Returns the 4x4 matrix to perform a rotation of a 3D vector around the Y axis.
// Arguments:
//   ang = Number of degrees to rotate.
function matrix4_yrot(ang) = [
	[ cos(ang), 0, sin(ang),   0],
	[        0, 1,        0,   0],
	[-sin(ang), 0, cos(ang),   0],
	[        0, 0,        0,   1]
];


// Function: matrix4_zrot()
// Usage:
//   matrix4_zrot(ang)
// Description:
//   Returns the 4x4 matrix to perform a rotation of a 3D vector around the Z axis.
// Arguments:
//   ang = number of degrees to rotate.
function matrix4_zrot(ang) = [
	[cos(ang), -sin(ang), 0, 0],
	[sin(ang),  cos(ang), 0, 0],
	[       0,         0, 1, 0],
	[       0,         0, 0, 1]
];


// Function: matrix4_rot_by_axis()
// Usage:
//   matrix4_rot_by_axis(u, ang);
// Description:
//   Returns the 4x4 matrix to perform a rotation of a 3D vector around an axis.
// Arguments:
//   u = 3D axis vector to rotate around.
//   ang = number of degrees to rotate.
function matrix4_rot_by_axis(u, ang) = let(
	u = normalize(u),
	c = cos(ang),
	c2 = 1-c,
	s = sin(ang)
) [
	[u[0]*u[0]*c2+c     , u[0]*u[1]*c2-u[2]*s, u[0]*u[2]*c2+u[1]*s, 0],
	[u[1]*u[0]*c2+u[2]*s, u[1]*u[1]*c2+c     , u[1]*u[2]*c2-u[0]*s, 0],
	[u[2]*u[0]*c2-u[1]*s, u[2]*u[1]*c2+u[0]*s, u[2]*u[2]*c2+c     , 0],
	[                  0,                   0,                   0, 1]
];


// Function: matrix3_skew()
// Usage:
//   matrix3_skew(xa, ya)
// Description:
//   Returns the 3x3 matrix to skew a 2D vector along the XY plane.
// Arguments:
//   xa = Skew angle, in degrees, in the direction of the X axis.
//   ya = Skew angle, in degrees, in the direction of the Y axis.
function matrix3_skew(xa, ya) = [
	[1,       tan(xa), 0],
	[tan(ya), 1,       0],
	[0,       0,       1]
];



// Function: matrix4_skew_xy()
// Usage:
//   matrix4_skew_xy(xa, ya)
// Description:
//   Returns the 4x4 matrix to perform a skew transformation along the XY plane..
// Arguments:
//   xa = Skew angle, in degrees, in the direction of the X axis.
//   ya = Skew angle, in degrees, in the direction of the Y axis.
function matrix4_skew_xy(xa, ya) = [
	[1, 0, tan(xa), 0],
	[0, 1, tan(ya), 0],
	[0, 0,       1, 0],
	[0, 0,       0, 1]
];



// Function: matrix4_skew_xz()
// Usage:
//   matrix4_skew_xz(xa, za)
// Description:
//   Returns the 4x4 matrix to perform a skew transformation along the XZ plane.
// Arguments:
//   xa = Skew angle, in degrees, in the direction of the X axis.
//   za = Skew angle, in degrees, in the direction of the Z axis.
function matrix4_skew_xz(xa, za) = [
	[1, tan(xa), 0, 0],
	[0,       1, 0, 0],
	[0, tan(za), 1, 0],
	[0,       0, 0, 1]
];


// Function: matrix4_skew_yz()
// Usage:
//   matrix4_skew_yz(ya, za)
// Description:
//   Returns the 4x4 matrix to perform a skew transformation along the YZ plane.
// Arguments:
//   ya = Skew angle, in degrees, in the direction of the Y axis.
//   za = Skew angle, in degrees, in the direction of the Z axis.
function matrix4_skew_yz(ya, za) = [
	[      1, 0, 0, 0],
	[tan(ya), 1, 0, 0],
	[tan(za), 0, 1, 0],
	[      0, 0, 0, 1]
];


// Function: matrix3_mult()
// Usage:
//   matrix3_mult(matrices)
// Description:
//   Returns a 3x3 transformation matrix which results from applying each matrix in `matrices` in order.
// Arguments:
//   matrices = A list of 3x3 matrices.
//   m = Optional starting matrix to apply everything to.
function matrix3_mult(matrices, m=ident(3), i=0) =
	(i>=len(matrices))? m :
	let (newmat = is_def(m)? matrices[i] * m : matrices[i])
		matrix3_mult(matrices, m=newmat, i=i+1);


// Function: matrix4_mult()
// Usage:
//   matrix4_mult(matrices)
// Description:
//   Returns a 4x4 transformation matrix which results from applying each matrix in `matrices` in order.
// Arguments:
//   matrices = A list of 4x4 matrices.
//   m = Optional starting matrix to apply everything to.
function matrix4_mult(matrices, m=ident(4), i=0) =
	(i>=len(matrices))? m :
	let (newmat = is_def(m)? matrices[i] * m : matrices[i])
		matrix4_mult(matrices, m=newmat, i=i+1);


// Function: matrix3_apply()
// Usage:
//   matrix3_apply(pts, matrices)
// Description:
//   Given a list of transformation matrices, applies them in order to the points in the point list.
// Arguments:
//   pts = A list of 2D points to transform.
//   matrices = A list of 3x3 matrices to apply, in order.
// Example:
//   npts = matrix3_apply(
//       pts = [for (x=[0:3]) [5*x,0]],
//       matrices =[
//           matrix3_scale([3,1]),
//           matrix3_rot(90),
//           matrix3_translate([5,5])
//       ]
//   );  // Returns [[5,5], [5,20], [5,35], [5,50]]
function matrix3_apply(pts, matrices) = let(m = matrix3_mult(matrices)) [for (p = pts) point2d(m * concat(point2d(p),[1]))];


// Function: matrix4_apply()
// Usage:
//   matrix4_apply(pts, matrices)
// Description:
//   Given a list of transformation matrices, applies them in order to the points in the point list.
// Arguments:
//   pts = A list of 3D points to transform.
//   matrices = A list of 4x4 matrices to apply, in order.
// Example:
//   npts = matrix4_apply(
//     pts = [for (x=[0:3]) [5*x,0,0]],
//     matrices =[
//       matrix4_scale([2,1,1]),
//       matrix4_zrot(90),
//       matrix4_translate([5,5,10])
//     ]
//   );  // Returns [[5,5,10], [5,15,10], [5,25,10], [5,35,10]]

function matrix4_apply(pts, matrices) = let(m = matrix4_mult(matrices)) [for (p = pts) point3d(m * concat(point3d(p),[1]))];


// Section: Geometry

// Function: point_on_segment()
// Usage:
//   point_on_segment(point, edge);
// Description:
//   Determine if the point is on the line segment between two points.
//   Returns true if yes, and false if not.
// Arguments:
//   point = The point to check colinearity of.
//   edge = Array of two points forming the line segment to test against.
function point_on_segment(point, edge) =
	point==edge[0] || point==edge[1] ||  // The point is an endpoint
	sign(edge[0].x-point.x)==sign(point.x-edge[1].x)  // point is in between the
		&& sign(edge[0].y-point.y)==sign(point.y-edge[1].y)  // edge endpoints
		&& point_left_of_segment(point, edge)==0;  // and on the line defined by edge


// Function: point_left_of_segment()
// Usage:
//   point_left_of_segment(point, edge);
// Description:
//   Return >0 if point is left of the line defined by edge.
//   Return =0 if point is on the line.
//   Return <0 if point is right of the line.
// Arguments:
//   point = The point to check position of.
//   edge = Array of two points forming the line segment to test against.
function point_left_of_segment(point, edge) =
	(edge[1].x-edge[0].x) * (point.y-edge[0].y) - (point.x-edge[0].x) * (edge[1].y-edge[0].y);


// Internal non-exposed function.
function _point_above_below_segment(point, edge) =
	edge[0].y <= point.y? (
		(edge[1].y > point.y && point_left_of_segment(point, edge) > 0)? 1 : 0
	) : (
		(edge[1].y <= point.y && point_left_of_segment(point, edge) < 0)? -1 : 0
	);


// Function: point_in_polygon()
// Usage:
//   point_in_polygon(point, path)
// Description:
//   This function tests whether the given point is inside, outside or on the boundary of
//   the specified polygon using the Winding Number method.  (http://geomalgorithms.com/a03-_inclusion.html)
//   The polygon is given as a list of points, not including the repeated end point.
//   Returns -1 if the point is outside the polyon.
//   Returns 0 if the point is on the boundary.
//   Returns 1 if the point lies in the interior.
//   The polygon does not need to be simple: it can have self-intersections.
//   But the polygon cannot have holes (it must be simply connected).
//   Rounding error may give mixed results for points on or near the boundary.
// Arguments:
//   point = The point to check position of.
//   path = The list of 2D path points forming the perimeter of the polygon.
function point_in_polygon(point, path) =
	// Does the point lie on any edges?  If so return 0.
	sum([for(i=[0:len(path)-1]) point_on_segment(point, select(path, i, i+1))?1:0])>0 ? 0 :
	// Otherwise compute winding number and return 1 for interior, -1 for exterior
	sum([for(i=[0:len(path)-1]) _point_above_below_segment(point, select(path, i, i+1))]) != 0 ? 1 : -1;


// Function: pointlist_bounds()
// Usage:
//   pointlist_bounds(pts);
// Description:
//   Finds the bounds containing all the points in pts.
//   Returns [[minx, miny, minz], [maxx, maxy, maxz]]
// Arguments:
//   pts = List of points.
function pointlist_bounds(pts) = [
	[for (a=[0:2]) min([ for (x=pts) point3d(x)[a] ]) ],
	[for (a=[0:2]) max([ for (x=pts) point3d(x)[a] ]) ]
];


// Function: triangle_area2d()
// Usage:
//   triangle_area2d(a,b,c);
// Description:
//   Returns the area of a triangle formed between three vertices.
//   Result will be negative if the points are in clockwise order.
// Examples:
//   triangle_area2d([0,0], [5,10], [10,0]);  // Returns -50
//   triangle_area2d([10,0], [5,10], [0,0]);  // Returns 50
function triangle_area2d(a,b,c) =
	(
		a.x * (b.y - c.y) +
		b.x * (c.y - a.y) +
		c.x * (a.y - b.y)
	) / 2;


// Function: right_of_line2d()
// Usage:
//   right_of_line2d(line, pt)
// Description:
//   Returns true if the given point is to the left of the given line.
// Arguments:
//   line = A list of two points.
//   pt = The point to test.
function right_of_line2d(line, pt) =
	triangle_area2d(line[0], line[1], pt) < 0;


// Function: collinear()
// Usage:
//   collinear(a, b, c, [eps]);
// Description:
//   Returns true if three points are co-linear.
// Arguments:
//   a = First point.
//   b = Second point.
//   c = Third point.
//   eps = Acceptable max angle variance.  Default: EPSILON (1e-9) degrees.
function collinear(a, b, c, eps=EPSILON) =
	abs(vector_angle(b-a,c-a)) < eps;


// Function: collinear_indexed()
// Usage:
//   collinear_indexed(points, a, b, c, [eps]);
// Description:
//   Returns true if three points are co-linear.
// Arguments:
//   points = A list of points.
//   a = Index in `points` of first point.
//   b = Index in `points` of second point.
//   c = Index in `points` of third point.
//   eps = Acceptable max angle variance.  Default: EPSILON (1e-9) degrees.
function collinear_indexed(points, a, b, c, eps=EPSILON) =
	let(
		p1=points[a],
		p2=points[b],
		p3=points[c]
	) abs(vector_angle(p2-p1,p3-p1)) < eps;


// Function: plane3pt()
// Usage:
//   plane3pt(p1, p2, p3);
// Description:
//   Generates the cartesian equation of a plane from three non-colinear points on the plane.
//   Returns [A,B,C,D] where Ax+By+Cz+D=0 is the equation of a plane.
// Arguments:
//   p1 = The first point on the plane.
//   p2 = The second point on the plane.
//   p3 = The third point on the plane.
function plane3pt(p1, p2, p3) =
	let(normal = normalize(cross(p3-p1, p2-p1))) concat(normal, [normal*p1]);


// Function: plane3pt_indexed()
// Usage:
//   plane3pt_indexed(points, i1, i2, i3);
// Description:
//   Given a list of points, and the indexes of three of those points,
//   generates the cartesian equation of a plane that those points all
//   lie on.  Requires that the three indexed points be non-collinear.
//   Returns [A,B,C,D] where Ax+By+Cz+D=0 is the equation of a plane.
// Arguments:
//   points = A list of points.
//   i1 = The index into `points` of the first point on the plane.
//   i2 = The index into `points` of the second point on the plane.
//   i3 = The index into `points` of the third point on the plane.
function plane3pt_indexed(points, i1, i2, i3) =
	let(
		p1 = points[i1],
		p2 = points[i2],
		p3 = points[i3],
		normal = normalize(cross(p3-p1, p2-p1))
	) concat(normal, [normal*p1]);


// Function: distance_from_plane()
// Usage:
//   distance_from_plane(plane, point)
// Description:
//   Given a plane as [A,B,C,D] where the cartesian equation for that plane
//   is Ax+By+Cz+D=0, determines how far from that plane the given point is.
//   The returned distance will be positive if the point is in front of the
//   plane; on the same side of the plane as the normal of that plane points
//   towards.  If the point is behind the plane, then the distance returned
//   will be negative.  The normal of the plane is the same as [A,B,C].
// Arguments:
//   plane = The [A,B,C,D] values for the equation of the plane.
//   point = The point to test.
function distance_from_plane(plane, point) =
	[plane.x, plane.y, plane.z] * point - plane[3];


// Function: coplanar()
// Usage:
//   coplanar(plane, point);
// Description:
//   Given a plane as [A,B,C,D] where the cartesian equation for that plane
//   is Ax+By+Cz+D=0, determines if the given point is on that plane.
//   Returns true if the point is on that plane.
// Arguments:
//   plane = The [A,B,C,D] values for the equation of the plane.
//   point = The point to test.
function coplanar(plane, point) =
	abs(distance_from_plane(plane, point)) <= EPSILON;


// Function: in_front_of_plane()
// Usage:
//   in_front_of_plane(plane, point);
// Description:
//   Given a plane as [A,B,C,D] where the cartesian equation for that plane
//   is Ax+By+Cz+D=0, determines if the given point is on the side of that
//   plane that the normal points towards.  The normal of the plane is the
//   same as [A,B,C].
// Arguments:
//   plane = The [A,B,C,D] values for the equation of the plane.
//   point = The point to test.
function in_front_of_plane(plane, point) =
	distance_from_plane(plane, point) > EPSILON;


// Function: simplify_path()
// Description:
//   Takes a path and removes unnecessary collinear points.
// Usage:
//   simplify_path(path, [eps])
// Arguments:
//   path = A list of 2D path points.
//   eps = Largest angle variance allowed.  Default: EPSILON (1-e9) degrees.
function simplify_path(path, eps=EPSILON, _a=0, _b=2, _acc=[]) =
	(_b >= len(path))? concat([path[0]], _acc, [path[len(path)-1]]) :
	simplify_path(
		path, eps,
		(collinear_indexed(path, _a, _b-1, _b, eps=eps)? _a : _b-1),
		_b+1,
		(collinear_indexed(path, _a, _b-1, _b, eps=eps)? _acc : concat(_acc, [path[_b-1]]))
	);


// Function: simplify_path_indexed()
// Description:
//   Takes a list of points, and a path as a list of indexes into `points`,
//   and removes all path points that are unecessarily collinear.
// Usage:
//   simplify_path_indexed(path, eps)
// Arguments:
//   points = A list of points.
//   path = A list of indexes into `points` that forms a path.
//   eps = Largest angle variance allowed.  Default: EPSILON (1-e9) degrees.
function simplify_path_indexed(points, path, eps=EPSILON, _a=0, _b=2, _acc=[]) =
	(_b >= len(path))? concat([path[0]], _acc, [path[len(path)-1]]) :
	simplify_path_indexed(
		points, path, eps,
		(collinear_indexed(points, path[_a], path[_b-1], path[_b], eps=eps)? _a : _b-1),
		_b+1,
		(collinear_indexed(points, path[_a], path[_b-1], path[_b], eps=eps)? _acc : concat(_acc, [path[_b-1]]))
	);


// vim: noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 nowrap



//////////////////////////////////////////////////////////////////////
// Section: Translations
//////////////////////////////////////////////////////////////////////


// Module: move()
//
// Description:
//   Moves/translates children.
//
// Usage:
//   move([x], [y], [z]) ...
//   move([x,y,z]) ...
//
// Arguments:
//   x = X axis translation.
//   y = Y axis translation.
//   z = Z axis translation.
//
// Example:
//   #sphere(d=10);
//   move([0,20,30]) sphere(d=10);
//
// Example:
//   #sphere(d=10);
//   move(y=20) sphere(d=10);
//
// Example:
//   #sphere(d=10);
//   move(x=-10, y=-5) sphere(d=10);
module move(a=[0,0,0], x=0, y=0, z=0)
{
	translate(a+[x,y,z]) children();
}


// Module: xmove()
//
// Description:
//   Moves/translates children the given amount along the X axis.
//
// Usage:
//   xmove(x) ...
//
// Arguments:
//   x = Amount to move right along the X axis.  Negative values move left.
//
// Example:
//   #sphere(d=10);
//   xmove(20) sphere(d=10);
module xmove(x=0) translate([x,0,0]) children();


// Module: ymove()
//
// Description:
//   Moves/translates children the given amount along the Y axis.
//
// Usage:
//   ymove(y) ...
//
// Arguments:
//   y = Amount to move back along the Y axis.  Negative values move forward.
//
// Example:
//   #sphere(d=10);
//   ymove(20) sphere(d=10);
module ymove(y=0) translate([0,y,0]) children();


// Module: zmove()
//
// Description:
//   Moves/translates children the given amount along the Z axis.
//
// Usage:
//   zmove(z) ...
//
// Arguments:
//   z = Amount to move up along the Z axis.  Negative values move down.
//
// Example:
//   #sphere(d=10);
//   zmove(20) sphere(d=10);
module zmove(z=0) translate([0,0,z]) children();


// Module: left()
//
// Description:
//   Moves children left (in the X- direction) by the given amount.
//
// Usage:
//   left(x) ...
//
// Arguments:
//   x = Scalar amount to move left.
//
// Example:
//   #sphere(d=10);
//   left(20) sphere(d=10);
module left(x=0) translate([-x,0,0]) children();


// Module: right()
//
// Description:
//   Moves children right (in the X+ direction) by the given amount.
//
// Usage:
//   right(x) ...
//
// Arguments:
//   x = Scalar amount to move right.
//
// Example:
//   #sphere(d=10);
//   right(20) sphere(d=10);
module right(x=0) translate([x,0,0]) children();


// Module: fwd() / forward()
//
// Description:
//   Moves children forward (in the Y- direction) by the given amount.
//
// Usage:
//   fwd(y) ...
//   forward(y) ...
//
// Arguments:
//   y = Scalar amount to move forward.
//
// Example:
//   #sphere(d=10);
//   fwd(20) sphere(d=10);
module forward(y=0) translate([0,-y,0]) children();
module fwd(y=0) translate([0,-y,0]) children();


// Module: back()
//
// Description:
//   Moves children back (in the Y+ direction) by the given amount.
//
// Usage:
//   back(y) ...
//
// Arguments:
//   y = Scalar amount to move back.
//
// Example:
//   #sphere(d=10);
//   back(20) sphere(d=10);
module back(y=0) translate([0,y,0]) children();


// Module: down()
//
// Description:
//   Moves children down (in the Z- direction) by the given amount.
//
// Usage:
//   down(z) ...
//
// Arguments:
//   z = Scalar amount to move down.
//
// Example:
//   #sphere(d=10);
//   down(20) sphere(d=10);
module down(z=0) translate([0,0,-z]) children();


// Module: up()
//
// Description:
//   Moves children up (in the Z+ direction) by the given amount.
//
// Usage:
//   up(z) ...
//
// Arguments:
//   z = Scalar amount to move up.
//
// Example:
//   #sphere(d=10);
//   up(20) sphere(d=10);
module up(z=0) translate([0,0,z]) children();



//////////////////////////////////////////////////////////////////////
// Section: Rotations
//////////////////////////////////////////////////////////////////////


// Module: rot()
//
// Description:
//   Rotates children around an arbitrary axis by the given number of degrees.
//   Can be used as a drop-in replacement for `rotate()`, with extra features.
//
// Usage:
//   rot(a, [cp], [reverse]) ...
//   rot([X,Y,Z], [cp], [reverse]) ...
//   rot(a, v, [cp], [reverse]) ...
//   rot(from, to, [a], [reverse]) ...
//
// Arguments:
//   a = Scalar angle or vector of XYZ rotation angles to rotate by, in degrees.
//   v = vector for the axis of rotation.  Default: [0,0,1] or V_UP
//   cp = centerpoint to rotate around. Default: [0,0,0]
//   from = Starting vector for vector-based rotations.
//   to = Target vector for vector-based rotations.
//   reverse = If true, exactly reverses the rotation, including axis rotation ordering.  Default: false
//
// Example:
//   #cube([2,4,9]);
//   rot([30,60,0], cp=[0,0,9]) cube([2,4,9]);
//
// Example:
//   #cube([2,4,9]);
//   rot(30, v=[1,1,0], cp=[0,0,9]) cube([2,4,9]);
//
// Example:
//   #cube([2,4,9]);
//   rot(from=V_UP, to=V_LEFT+V_BACK) cube([2,4,9]);
module rot(a=0, v=undef, cp=undef, from=undef, to=undef, reverse=false)
{
	if (is_def(cp)) {
		translate(cp) rot(a=a, v=v, from=from, to=to, reverse=reverse) translate(-cp) children();
	} else if (is_def(from)) {
		assertion(is_def(to), "`from` and `to` should be used together.");
		axis = vector_axis(from, to);
		ang = vector_angle(from, to);
		if (ang < 0.0001 && a == 0) {
			children();  // May be slightly faster?
		} else if (reverse) {
			rotate(a=-ang, v=axis) rotate(a=-a, v=from) children();
		} else {
			rotate(a=ang, v=axis) rotate(a=a, v=from) children();
		}
	} else if (a == 0) {
		children();  // May be slightly faster?
	} else if (reverse) {
		if (is_def(v)) {
			rotate(a=-a, v=v) children();
		} else if (is_scalar(a)) {
			rotate(-a) children();
		} else {
			rotate([-a[0],0,0]) rotate([0,-a[1],0]) rotate([0,0,-a[2]]) children();
		}
	} else {
		rotate(a=a, v=v) children();
	}
}


// Module: xrot()
//
// Description:
//   Rotates children around the X axis by the given number of degrees.
//
// Usage:
//   xrot(a, [cp]) ...
//
// Arguments:
//   a = angle to rotate by in degrees.
//   cp = centerpoint to rotate around. Default: [0,0,0]
//
// Example:
//   #cylinder(h=50, r=10, center=true);
//   xrot(90) cylinder(h=50, r=10, center=true);
module xrot(a=0, cp=undef)
{
	if (a==0) {
		children();  // May be slightly faster?
	} else if (is_def(cp)) {
		translate(cp) rotate([a, 0, 0]) translate(-cp) children();
	} else {
		rotate([a, 0, 0]) children();
	}
}


// Module: yrot()
//
// Description:
//   Rotates children around the Y axis by the given number of degrees.
//
// Usage:
//   yrot(a, [cp]) ...
//
// Arguments:
//   a = angle to rotate by in degrees.
//   cp = centerpoint to rotate around. Default: [0,0,0]
//
// Example:
//   #cylinder(h=50, r=10, center=true);
//   yrot(90) cylinder(h=50, r=10, center=true);
module yrot(a=0, cp=undef)
{
	if (a==0) {
		children();  // May be slightly faster?
	} else if (is_def(cp)) {
		translate(cp) rotate([0, a, 0]) translate(-cp) children();
	} else {
		rotate([0, a, 0]) children();
	}
}


// Module: zrot()
//
// Description:
//   Rotates children around the Z axis by the given number of degrees.
//
// Usage:
//   zrot(a, [cp]) ...
//
// Arguments:
//   a = angle to rotate by in degrees.
//   cp = centerpoint to rotate around. Default: [0,0,0]
//
// Example:
//   #cube(size=[60,20,40], center=true);
//   zrot(90) cube(size=[60,20,40], center=true);
module zrot(a=0, cp=undef)
{
	if (a==0) {
		children();  // May be slightly faster?
	} else if (is_def(cp)) {
		translate(cp) rotate(a) translate(-cp) children();
	} else {
		rotate(a) children();
	}
}



//////////////////////////////////////////////////////////////////////
// Section: Scaling and Mirroring
//////////////////////////////////////////////////////////////////////


// Module: xscale()
//
// Description:
//   Scales children by the given factor on the X axis.
//
// Usage:
//   xscale(x) ...
//
// Arguments:
//   x = Factor to scale by along the X axis.
//
// Example:
//   xscale(3) sphere(r=10);
module xscale(x) scale([x,1,1]) children();


// Module: yscale()
//
// Description:
//   Scales children by the given factor on the Y axis.
//
// Usage:
//   yscale(y) ...
//
// Arguments:
//   y = Factor to scale by along the Y axis.
//
// Example:
//   yscale(3) sphere(r=10);
module yscale(y) scale([1,y,1]) children();


// Module: zscale()
//
// Description:
//   Scales children by the given factor on the Z axis.
//
// Usage:
//   zscale(z) ...
//
// Arguments:
//   z = Factor to scale by along the Z axis.
//
// Example:
//   zscale(3) sphere(r=10);
module zscale(z) scale([1,1,z]) children();


// Module: xflip()
//
// Description:
//   Mirrors the children along the X axis, like `mirror([1,0,0])` or `xscale(-1)`
//
// Usage:
//   xflip([cp]) ...
//
// Arguments:
//   cp = A point that lies on the plane of reflection.
//
// Example:
//   xflip() yrot(90) cylinder(d1=10, d2=0, h=20);
//   color("blue", 0.25) cube([0.01,15,15], center=true);
//   color("red", 0.333) yrot(90) cylinder(d1=10, d2=0, h=20);
//
// Example:
//   xflip(cp=[-5,0,0]) yrot(90) cylinder(d1=10, d2=0, h=20);
//   color("blue", 0.25) left(5) cube([0.01,15,15], center=true);
//   color("red", 0.333) yrot(90) cylinder(d1=10, d2=0, h=20);
module xflip(cp=[0,0,0]) translate(cp) mirror([1,0,0]) translate(-cp) children();


// Module: yflip()
//
// Description:
//   Mirrors the children along the Y axis, like `mirror([0,1,0])` or `yscale(-1)`
//
// Usage:
//   yflip([cp]) ...
//
// Arguments:
//   cp = A point that lies on the plane of reflection.
//
// Example:
//   yflip() xrot(90) cylinder(d1=10, d2=0, h=20);
//   color("blue", 0.25) cube([15,0.01,15], center=true);
//   color("red", 0.333) xrot(90) cylinder(d1=10, d2=0, h=20);
//
// Example:
//   yflip(cp=[0,5,0]) xrot(90) cylinder(d1=10, d2=0, h=20);
//   color("blue", 0.25) back(5) cube([15,0.01,15], center=true);
//   color("red", 0.333) xrot(90) cylinder(d1=10, d2=0, h=20);
module yflip(cp=[0,0,0]) translate(cp) mirror([0,1,0]) translate(-cp) children();


// Module: zflip()
//
// Description:
//   Mirrors the children along the Z axis, like `mirror([0,0,1])` or `zscale(-1)`
//
// Usage:
//   zflip([cp]) ...
//
// Arguments:
//   cp = A point that lies on the plane of reflection.
//
// Example:
//   zflip() cylinder(d1=10, d2=0, h=20);
//   color("blue", 0.25) cube([15,15,0.01], center=true);
//   color("red", 0.333) cylinder(d1=10, d2=0, h=20);
//
// Example:
//   zflip(cp=[0,0,-5]) cylinder(d1=10, d2=0, h=20);
//   color("blue", 0.25) down(5) cube([15,15,0.01], center=true);
//   color("red", 0.333) cylinder(d1=10, d2=0, h=20);
module zflip(cp=[0,0,0]) translate(cp) mirror([0,0,1]) translate(-cp) children();



//////////////////////////////////////////////////////////////////////
// Section: Skewing
//////////////////////////////////////////////////////////////////////


// Module: skew_xy() / skew_z()
//
// Description:
//   Skews children on the X-Y plane, keeping constant in Z.
//
// Usage:
//   skew_xy([xa], [ya]) ...
//   skew_z([xa], [ya]) ...
//
// Arguments:
//   xa = skew angle towards the X direction.
//   ya = skew angle towards the Y direction.
//   planar = If true, this becomes a 2D operation.
//
// Example(FlatSpin):
//   #cube(size=10);
//   skew_xy(xa=30, ya=15) cube(size=10);
// Example(2D):
//   skew_xy(xa=15,ya=30,planar=true) square(30);
module skew_xy(xa=0, ya=0, planar=false) multmatrix(m = planar? matrix3_skew(xa, ya) : matrix4_skew_xy(xa, ya)) children();
module zskew(xa=0, ya=0, planar=false) multmatrix(m = planar? matrix3_skew(xa, ya) : matrix4_skew_xy(xa, ya)) children();


// Module: skew_yz() / skew_x()
//
// Description:
//   Skews children on the Y-Z plane, keeping constant in X.
//
// Usage:
//   skew_yz([ya], [za]) ...
//   skew_x([ya], [za]) ...
//
// Arguments:
//   ya = skew angle towards the Y direction.
//   za = skew angle towards the Z direction.
//
// Example(FlatSpin):
//   #cube(size=10);
//   skew_yz(ya=30, za=15) cube(size=10);
module skew_yz(ya=0, za=0) multmatrix(m = matrix4_skew_yz(ya, za)) children();
module xskew(ya=0, za=0) multmatrix(m = matrix4_skew_yz(ya, za)) children();


// Module: skew_xz() / skew_y()
//
// Description:
//   Skews children on the X-Z plane, keeping constant in Y.
//
// Usage:
//   skew_xz([xa], [za]) ...
//   skew_y([xa], [za]) ...
//
// Arguments:
//   xa = skew angle towards the X direction.
//   za = skew angle towards the Z direction.
//
// Example(FlatSpin):
//   #cube(size=10);
//   skew_xz(xa=15, za=-10) cube(size=10);
module skew_xz(xa=0, za=0) multmatrix(m = matrix4_skew_xz(xa, za)) children();
module yskew(xa=0, za=0) multmatrix(m = matrix4_skew_xz(xa, za)) children();



//////////////////////////////////////////////////////////////////////
// Section: Translational Distributors
//////////////////////////////////////////////////////////////////////


// Module: place_copies()
//
// Description:
//   Makes copies of the given children at each of the given offsets.
//
// Usage:
//   place_copies(a) ...
//
// Arguments:
//   a = array of XYZ offset vectors. Default [[0,0,0]]
//
// Side Effects:
//   `$pos` is set to the relative centerpoint of each child copy, and can be used to modify each child individually.
//
// Example:
//   #sphere(r=10);
//   place_copies([[-25,-25,0], [25,-25,0], [0,0,50], [0,25,0]]) sphere(r=10);
module place_copies(a=[[0,0,0]])
{
	for (off = a) translate(off) children();
}


// Module: translate_copies()
// Status: DEPRECATED, use `place_copies()` instead.
//
// Description:
//   Makes copies of the given children at each of the given offsets.
//
// Usage:
//   translate_copies(a) ...
//
// Arguments:
//   a = array of XYZ offset vectors. Default [[0,0,0]]
//
// Side Effects:
//   `$pos` is set to the relative centerpoint of each child copy, and can be used to modify each child individually.
module translate_copies(a=[[0,0,0]])
{
	deprecate("translate_copies()", "place_copies()");
	place_copies(a) children();
}


// Module: line_of()
// Status: DEPRECATED, use `spread(p1,p2)` instead
//
// Description:
//   Evenly distributes n duplicate children along an XYZ line.
//
// Usage:
//   line_of(p1, p2, [n]) ...
//
// Arguments:
//   p1 = starting point of line.  (Default: [0,0,0])
//   p2 = ending point of line.  (Default: [10,0,0])
//   n = number of copies to distribute along the line. (Default: 2)
//
// Side Effects:
//   `$pos` is set to the relative centerpoint of each child copy, and can be used to modify each child individually.
module line_of(p1=[0,0,0], p2=[10,0,0], n=2)
{
	deprecate("line_of()", "spread()");
	spread(p1=p1, p2=p2, n=n) children();
}



// Module: spread()
//
// Description:
//   Evenly distributes `n` copies of all children along a line.
//   Copies every child at each position.
//
// Usage:
//   spread(l, [n], [p1]) ...
//   spread(l, spacing, [p1]) ...
//   spread(spacing, [n], [p1]) ...
//   spread(p1, p2, [n]) ...
//   spread(p1, p2, spacing) ...
//
// Arguments:
//   p1 = Starting point of line.
//   p2 = Ending point of line.
//   l = Length to spread copies over.
//   spacing = A 3D vector indicating which direction and distance to place each subsequent copy at.
//   n = Number of copies to distribute along the line. (Default: 2)
//
// Side Effects:
//   `$pos` is set to the relative centerpoint of each child copy, and can be used to modify each child individually.
//   `$idx` is set to the index number of each child being copied.
//
// Example(FlatSpin):
//   spread([0,0,0], [5,5,20], n=6) cube(size=[3,2,1],center=true);
// Examples:
//   spread(l=40, n=6) cube(size=[3,2,1],center=true);
//   spread(l=[15,30], n=6) cube(size=[3,2,1],center=true);
//   spread(l=40, spacing=10) cube(size=[3,2,1],center=true);
//   spread(spacing=[5,5,0], n=5) cube(size=[3,2,1],center=true);
// Example:
//   spread(l=20, n=3) {
//       cube(size=[1,3,1],center=true);
//       cube(size=[3,1,1],center=true);
//   }
module spread(p1, p2, spacing, l, n)
{
	ll = (
		is_def(l)? scalar_vec3(l, 0) :
		(is_def(spacing) && is_def(n))? (n * scalar_vec3(spacing, 0)) :
		(is_def(p1) && is_def(p2))? point3d(p2-p1) :
		undef
	);
	cnt = (
		is_def(n)? n :
		(is_def(spacing) && is_def(ll))? floor(norm(ll) / norm(scalar_vec3(spacing, 0)) + 1.000001) :
		2
	);
	spc = (
		!is_def(spacing)? (ll/(cnt-1)) :
		is_scalar(spacing) && is_def(ll)? (ll/(cnt-1)) :
		scalar_vec3(spacing, 0)
	);
	assertion(is_def(cnt), "Need two of `spacing`, 'l', 'n', or `p1`/`p2` arguments in `spread()`.");
	spos = is_def(p1)? point3d(p1) : -(cnt-1)/2 * spc;
	for (i=[0 : cnt-1]) {
		pos = i * spc + spos;
		$pos = pos;
		$idx = i;
		translate(pos) children();
	}
}


// Module: xspread()
//
// Description:
//   Spreads out `n` copies of the children along a line on the X axis.
//
// Usage:
//   xspread(spacing, [n], [sp]) ...
//   xspread(l, [n], [sp]) ...
//
// Arguments:
//   spacing = spacing between copies. (Default: 1.0)
//   n = Number of copies to spread out. (Default: 2)
//   l = Length to spread copies over.
//   sp = If given, copies will be spread on a line to the right of starting position `sp`.  If not given, copies will be spread along a line that is centered at [0,0,0].
//
// Side Effects:
//   `$pos` is set to the relative centerpoint of each child copy, and can be used to modify each child individually.
//   `$idx` is set to the index number of each child being copied.
//
// Examples:
//   xspread(20) sphere(3);
//   xspread(20, n=3) sphere(3);
//   xspread(spacing=15, l=50) sphere(3);
//   xspread(n=4, l=30, sp=[0,10,0]) sphere(3);
// Example:
//   xspread(10, n=3) {
//       cube(size=[1,3,1],center=true);
//       cube(size=[3,1,1],center=true);
//   }
module xspread(spacing=undef, n=undef, l=undef, sp=undef)
{
	spread(
		l=is_undef(l)? l : l*V_RIGHT,
		spacing=is_undef(spacing)? spacing : spacing*V_RIGHT,
		n=n, p1=sp
	) children();
}


// Module: yspread()
//
// Description:
//   Spreads out `n` copies of the children along a line on the Y axis.
//
// Usage:
//   yspread(spacing, [n], [sp]) ...
//   yspread(l, [n], [sp]) ...
//
// Arguments:
//   spacing = spacing between copies. (Default: 1.0)
//   n = Number of copies to spread out. (Default: 2)
//   l = Length to spread copies over.
//   sp = If given, copies will be spread on a line back from starting position `sp`.  If not given, copies will be spread along a line that is centered at [0,0,0].
//
// Side Effects:
//   `$pos` is set to the relative centerpoint of each child copy, and can be used to modify each child individually.
//   `$idx` is set to the index number of each child being copied.
//
// Examples:
//   yspread(20) sphere(3);
//   yspread(20, n=3) sphere(3);
//   yspread(spacing=15, l=50) sphere(3);
//   yspread(n=4, l=30, sp=[10,0,0]) sphere(3);
// Example:
//   yspread(10, n=3) {
//       cube(size=[1,3,1],center=true);
//       cube(size=[3,1,1],center=true);
//   }
module yspread(spacing=undef, n=undef, l=undef, sp=undef)
{
	spread(
		l=is_undef(l)? l : l*V_BACK,
		spacing=is_undef(spacing)? spacing : spacing*V_BACK,
		n=n, p1=sp
	) children();
}


// Module: zspread()
//
// Description:
//   Spreads out `n` copies of the children along a line on the Z axis.
//
// Usage:
//   zspread(spacing, [n], [sp]) ...
//   zspread(l, [n], [sp]) ...
//
// Arguments:
//   spacing = spacing between copies. (Default: 1.0)
//   n = Number of copies to spread out. (Default: 2)
//   l = Length to spread copies over.
//   sp = If given, copies will be spread on a line up from starting position `sp`.  If not given, copies will be spread along a line that is centered at [0,0,0].
//
// Side Effects:
//   `$pos` is set to the relative centerpoint of each child copy, and can be used to modify each child individually.
//   `$idx` is set to the index number of each child being copied.
//
// Examples:
//   zspread(20) sphere(3);
//   zspread(20, n=3) sphere(3);
//   zspread(spacing=15, l=50) sphere(3);
//   zspread(n=4, l=30, sp=[10,0,0]) sphere(3);
// Example:
//   zspread(10, n=3) {
//       cube(size=[1,3,1],center=true);
//       cube(size=[3,1,1],center=true);
//   }
module zspread(spacing=undef, n=undef, l=undef, sp=undef)
{
	spread(
		l=is_undef(l)? l : l*V_UP,
		spacing=is_undef(spacing)? spacing : spacing*V_UP,
		n=n, p1=sp
	) children();
}



// Module: distribute()
//
// Description:
//   Spreads out each individual child along the direction `dir`.
//   Every child is placed at a different position, in order.
//   This is useful for laying out groups of disparate objects
//   where you only really care about the spacing between them.
//
// Usage:
//   distribute(spacing, dir, [sizes]) ...
//   distribute(l, dir, [sizes]) ...
//
// Arguments:
//   spacing = Spacing to add between each child. (Default: 10.0)
//   sizes = Array containing how much space each child will need.
//   dir = Vector direction to distribute copies along.
//   l = Length to distribute copies along.
//
// Side Effect:
//   `$pos` is set to the relative centerpoint of each child copy, and can be used to modify each child individually.
//   `$idx` is set to the index number of each child being copied.
//
// Example:
//   distribute(sizes=[100, 30, 50], dir=V_UP) {
//       sphere(r=50);
//       cube([10,20,30], center=true);
//       cylinder(d=30, h=50, center=true);
//   }
module distribute(spacing=undef, sizes=undef, dir=V_RIGHT, l=undef)
{
	gaps = ($children < 2)? [0] :
		is_def(sizes)? [for (i=[0:$children-2]) sizes[i]/2 + sizes[i+1]/2] :
		[for (i=[0:$children-2]) 0];
	spc = is_def(l)? ((l - sum(gaps)) / ($children-1)) : default(spacing, 10);
	gaps2 = [for (gap = gaps) gap+spc];
	spos = dir * -sum(gaps2)/2;
	for (i=[0:$children-1]) {
		totspc = sum(concat([0], slice(gaps2, 0, i)));
		$pos = spos + totspc * dir;
		$idx = i;
		translate($pos) children(i);
	}
}


// Module: xdistribute()
//
// Description:
//   Spreads out each individual child along the X axis.
//   Every child is placed at a different position, in order.
//   This is useful for laying out groups of disparate objects
//   where you only really care about the spacing between them.
//
// Usage:
//   xdistribute(spacing, [sizes]) ...
//   xdistribute(l, [sizes]) ...
//
// Arguments:
//   spacing = spacing between each child. (Default: 10.0)
//   sizes = Array containing how much space each child will need.
//   l = Length to distribute copies along.
//
// Side Effect:
//   `$pos` is set to the relative centerpoint of each child copy, and can be used to modify each child individually.
//   `$idx` is set to the index number of each child being copied.
//
// Example:
//   xdistribute(sizes=[100, 10, 30], spacing=40) {
//       sphere(r=50);
//       cube([10,20,30], center=true);
//       cylinder(d=30, h=50, center=true);
//   }
module xdistribute(spacing=10, sizes=undef, l=undef)
{
	dir = V_RIGHT;
	gaps = ($children < 2)? [0] :
		is_def(sizes)? [for (i=[0:$children-2]) sizes[i]/2 + sizes[i+1]/2] :
		[for (i=[0:$children-2]) 0];
	spc = is_def(l)? ((l - sum(gaps)) / ($children-1)) : default(spacing, 10);
	gaps2 = [for (gap = gaps) gap+spc];
	spos = dir * -sum(gaps2)/2;
	for (i=[0:$children-1]) {
		totspc = sum(concat([0], slice(gaps2, 0, i)));
		$pos = spos + totspc * dir;
		$idx = i;
		translate($pos) children(i);
	}
}


// Module: ydistribute()
//
// Description:
//   Spreads out each individual child along the Y axis.
//   Every child is placed at a different position, in order.
//   This is useful for laying out groups of disparate objects
//   where you only really care about the spacing between them.
//
// Usage:
//   ydistribute(spacing, [sizes])
//   ydistribute(l, [sizes])
//
// Arguments:
//   spacing = spacing between each child. (Default: 10.0)
//   sizes = Array containing how much space each child will need.
//   l = Length to distribute copies along.
//
// Side Effect:
//   `$pos` is set to the relative centerpoint of each child copy, and can be used to modify each child individually.
//   `$idx` is set to the index number of each child being copied.
//
// Example:
//   ydistribute(sizes=[30, 20, 100], spacing=40) {
//       cylinder(d=30, h=50, center=true);
//       cube([10,20,30], center=true);
//       sphere(r=50);
//   }
module ydistribute(spacing=10, sizes=undef, l=undef)
{
	dir = V_BACK;
	gaps = ($children < 2)? [0] :
		is_def(sizes)? [for (i=[0:$children-2]) sizes[i]/2 + sizes[i+1]/2] :
		[for (i=[0:$children-2]) 0];
	spc = is_def(l)? ((l - sum(gaps)) / ($children-1)) : default(spacing, 10);
	gaps2 = [for (gap = gaps) gap+spc];
	spos = dir * -sum(gaps2)/2;
	for (i=[0:$children-1]) {
		totspc = sum(concat([0], slice(gaps2, 0, i)));
		$pos = spos + totspc * dir;
		$idx = i;
		translate($pos) children(i);
	}
}


// Module: zdistribute()
//
// Description:
//   Spreads out each individual child along the Z axis.
//   Every child is placed at a different position, in order.
//   This is useful for laying out groups of disparate objects
//   where you only really care about the spacing between them.
//
// Usage:
//   zdistribute(spacing, [sizes])
//   zdistribute(l, [sizes])
//
// Arguments:
//   spacing = spacing between each child. (Default: 10.0)
//   sizes = Array containing how much space each child will need.
//   l = Length to distribute copies along.
//
// Side Effect:
//   `$pos` is set to the relative centerpoint of each child copy, and can be used to modify each child individually.
//   `$idx` is set to the index number of each child being copied.
//
// Example:
//   zdistribute(sizes=[30, 20, 100], spacing=40) {
//       cylinder(d=30, h=50, center=true);
//       cube([10,20,30], center=true);
//       sphere(r=50);
//   }
module zdistribute(spacing=10, sizes=undef, l=undef)
{
	dir = V_UP;
	gaps = ($children < 2)? [0] :
		is_def(sizes)? [for (i=[0:$children-2]) sizes[i]/2 + sizes[i+1]/2] :
		[for (i=[0:$children-2]) 0];
	spc = is_def(l)? ((l - sum(gaps)) / ($children-1)) : default(spacing, 10);
	gaps2 = [for (gap = gaps) gap+spc];
	spos = dir * -sum(gaps2)/2;
	for (i=[0:$children-1]) {
		totspc = sum(concat([0], slice(gaps2, 0, i)));
		$pos = spos + totspc * dir;
		$idx = i;
		translate($pos) children(i);
	}
}



// Module: grid2d()
//
// Description:
//   Makes a square or hexagonal grid of copies of children.
//
// Usage:
//   grid2d(size, spacing, [stagger], [scale], [in_poly], [orient], [align]) ...
//   grid2d(size, cols, rows, [stagger], [scale], [in_poly], [orient], [align]) ...
//   grid2d(spacing, cols, rows, [stagger], [scale], [in_poly], [orient], [align]) ...
//   grid2d(spacing, in_poly, [stagger], [scale], [orient], [align]) ...
//   grid2d(cols, rows, in_poly, [stagger], [scale], [orient], [align]) ...
//
// Arguments:
//   size = The [X,Y] size to spread the copies over.
//   spacing = Distance between copies in [X,Y] or scalar distance.
//   cols = How many columns of copies to make.  If staggered, count both staggered and unstaggered columns.
//   rows = How many rows of copies to make.  If staggered, count both staggered and unstaggered rows.
//   stagger = If true, make a staggered (hexagonal) grid.  If false, make square grid.  If "alt", makes alternate staggered pattern.  Default: false
//   scale = [X,Y] scaling factors to reshape grid.
//   in_poly = If given a list of polygon points, only creates copies whose center would be inside the polygon.  Polygon can be concave and/or self crossing.
//   orient = Orientation axis for the grid.  Orientation is NOT applied to individual children.
//   align = Alignment of the grid.  Alignment is NOT applies to individual children.
//
// Side Effects:
//   `$pos` is set to the relative centerpoint of each child copy, and can be used to modify each child individually.
//   `$col` is set to the integer column number for each child.
//   `$row` is set to the integer row number for each child.
//
// Examples:
//   grid2d(size=50, spacing=10, stagger=false) cylinder(d=10, h=1);
//   grid2d(spacing=10, rows=7, cols=13, stagger=true) cylinder(d=6, h=5);
//   grid2d(spacing=10, rows=7, cols=13, stagger="alt") cylinder(d=6, h=5);
//   grid2d(size=50, rows=11, cols=11, stagger=true) cylinder(d=5, h=1);
//
// Example:
//   poly = [[-25,-25], [25,25], [-25,25], [25,-25]];
//   grid2d(spacing=5, stagger=true, in_poly=poly)
//      zrot(180/6) cylinder(d=5, h=1, $fn=6);
//   %polygon(poly);
//
// Example:
//   // Makes a grid of hexagon pillars whose tops are all angled
//   // to reflect light at [0,0,50], if they were reflective.
//   use <BOSL/math.scad>
//   hexregion = [for (a = [0:60:359.9]) 50.01*[cos(a), sin(a)]];
//   grid2d(spacing=10, stagger=true, in_poly=hexregion) {
//       // Note: You must use for(var=[val]) or let(var=val)
//       // to set vars from $pos or other special vars in this scope.
//       let (ref_v = (normalize([0,0,50]-point3d($pos)) + V_UP)/2)
//           half_of(v=-ref_v, cp=[0,0,5])
//               zrot(180/6)
//                   cylinder(h=20, d=10/cos(180/6)+0.01, $fn=6);
//   }
module grid2d(size=undef, spacing=undef, cols=undef, rows=undef, stagger=false, scale=[1,1,1], in_poly=undef, orient=ORIENT_Z, align=V_CENTER)
{
	assert_in_list("stagger", stagger, [false, true, "alt"]);
	scl = vmul(scalar_vec3(scale, 1), (stagger!=false? [0.5, sin(60), 0] : [1,1,0]));
	if (is_def(size)) {
		siz = scalar_vec3(size);
		if (is_def(spacing)) {
			spc = vmul(scalar_vec3(spacing), scl);
			maxcols = ceil(siz[0]/spc[0]);
			maxrows = ceil(siz[1]/spc[1]);
			grid2d(spacing=spacing, cols=maxcols, rows=maxrows, stagger=stagger, scale=scale, in_poly=in_poly, orient=orient, align=align) children();
		} else {
			spc = [siz[0]/cols, siz[1]/rows, 0];
			grid2d(spacing=spc, cols=cols, rows=rows, stagger=stagger, scale=scale, in_poly=in_poly, orient=orient, align=align) children();
		}
	} else {
		spc = is_array(spacing)? spacing : vmul(scalar_vec3(spacing), scl);
		bounds = is_def(in_poly)? pointlist_bounds(in_poly) : undef;
		bnds = is_def(bounds)? [for (a=[0:1]) 2*max(vabs([ for (i=[0,1]) bounds[i][a] ]))+1 ] : undef;
		mcols = is_def(cols)? cols : (is_def(spc) && is_def(bnds))? quantup(ceil(bnds[0]/spc[0])-1, 4)+1 : undef;
		mrows = is_def(rows)? rows : (is_def(spc) && is_def(bnds))? quantup(ceil(bnds[1]/spc[1])-1, 4)+1 : undef;
		siz = vmul(spc, [mcols-1, mrows-1, 0]);
		staggermod = (stagger == "alt")? 1 : 0;
		if (stagger == false) {
			orient_and_align(siz, orient, align) {
				for (row = [0:mrows-1]) {
					for (col = [0:mcols-1]) {
						pos = [col*spc[0], row*spc[1]] - point2d(siz/2);
						if (!is_def(in_poly) || point_in_polygon(pos, in_poly)>=0) {
							$col = col;
							$row = row;
							$pos = pos;
							translate(pos) rot(orient,reverse=true) children();
						}
					}
				}
			}
		} else {
			// stagger == true or stagger == "alt"
			orient_and_align(siz, orient, align) {
				cols1 = ceil(mcols/2);
				cols2 = mcols - cols1;
				for (row = [0:mrows-1]) {
					rowcols = ((row%2) == staggermod)? cols1 : cols2;
					if (rowcols > 0) {
						for (col = [0:rowcols-1]) {
							rowdx = (row%2 != staggermod)? spc[0] : 0;
							pos = [2*col*spc[0]+rowdx, row*spc[1]] - point2d(siz/2);
							if (!is_def(in_poly) || point_in_polygon(pos, in_poly)>=0) {
								$col = col * 2 + ((row%2!=staggermod)? 1 : 0);
								$row = row;
								$pos = pos;
								translate(pos) rot(orient,reverse=true) children();
							}
						}
					}
				}
			}
		}
	}
}



// Module: grid3d()
//
// Description:
//   Makes a 3D grid of duplicate children.
//
// Usage:
//   grid3d(n, spacing) ...
//   grid3d(n=[Xn,Yn,Zn], spacing=[dX,dY,dZ]) ...
//   grid3d([xa], [ya], [za]) ...
//
// Arguments:
//   xa = array or range of X-axis values to offset by. (Default: [0])
//   ya = array or range of Y-axis values to offset by. (Default: [0])
//   za = array or range of Z-axis values to offset by. (Default: [0])
//   n = Optional number of copies to have per axis.
//   spacing = spacing of copies per axis. Use with `n`.
//
// Side Effect:
//   `$pos` is set to the relative centerpoint of each child copy, and can be used to modify each child individually.
//   `$idx` is set to the [Xidx,Yidx,Zidx] index values of each child copy, when using `count` and `n`.
//
// Examples(FlatSpin):
//   grid3d(xa=[0:25:50],ya=[0,40],za=[-20:40:20]) sphere(r=5);
//   grid3d(n=[3, 4, 2], spacing=[60, 50, 40]) sphere(r=10);
// Examples:
//   grid3d(ya=[-60:40:60],za=[0,70]) sphere(r=10);
//   grid3d(n=3, spacing=30) sphere(r=10);
//   grid3d(n=[3, 1, 2], spacing=30) sphere(r=10);
//   grid3d(n=[3, 4], spacing=[80, 60]) sphere(r=10);
// Examples:
//   grid3d(n=[10, 10, 10], spacing=50) color($idx/9) cube(50, center=true);
module grid3d(xa=[0], ya=[0], za=[0], n=undef, spacing=undef)
{
	n = scalar_vec3(n, 1);
	spacing = scalar_vec3(spacing, undef);
	if (is_def(n) && is_def(spacing)) {
		for (xi = [0:n.x-1]) {
			for (yi = [0:n.y-1]) {
				for (zi = [0:n.z-1]) {
					$idx = [xi,yi,zi];
					$pos = vmul(spacing, $idx - (n-[1,1,1])/2);
					translate($pos) children();
				}
			}
		}
	} else {
		for (xoff = xa, yoff = ya, zoff = za) {
			$pos = [xoff, yoff, zoff];
			translate($pos) children();
		}
	}
}



// Module: grid_of()
// Status: DEPRECATED, use `grid3d()` instead.
//
// Description:
//   Makes a 3D grid of duplicate children.
//
// Usage:
//   grid_of(n, spacing) ...
//   grid_of(n=[Xn,Yn,Zn], spacing=[dX,dY,dZ]) ...
//   grid_of([xa], [ya], [za]) ...
//
// Arguments:
//   xa = array or range of X-axis values to offset by. (Default: [0])
//   ya = array or range of Y-axis values to offset by. (Default: [0])
//   za = array or range of Z-axis values to offset by. (Default: [0])
//   n = Optional number of copies to have per axis.
//   spacing = spacing of copies per axis. Use with `n`.
//
// Side Effect:
//   `$pos` is set to the relative centerpoint of each child copy, and can be used to modify each child individually.
//   `$idx` is set to the [Xidx,Yidx,Zidx] index values of each child copy, when using `count` and `n`.
module grid_of(xa=[0], ya=[0], za=[0], count=undef, spacing=undef)
{
	deprecate("grid_of()", "grid3d()");
	grid3d(xa=xa, ya=ya, za=za, n=count, spacing=spacing) children();
}



//////////////////////////////////////////////////////////////////////
// Section: Rotational Distributors
//////////////////////////////////////////////////////////////////////


// Module: rot_copies()
//
// Description:
//   Given a number of XYZ rotation angles, or a list of angles and an axis `v`,
//   rotates copies of the children to each of those angles.
//
// Usage:
//   rot_copies(rots, [cp], [sa], [delta], [subrot]) ...
//   rot_copies(rots, v, [cp], [sa], [delta], [subrot]) ...
//   rot_copies(n, [v], [cp], [sa], [delta], [subrot]) ...
//
// Arguments:
//   rots = A list of [X,Y,Z] rotation angles in degrees.  If `v` is given, this will be a list of scalar angles in degrees to rotate around `v`.
//   v = If given, this is the vector to rotate around.
//   cp = Centerpoint to rotate around.
//   n = Optional number of evenly distributed copies, rotated around the ring.  If given, overrides `rots` argument.
//   sa = Starting angle, in degrees.  For use with `n`.  Angle is in degrees counter-clockwise.
//   delta = [X,Y,Z] amount to move away from cp before rotating.  Makes rings of copies.
//   subrot = If false, don't sub-rotate children as they are copied around the ring.
//
// Side Effects:
//   `$ang` is set to the rotation angle (or XYZ rotation triplet) of each child copy, and can be used to modify each child individually.
//   `$idx` is set to the index value of each child copy.
//
// Example:
//   #cylinder(h=20, r1=5, r2=0);
//   rot_copies([[45,0,0],[0,45,90],[90,-45,270]]) cylinder(h=20, r1=5, r2=0);
//
// Example:
//   rot_copies([45, 90, 135], v=V_DOWN+V_BACK)
//       yrot(90) cylinder(h=20, r1=5, r2=0);
//   color("red",0.333) yrot(90) cylinder(h=20, r1=5, r2=0);
//
// Example:
//   rot_copies(n=6, v=V_DOWN+V_BACK)
//       yrot(90) cylinder(h=20, r1=5, r2=0);
//   color("red",0.333) yrot(90) cylinder(h=20, r1=5, r2=0);
//
// Example:
//   rot_copies(n=6, v=V_DOWN+V_BACK, delta=[10,0,0])
//       yrot(90) cylinder(h=20, r1=5, r2=0);
//   color("red",0.333) yrot(90) cylinder(h=20, r1=5, r2=0);
//
// Example:
//   rot_copies(n=6, v=V_UP+V_FWD, delta=[10,0,0], sa=45)
//       yrot(90) cylinder(h=20, r1=5, r2=0);
//   color("red",0.333) yrot(90) cylinder(h=20, r1=5, r2=0);
//
// Example:
//   rot_copies(n=6, v=V_DOWN+V_BACK, delta=[20,0,0], subrot=false)
//       yrot(90) cylinder(h=20, r1=5, r2=0);
//   color("red",0.333) yrot(90) cylinder(h=20, r1=5, r2=0);
module rot_copies(rots=[], v=undef, cp=[0,0,0], count=undef, n=undef, sa=0, offset=0, delta=[0,0,0], subrot=true)
{
	cnt = first_defined([count, n]);
	sang = sa + offset;
	angs = is_def(cnt)? (cnt<=0? [] : [for (i=[0:cnt-1]) i/cnt*360+sang]) : rots;
	if (cp != [0,0,0]) {
		translate(cp) rot_copies(rots=rots, v=v, n=cnt, sa=sang, delta=delta, subrot=subrot) children();
	} else if (subrot) {
		for ($idx = [0:len(angs)-1]) {
			$ang = angs[$idx];
			rotate(a=$ang,v=v) translate(delta) rot(a=sang,v=v,reverse=true) children();
		}
	} else {
		for ($idx = [0:len(angs)-1]) {
			$ang = angs[$idx];
			rotate(a=$ang,v=v) translate(delta) rot(a=$ang,v=v,reverse=true) children();
		}
	}
}


// Module: xrot_copies()
//
// Description:
//   Given an array of angles, rotates copies of the children
//   to each of those angles around the X axis.
//
// Usage:
//   xrot_copies(rots, [r], [cp], [sa], [subrot]) ...
//   xrot_copies(n, [r], [cp], [sa], [subrot]) ...
//
// Arguments:
//   rots = Optional array of rotation angles, in degrees, to make copies at.
//   cp = Centerpoint to rotate around.
//   n = Optional number of evenly distributed copies to be rotated around the ring.  If given, overrides `rots` argument.
//   sa = Starting angle, in degrees.  For use with `n`.  Angle is in degrees counter-clockwise from Y+, when facing the origin from X+.  First unrotated copy is placed at that angle.
//   r = Radius to move children back, away from cp, before rotating.  Makes rings of copies.
//   subrot = If false, don't sub-rotate children as they are copied around the ring.
//
// Side Effects:
//   `$ang` is set to the rotation angle of each child copy, and can be used to modify each child individually.
//
// Example:
//   xrot_copies([180, 270, 315])
//       cylinder(h=20, r1=5, r2=0);
//   color("red",0.333) cylinder(h=20, r1=5, r2=0);
//
// Example:
//   xrot_copies(n=6)
//       cylinder(h=20, r1=5, r2=0);
//   color("red",0.333) cylinder(h=20, r1=5, r2=0);
//
// Example:
//   xrot_copies(n=6, r=10)
//       xrot(-90) cylinder(h=20, r1=5, r2=0);
//   color("red",0.333) xrot(-90) cylinder(h=20, r1=5, r2=0);
//
// Example:
//   xrot_copies(n=6, r=10, sa=45)
//       xrot(-90) cylinder(h=20, r1=5, r2=0);
//   color("red",0.333) xrot(-90) cylinder(h=20, r1=5, r2=0);
//
// Example:
//   xrot_copies(n=6, r=20, subrot=false)
//       xrot(-90) cylinder(h=20, r1=5, r2=0, center=true);
//   color("red",0.333) xrot(-90) cylinder(h=20, r1=5, r2=0, center=true);
module xrot_copies(rots=[], cp=[0,0,0], n=undef, count=undef, sa=0, offset=0, r=0, subrot=true)
{
	cnt = first_defined([count, n]);
	sang = sa + offset;
	rot_copies(rots=rots, v=V_RIGHT, cp=cp, n=cnt, sa=sang, delta=[0, r, 0], subrot=subrot) children();
}


// Module: yrot_copies()
//
// Description:
//   Given an array of angles, rotates copies of the children
//   to each of those angles around the Y axis.
//
// Usage:
//   yrot_copies(rots, [r], [cp], [sa], [subrot]) ...
//   yrot_copies(n, [r], [cp], [sa], [subrot]) ...
//
// Arguments:
//   rots = Optional array of rotation angles, in degrees, to make copies at.
//   cp = Centerpoint to rotate around.
//   n = Optional number of evenly distributed copies to be rotated around the ring.  If given, overrides `rots` argument.
//   sa = Starting angle, in degrees.  For use with `n`.  Angle is in degrees counter-clockwise from X-, when facing the origin from Y+.
//   r = Radius to move children left, away from cp, before rotating.  Makes rings of copies.
//   subrot = If false, don't sub-rotate children as they are copied around the ring.
//
// Side Effects:
//   `$ang` is set to the rotation angle of each child copy, and can be used to modify each child individually.
//
// Example:
//   yrot_copies([180, 270, 315])
//       cylinder(h=20, r1=5, r2=0);
//   color("red",0.333) cylinder(h=20, r1=5, r2=0);
//
// Example:
//   yrot_copies(n=6)
//       cylinder(h=20, r1=5, r2=0);
//   color("red",0.333) cylinder(h=20, r1=5, r2=0);
//
// Example:
//   yrot_copies(n=6, r=10)
//       yrot(-90) cylinder(h=20, r1=5, r2=0);
//   color("red",0.333) yrot(-90) cylinder(h=20, r1=5, r2=0);
//
// Example:
//   yrot_copies(n=6, r=10, sa=45)
//       yrot(-90) cylinder(h=20, r1=5, r2=0);
//   color("red",0.333) yrot(-90) cylinder(h=20, r1=5, r2=0);
//
// Example:
//   yrot_copies(n=6, r=20, subrot=false)
//       yrot(-90) cylinder(h=20, r1=5, r2=0, center=true);
//   color("red",0.333) yrot(-90) cylinder(h=20, r1=5, r2=0, center=true);
module yrot_copies(rots=[], cp=[0,0,0], n=undef, count=undef, sa=0, offset=0, r=0, subrot=true)
{
	cnt = first_defined([count, n]);
	sang = sa + offset;
	rot_copies(rots=rots, v=V_BACK, cp=cp, n=cnt, sa=sang, delta=[-r, 0, 0], subrot=subrot) children();
}


// Module: zrot_copies()
//
// Description:
//   Given an array of angles, rotates copies of the children
//   to each of those angles around the Z axis.
//
// Usage:
//   zrot_copies(rots, [r], [cp], [sa], [subrot]) ...
//   zrot_copies(n, [r], [cp], [sa], [subrot]) ...
//
// Arguments:
//   rots = Optional array of rotation angles, in degrees, to make copies at.
//   cp = Centerpoint to rotate around.
//   n = Optional number of evenly distributed copies to be rotated around the ring.  If given, overrides `rots` argument.
//   sa = Starting angle, in degrees.  For use with `n`.  Angle is in degrees counter-clockwise from X+, when facing the origin from Z+.
//   r = Radius to move children right, away from cp, before rotating.  Makes rings of copies.
//   subrot = If false, don't sub-rotate children as they are copied around the ring.
//
// Side Effects:
//   `$ang` is set to the rotation angle of each child copy, and can be used to modify each child individually.
//
// Example:
//   zrot_copies([180, 270, 315])
//       yrot(90) cylinder(h=20, r1=5, r2=0);
//   color("red",0.333) yrot(90) cylinder(h=20, r1=5, r2=0);
//
// Example:
//   zrot_copies(n=6)
//       yrot(90) cylinder(h=20, r1=5, r2=0);
//   color("red",0.333) yrot(90) cylinder(h=20, r1=5, r2=0);
//
// Example:
//   zrot_copies(n=6, r=10)
//       yrot(90) cylinder(h=20, r1=5, r2=0);
//   color("red",0.333) yrot(90) cylinder(h=20, r1=5, r2=0);
//
// Example:
//   zrot_copies(n=6, r=20, sa=45)
//       yrot(90) cylinder(h=20, r1=5, r2=0, center=true);
//   color("red",0.333) yrot(90) cylinder(h=20, r1=5, r2=0, center=true);
//
// Example:
//   zrot_copies(n=6, r=20, subrot=false)
//       yrot(-90) cylinder(h=20, r1=5, r2=0, center=true);
//   color("red",0.333) yrot(-90) cylinder(h=20, r1=5, r2=0, center=true);
module zrot_copies(rots=[], cp=[0,0,0], n=undef, count=undef, sa=0, offset=0, r=0, subrot=true)
{
	cnt = first_defined([count, n]);
	sang = sa + offset;
	rot_copies(rots=rots, v=V_UP, cp=cp, n=cnt, sa=sang, delta=[r, 0, 0], subrot=subrot) children();
}


// Module: xring()
//
// Description:
//   Distributes `n` copies of the given children on a circle of radius `r`
//   around the X axis.  If `rot` is true, each copy is rotated in place to keep
//   the same side towards the center.  The first, unrotated copy will be at the
//   starting angle `sa`.
//
// Usage:
//   xring(n, r, [sa], [cp], [rot]) ...
//
// Arguments:
//   n = Number of copies of children to distribute around the circle. (Default: 2)
//   r = Radius of ring to distribute children around. (Default: 0)
//   sa = Start angle for first (unrotated) copy.  (Default: 0)
//   cp = Centerpoint of ring.  Default: [0,0,0]
//   rot = If true, rotate each copy to keep the same side towards the center of the ring.  Default: true.
//
// Side Effects:
//   `$ang` is set to the rotation angle of each child copy, and can be used to modify each child individually.
//   `$idx` is set to the index value of each child copy.
//
// Examples:
//   xring(n=6, r=10) xrot(-90) cylinder(h=20, r1=5, r2=0);
//   xring(n=6, r=10, sa=45) xrot(-90) cylinder(h=20, r1=5, r2=0);
//   xring(n=6, r=20, rot=false) cylinder(h=20, r1=6, r2=0, center=true);
module xring(n=2, r=0, sa=0, cp=[0,0,0], rot=true)
{
	xrot_copies(count=n, r=r, sa=sa, cp=cp, subrot=rot) children();
}


// Module: yring()
//
// Description:
//   Distributes `n` copies of the given children on a circle of radius `r`
//   around the Y axis.  If `rot` is true, each copy is rotated in place to keep
//   the same side towards the center.  The first, unrotated copy will be at the
//   starting angle `sa`.
//
// Usage:
//   yring(n, r, [sa], [cp], [rot]) ...
//
// Arguments:
//   n = Number of copies of children to distribute around the circle. (Default: 2)
//   r = Radius of ring to distribute children around. (Default: 0)
//   sa = Start angle for first (unrotated) copy.  (Default: 0)
//   cp = Centerpoint of ring.  Default: [0,0,0]
//   rot = If true, rotate each copy to keep the same side towards the center of the ring.  Default: true.
//
// Side Effects:
//   `$ang` is set to the rotation angle of each child copy, and can be used to modify each child individually.
//   `$idx` is set to the index value of each child copy.
//
// Examples:
//   yring(n=6, r=10) yrot(-90) cylinder(h=20, r1=5, r2=0);
//   yring(n=6, r=10, sa=45) yrot(-90) cylinder(h=20, r1=5, r2=0);
//   yring(n=6, r=20, rot=false) cylinder(h=20, r1=6, r2=0, center=true);
module yring(n=2, r=0, sa=0, cp=[0,0,0], rot=true)
{
	yrot_copies(count=n, r=r, sa=sa, cp=cp, subrot=rot) children();
}


// Module: zring()
//
// Description:
//   Distributes `n` copies of the given children on a circle of radius `r`
//   around the Z axis.  If `rot` is true, each copy is rotated in place to keep
//   the same side towards the center.  The first, unrotated copy will be at the
//   starting angle `sa`.
//
// Usage:
//   zring(r, n, [sa], [cp], [rot]) ...
//
// Arguments:
//   n = Number of copies of children to distribute around the circle. (Default: 2)
//   r = Radius of ring to distribute children around. (Default: 0)
//   sa = Start angle for first (unrotated) copy.  (Default: 0)
//   cp = Centerpoint of ring.  Default: [0,0,0]
//   rot = If true, rotate each copy to keep the same side towards the center of the ring.  Default: true.
//
// Side Effects:
//   `$ang` is set to the relative angle from `cp` of each child copy, and can be used to modify each child individually.
//   `$idx` is set to the index value of each child copy.
//
// Examples:
//   zring(n=6, r=10) yrot(90) cylinder(h=20, r1=5, r2=0);
//   zring(n=6, r=10, sa=45) yrot(90) cylinder(h=20, r1=5, r2=0);
//   zring(n=6, r=20, rot=false) yrot(90) cylinder(h=20, r1=6, r2=0, center=true);
module zring(n=2, r=0, sa=0, cp=[0,0,0], rot=true)
{
	zrot_copies(count=n, r=r, sa=sa, cp=cp, subrot=rot) children();
}


// Module: arc_of()
//
// Description:
//   Evenly distributes n duplicate children around an ovoid arc on the XY plane.
//
// Usage:
//   arc_of(r|d, n, [sa], [ea], [rot]
//   arc_of(rx|dx, ry|dy, n, [sa], [ea], [rot]
//
// Arguments:
//   n = number of copies to distribute around the circle. (Default: 6)
//   r = radius of circle (Default: 1)
//   rx = radius of ellipse on X axis. Used instead of r.
//   ry = radius of ellipse on Y axis. Used instead of r.
//   d = diameter of circle. (Default: 2)
//   dx = diameter of ellipse on X axis. Used instead of d.
//   dy = diameter of ellipse on Y axis. Used instead of d.
//   rot = whether to rotate the copied children.  (Default: false)
//   sa = starting angle. (Default: 0.0)
//   ea = ending angle. Will distribute copies CCW from sa to ea. (Default: 360.0)
//
// Side Effects:
//   `$ang` is set to the rotation angle of each child copy, and can be used to modify each child individually.
//   `$pos` is set to the relative centerpoint of each child copy, and can be used to modify each child individually.
//   `$idx` is set to the index value of each child copy.
//
// Example:
//   #cube(size=[10,3,3],center=true);
//   arc_of(d=40, n=5) cube(size=[10,3,3],center=true);
//
// Example:
//   #cube(size=[10,3,3],center=true);
//   arc_of(d=40, n=5, sa=45, ea=225) cube(size=[10,3,3],center=true);
//
// Example:
//   #cube(size=[10,3,3],center=true);
//   arc_of(r=15, n=8, rot=false) cube(size=[10,3,3],center=true);
//
// Example:
//   #cube(size=[10,3,3],center=true);
//   arc_of(rx=20, ry=10, n=8) cube(size=[10,3,3],center=true);
module arc_of(
	n=6,
	r=undef, rx=undef, ry=undef,
	d=undef, dx=undef, dy=undef,
	sa=0, ea=360,
	rot=true
) {
	rx = get_radius(rx, r, dx, d, 1);
	ry = get_radius(ry, r, dy, d, 1);
	sa = posmod(sa, 360);
	ea = posmod(ea, 360);
	n = (abs(ea-sa)<0.01)?(n+1):n;
	delt = (((ea<=sa)?360.0:0)+ea-sa)/(n-1);
	for ($idx = [0:n-1]) {
		$ang = sa + ($idx * delt);
		$pos =[rx*cos($ang), ry*sin($ang), 0];
		translate($pos) {
			zrot(rot? atan2(ry*sin($ang), rx*cos($ang)) : 0) {
				children();
			}
		}
	}
}



// Module: ovoid_spread()
//
// Description:
//   Spreads children semi-evenly over the surface of a sphere.
//
// Usage:
//   ovoid_spread(r|d, n, [cone_ang], [scale], [perp]) ...
//
// Arguments:
//   r = Radius of the sphere to distribute over
//   d = Diameter of the sphere to distribute over
//   n = How many copies to evenly spread over the surface.
//   cone_ang = Angle of the cone, in degrees, to limit how much of the sphere gets covered.  For full sphere coverage, use 180.  Measured pre-scaling.  Default: 180
//   scale = The [X,Y,Z] scaling factors to reshape the sphere being covered.
//   perp = If true, rotate children to be perpendicular to the sphere surface.  Default: true
//
// Side Effects:
//   `$pos` is set to the relative post-scaled centerpoint of each child copy, and can be used to modify each child individually.
//   `$theta` is set to the theta angle of the child from the center of the sphere.
//   `$phi` is set to the pre-scaled phi angle of the child from the center of the sphere.
//   `$rad` is set to the pre-scaled radial distance of the child from the center of the sphere.
//   `$idx` is set to the index number of each child being copied.
//
// Example:
//   ovoid_spread(n=250, d=100, cone_ang=45, scale=[3,3,1])
//       cylinder(d=10, h=10, center=false);
//
// Example:
//   ovoid_spread(n=500, d=100, cone_ang=180)
//       color(normalize(point3d(vabs($pos))))
//           cylinder(d=8, h=10, center=false);
module ovoid_spread(r=undef, d=undef, n=100, cone_ang=90, scale=[1,1,1], perp=true)
{
	r = get_radius(r=r, d=d, dflt=50);
	cnt = ceil(n / (cone_ang/180));

	// Calculate an array of [theta,phi] angles for `n` number of
	// points, almost evenly spaced across the surface of a sphere.
	// This approximation is based on the golden spiral method.
	theta_phis = [for (x=[0:n-1]) [180*(1+sqrt(5))*(x+0.5)%360, acos(1-2*(x+0.5)/cnt)]];

	for ($idx = [0:len(theta_phis)-1]) {
	    tp = theta_phis[$idx];
		xyz = spherical_to_xyz(r, tp[0], tp[1]);
		$pos = vmul(xyz,scale);
		$theta = tp[0];
		$phi = tp[1];
		$rad = r;
		translate($pos) {
			if (perp) {
				rot(from=V_UP, to=xyz) children();
			} else {
				children();
			}
		}
	}
}



//////////////////////////////////////////////////////////////////////
// Section: Reflectional Distributors
//////////////////////////////////////////////////////////////////////


// Module: mirror_copy()
//
// Description:
//   Makes a copy of the children, mirrored across the given plane.
//
// Usage:
//   mirror_copy(v, [cp], [offset]) ...
//
// Arguments:
//   v = The normal vector of the plane to mirror across.
//   offset = distance to offset away from the plane.
//   cp = A point that lies on the mirroring plane.
//
// Side Effects:
//   `$orig` is true for the original instance of children.  False for the copy.
//   `$idx` is set to the index value of each copy.
//
// Example:
//   mirror_copy([1,-1,0]) zrot(-45) yrot(90) cylinder(d1=10, d2=0, h=20);
//   color("blue",0.25) zrot(-45) cube([0.01,15,15], center=true);
//
// Example:
//   mirror_copy([1,1,0], offset=5) rot(a=90,v=[-1,1,0]) cylinder(d1=10, d2=0, h=20);
//   color("blue",0.25) zrot(45) cube([0.01,15,15], center=true);
//
// Example:
//   mirror_copy(V_UP+V_BACK, cp=[0,-5,-5]) rot(from=V_UP, to=V_BACK+V_UP) cylinder(d1=10, d2=0, h=20);
//   color("blue",0.25) translate([0,-5,-5]) rot(from=V_UP, to=V_BACK+V_UP) cube([15,15,0.01], center=true);
module mirror_copy(v=[0,0,1], offset=0, cp=[0,0,0])
{
	nv = v/norm(v);
	off = nv*offset;
	if (cp == [0,0,0]) {
		translate(off) {
			$orig = true;
			$idx = 0;
			children();
		}
		mirror(nv) translate(off) {
			$orig = false;
			$idx = 1;
			children();
		}
	} else {
		translate(off) children();
		translate(cp) mirror(nv) translate(-cp) translate(off) children();
	}
}


// Module: xflip_copy()
//
// Description:
//   Makes a copy of the children, mirrored across the X axis.
//
// Usage:
//   xflip_copy([cp], [offset]) ...
//
// Arguments:
//   offset = Distance to offset children right, before copying.
//   cp = A point that lies on the mirroring plane.
//
// Side Effects:
//   `$orig` is true for the original instance of children.  False for the copy.
//   `$idx` is set to the index value of each copy.
//
// Example:
//   xflip_copy() yrot(90) cylinder(h=20, r1=4, r2=0);
//   color("blue",0.25) cube([0.01,15,15], center=true);
//
// Example:
//   xflip_copy(offset=5) yrot(90) cylinder(h=20, r1=4, r2=0);
//   color("blue",0.25) cube([0.01,15,15], center=true);
//
// Example:
//   xflip_copy(cp=[-5,0,0]) yrot(90) cylinder(h=20, r1=4, r2=0);
//   color("blue",0.25) left(5) cube([0.01,15,15], center=true);
module xflip_copy(offset=0, cp=[0,0,0])
{
	mirror_copy(v=[1,0,0], offset=offset, cp=cp) children();
}


// Module: yflip_copy()
//
// Description:
//   Makes a copy of the children, mirrored across the Y axis.
//
// Usage:
//   yflip_copy([cp], [offset]) ...
//
// Arguments:
//   offset = Distance to offset children back, before copying.
//   cp = A point that lies on the mirroring plane.
//
// Side Effects:
//   `$orig` is true for the original instance of children.  False for the copy.
//   `$idx` is set to the index value of each copy.
//
// Example:
//   yflip_copy() xrot(-90) cylinder(h=20, r1=4, r2=0);
//   color("blue",0.25) cube([15,0.01,15], center=true);
//
// Example:
//   yflip_copy(offset=5) xrot(-90) cylinder(h=20, r1=4, r2=0);
//   color("blue",0.25) cube([15,0.01,15], center=true);
//
// Example:
//   yflip_copy(cp=[0,-5,0]) xrot(-90) cylinder(h=20, r1=4, r2=0);
//   color("blue",0.25) fwd(5) cube([15,0.01,15], center=true);
module yflip_copy(offset=0, cp=[0,0,0])
{
	mirror_copy(v=[0,1,0], offset=offset, cp=cp) children();
}


// Module: zflip_copy()
//
// Description:
//   Makes a copy of the children, mirrored across the Z axis.
//
// Usage:
//   zflip_copy([cp], [offset]) ...
//   `$idx` is set to the index value of each copy.
//
// Arguments:
//   offset = Distance to offset children up, before copying.
//   cp = A point that lies on the mirroring plane.
//
// Side Effects:
//   `$orig` is true for the original instance of children.  False for the copy.
//
// Example:
//   zflip_copy() cylinder(h=20, r1=4, r2=0);
//   color("blue",0.25) cube([15,15,0.01], center=true);
//
// Example:
//   zflip_copy(offset=5) cylinder(h=20, r1=4, r2=0);
//   color("blue",0.25) cube([15,15,0.01], center=true);
//
// Example:
//   zflip_copy(cp=[0,0,-5]) cylinder(h=20, r1=4, r2=0);
//   color("blue",0.25) down(5) cube([15,15,0.01], center=true);
module zflip_copy(offset=0, cp=[0,0,0])
{
	mirror_copy(v=[0,0,1], offset=offset, cp=cp) children();
}


//////////////////////////////////////////////////////////////////////
// Section: Mutators
//////////////////////////////////////////////////////////////////////


// Module: half_of()
//
// Usage:
//   half_of(v, [cp], [s]) ...
//
// Description:
//   Slices an object at a cut plane, and masks away everything that is on one side.
//
// Arguments:
//   v = Normal of plane to slice at.  Keeps everything on the side the normal points to.  Default: [0,0,1] (V_UP)
//   cp = If given as a scalar, moves the cut plane along the normal by the given amount.  If given as a point, specifies a point on the cut plane.  This can be used to shift where it slices the object at.  Default: [0,0,0]
//   s = Mask size to use.  Use a number larger than twice your object's largest axis.  If you make this too large, it messes with centering your view.  Default: 100
//   planar = If true, this becomes a 2D operation.  When planar, a `v` of `V_UP` or `V_DOWN` becomes equivalent of `V_BACK` and `V_FWD` respectively.
//
// Examples:
//   half_of(V_DOWN+V_BACK, cp=[0,-10,0]) cylinder(h=40, r1=10, r2=0, center=false);
//   half_of(V_DOWN+V_LEFT, s=200) sphere(d=150);
// Example(2D):
//   half_of([1,1], planar=true) circle(d=50);
module half_of(v=V_UP, cp=[0,0,0], s=100, planar=false)
{
	cp = is_scalar(cp)? cp*normalize(v) : cp;
	if (cp != [0,0,0]) {
		translate(cp) half_of(v=v, s=s, planar=planar) translate(-cp) children();
	} else if (planar) {
		v = (v==V_UP)? V_BACK : (v==V_DOWN)? V_FWD : v;
		ang = atan2(v.y, v.x);
		difference() {
			children();
			rotate(ang+90) {
				back(s/2) square(s, center=true);
			}
		}
	} else {
		difference() {
			children();
			rot(from=V_UP, to=-v) {
				up(s/2) cube(s, center=true);
			}
		}
	}
}


// Module: top_half()
//
// Usage:
//   top_half([z|cp], [s]) ...
//
// Description:
//   Slices an object at a horizontal X-Y cut plane, and masks away everything that is below it.
//
// Arguments:
//   cp = If given as a scalar, moves the cut plane up by the given amount.  If given as a point, specifies a point on the cut plane.  Default: [0,0,0]
//   z = The Z coordinate of the cut-plane, if given.  Use instead of `cp`.
//   s = Mask size to use.  Use a number larger than twice your object's largest axis.  If you make this too large, it messes with centering your view.  Default: 100
//   planar = If true, this becomes equivalent to a planar `back_half()`.
//
// Examples(Spin):
//   top_half() sphere(r=20);
//   top_half(z=5) sphere(r=20);
//   top_half(cp=5) sphere(r=20);
//   top_half(cp=[0,0,-8]) sphere(r=20);
// Example(2D):
//   top_half(planar=true) circle(r=20);
module top_half(s=100, z=undef, cp=[0,0,0], planar=false)
{
	dir = planar? V_BACK : V_UP;
	cp = is_scalar(z)? [0,0,z] : is_scalar(cp)? cp*dir : cp;
	translate(cp) difference() {
		translate(-cp) children();
		translate(-dir*s/2) {
			if (planar) {
				square(s, center=true);
			} else {
				cube(s, center=true);
			}
		}
	}
}



// Module: bottom_half()
//
// Usage:
//   bottom_half([z|cp], [s]) ...
//
// Description:
//   Slices an object at a horizontal X-Y cut plane, and masks away everything that is above it.
//
// Arguments:
//   cp = If given as a scalar, moves the cut plane down by the given amount.  If given as a point, specifies a point on the cut plane.  Default: [0,0,0]
//   z = The Z coordinate of the cut-plane, if given.  Use instead of `cp`.
//   s = Mask size to use.  Use a number larger than twice your object's largest axis.  If you make this too large, it messes with centering your view.  Default: 100
//   planar = If true, this becomes equivalent to a planar `front_half()`.
//
// Examples:
//   bottom_half() sphere(r=20);
//   bottom_half(z=-10) sphere(r=20);
//   bottom_half(cp=-10) sphere(r=20);
//   bottom_half(cp=[0,0,10]) sphere(r=20);
// Example(2D):
//   bottom_half(planar=true) circle(r=20);
module bottom_half(s=100, z=undef, cp=[0,0,0], planar=false)
{
	dir = planar? V_FWD : V_DOWN;
	cp = is_scalar(z)? [0,0,z] : is_scalar(cp)? cp*dir : cp;
	translate(cp) difference() {
		translate(-cp) children();
		translate(-dir*s/2) {
			if (planar) {
				square(s, center=true);
			} else {
				cube(s, center=true);
			}
		}
	}
}



// Module: left_half()
//
// Usage:
//   left_half([x|cp], [s]) ...
//
// Description:
//   Slices an object at a vertical Y-Z cut plane, and masks away everything that is right of it.
//
// Arguments:
//   cp = If given as a scalar, moves the cut plane left by the given amount.  If given as a point, specifies a point on the cut plane.  Default: [0,0,0]
//   x = The X coordinate of the cut-plane, if given.  Use instead of `cp`.
//   s = Mask size to use.  Use a number larger than twice your object's largest axis.  If you make this too large, it messes with centering your view.  Default: 100
//   planar = If true, this becomes a 2D operation.
//
// Examples:
//   left_half() sphere(r=20);
//   left_half(x=-8) sphere(r=20);
//   left_half(cp=-8) sphere(r=20);
//   left_half(cp=[8,0,0]) sphere(r=20);
// Example(2D):
//   left_half(planar=true) circle(r=20);
module left_half(s=100, x=undef, cp=[0,0,0], planar=false)
{
	dir = V_LEFT;
	cp = is_scalar(x)? [x,0,0] : is_scalar(cp)? cp*dir : cp;
	translate(cp) difference() {
		translate(-cp) children();
		translate(-dir*s/2) {
			if (planar) {
				square(s, center=true);
			} else {
				cube(s, center=true);
			}
		}
	}
}



// Module: right_half()
//
// Usage:
//   right_half([x|cp], [s]) ...
//
// Description:
//   Slices an object at a vertical Y-Z cut plane, and masks away everything that is left of it.
//
// Arguments:
//   cp = If given as a scalar, moves the cut plane right by the given amount.  If given as a point, specifies a point on the cut plane.  Default: [0,0,0]
//   x = The X coordinate of the cut-plane, if given.  Use instead of `cp`.
//   s = Mask size to use.  Use a number larger than twice your object's largest axis.  If you make this too large, it messes with centering your view.  Default: 100
//   planar = If true, this becomes a 2D operation.
//
// Examples(FlatSpin):
//   right_half() sphere(r=20);
//   right_half(x=-5) sphere(r=20);
//   right_half(cp=-5) sphere(r=20);
//   right_half(cp=[-5,0,0]) sphere(r=20);
// Example(2D):
//   right_half(planar=true) circle(r=20);
module right_half(s=100, x=undef, cp=[0,0,0], planar=false)
{
	dir = V_RIGHT;
	cp = is_scalar(x)? [x,0,0] : is_scalar(cp)? cp*dir : cp;
	translate(cp) difference() {
		translate(-cp) children();
		translate(-dir*s/2) {
			if (planar) {
				square(s, center=true);
			} else {
				cube(s, center=true);
			}
		}
	}
}



// Module: front_half()
//
// Usage:
//   front_half([y|cp], [s]) ...
//
// Description:
//   Slices an object at a vertical X-Z cut plane, and masks away everything that is behind it.
//
// Arguments:
//   cp = If given as a scalar, moves the cut plane forward by the given amount.  If given as a point, specifies a point on the cut plane.  Default: [0,0,0]
//   y = The Y coordinate of the cut-plane, if given.  Use instead of `cp`.
//   s = Mask size to use.  Use a number larger than twice your object's largest axis.  If you make this too large, it messes with centering your view.  Default: 100
//   planar = If true, this becomes a 2D operation.
//
// Examples(FlatSpin):
//   front_half() sphere(r=20);
//   front_half(y=5) sphere(r=20);
//   front_half(cp=5) sphere(r=20);
//   front_half(cp=[0,5,0]) sphere(r=20);
// Example(2D):
//   front_half(planar=true) circle(r=20);
module front_half(s=100, y=undef, cp=[0,0,0], planar=false)
{
	dir = V_FWD;
	cp = is_scalar(y)? [0,y,0] : is_scalar(cp)? cp*dir : cp;
	translate(cp) difference() {
		translate(-cp) children();
		translate(-dir*s/2) {
			if (planar) {
				square(s, center=true);
			} else {
				cube(s, center=true);
			}
		}
	}
}



// Module: back_half()
//
// Usage:
//   back_half([y|cp], [s]) ...
//
// Description:
//   Slices an object at a vertical X-Z cut plane, and masks away everything that is in front of it.
//
// Arguments:
//   cp = If given as a scalar, moves the cut plane back by the given amount.  If given as a point, specifies a point on the cut plane.  Default: [0,0,0]
//   y = The Y coordinate of the cut-plane, if given.  Use instead of `cp`.
//   s = Mask size to use.  Use a number larger than twice your object's largest axis.  If you make this too large, it messes with centering your view.  Default: 100
//   planar = If true, this becomes a 2D operation.
//
// Examples:
//   back_half() sphere(r=20);
//   back_half(y=8) sphere(r=20);
//   back_half(cp=8) sphere(r=20);
//   back_half(cp=[0,-10,0]) sphere(r=20);
// Example(2D):
//   back_half(planar=true) circle(r=20);
module back_half(s=100, y=undef, cp=[0,0,0], planar=false)
{
	dir = V_BACK;
	cp = is_scalar(y)? [0,y,0] : is_scalar(cp)? cp*dir : cp;
	translate(cp) difference() {
		translate(-cp) children();
		translate(-dir*s/2) {
			if (planar) {
				square(s, center=true);
			} else {
				cube(s, center=true);
			}
		}
	}
}



// Module: chain_hull()
//
// Usage:
//   chain_hull() ...
//
// Description:
//   Performs hull operations between consecutive pairs of children,
//   then unions all of the hull results.  This can be a very slow
//   operation, but it can provide results that are hard to get
//   otherwise.
//
// Example:
//   chain_hull() {
//       cube(5, center=true);
//       translate([30, 0, 0]) sphere(d=15);
//       translate([60, 30, 0]) cylinder(d=10, h=20);
//       translate([60, 60, 0]) cube([10,1,20], center=false);
//   }
module chain_hull()
{
	union() {
		if ($children == 1) {
			children();
		} else if ($children > 1) {
			for (i =[1:$children-1]) {
				hull() {
					children(i-1);
					children(i);
				}
			}
		}
	}
}


// Module: extrude_arc()
//
// Description:
//   Extrudes 2D shapes around a partial circle arc, with optional rounded caps.
//   This is mostly useful for backwards compatability with older OpenSCAD versions
//   without the `angle` argument in rotate_extrude.
//
// Usage:
//   extrude_arc(arc, r|d, [sa], [caps], [orient], [align], [masksize]) ...
//
// Arguments:
//   arc = Number of degrees to traverse.
//   sa = Start angle in degrees.
//   r = Radius of arc.
//   d = Diameter of arc.
//   orient = The axis to align to.  Use `ORIENT_` constants from `constants.scad`
//   align = The side of the origin the part should be aligned with.  Use `V_` constants from `constants.scad`
//   masksize = size of mask used to clear unused part of circle arc.  should be larger than height or width of 2D shapes to extrude.
//   caps = If true, spin the 2D shapes to make rounded caps the ends of the arc.
//   convexity = Max number of times a ray passes through the 2D shape's walls.
//
// Example(Med):
//   pts=[[-5/2, -5], [-5/2, 0], [-5/2-3, 5], [5/2+3, 5], [5/2, 0], [5/2, -5]];
//   #polygon(points=pts);
//   extrude_arc(arc=270, sa=45, r=40, caps=true, convexity=4, $fa=2, $fs=2) {
//       polygon(points=pts);
//   }
module extrude_arc(arc=90, sa=0, r=undef, d=undef, orient=ORIENT_Z, align=V_CENTER, masksize=100, caps=false, convexity=4)
{
	eps = 0.001;
	r = get_radius(r=r, d=d, dflt=100);
	orient_and_align([2*r, 2*r, 0], orient, align) {
		zrot(sa) {
			if (caps) {
				place_copies([[r,0,0], cylindrical_to_xyz(r, arc, 0)]) {
					rotate_extrude(convexity=convexity) {
						difference() {
							children();
							left(masksize/2) square(masksize, center=true);
						}
					}
				}
			}
			difference() {
				rotate_extrude(angle=arc, convexity=convexity*2) {
					right(r) {
						children();
					}
				}
				if(version_num() < 20190000) {
					maxd = r + masksize;
					if (arc<180) rotate(arc) back(maxd/2) cube([2*maxd, maxd, masksize+0.1], center=true);
					difference() {
						fwd(maxd/2) cube([2*maxd, maxd, masksize+0.2], center=true);
						if (arc>180) rotate(arc-180) back(maxd/2) cube([2*maxd, maxd, masksize+0.1], center=true);
					}
				}
			}
		}
	}
}


//////////////////////////////////////////////////////////////////////
// Section: 2D Mutators
//////////////////////////////////////////////////////////////////////


// Module: round2d()
// Usage:
//   round2d(r) ...
//   round2d(or) ...
//   round2d(ir) ...
//   round2d(or, ir) ...
// Description:
//   Rounds an arbitrary 2d objects.  Giving `r` rounds all concave and
//   convex corners.  Giving just `ir` rounds just concave corners.
//   Giving just `or` rounds convex corners.  Giving both `ir` and `or`
//   can let you round to different radii for concave and convex corners.
//   The 2d object must not have any parts narrower than twice the `or`
//   radius.  Such parts will disappear.
// Arguments:
//   r = Radius to round all concave and convex corners to.
//   or = Radius to round only outside (convex) corners to.  Use instead of `r`.
//   ir = Radius to round/fillet only inside (concave) corners to.  Use instead of `r`.
// Examples(2D):
//   round2d(r=10) {square([40,100], center=true); square([100,40], center=true);}
//   round2d(or=10) {square([40,100], center=true); square([100,40], center=true);}
//   round2d(ir=10) {square([40,100], center=true); square([100,40], center=true);}
//   round2d(or=16,ir=8) {square([40,100], center=true); square([100,40], center=true);}
module round2d(r, or, ir)
{
	or = get_radius(r1=or, r=r, dflt=0);
	ir = get_radius(r1=ir, r=r, dflt=0);
	offset(or) offset(-ir-or) offset(delta=ir) children();
}


// Module: shell2d()
// Usage:
//   shell2d(thickness, [or], [ir], [fill], [round])
// Description:
//   Creates a hollow shell from 2d children, with optional rounding.
// Arguments:
//   thickness = Thickness of the shell.  Positive to expand outward, negative to shrink inward, or a two-element list to do both.
//   or = Radius to round convex corners/pointy bits on the outside of the shell.
//   ir = Radius to round/fillet concave corners on the outside of the shell.
//   round = Radius to round convex corners/pointy bits on the inside of the shell.
//   fill = Radius to round/fillet concave corners on the inside of the shell.
// Examples(2D):
//   shell2d(10) {square([40,100], center=true); square([100,40], center=true);}
//   shell2d(-10) {square([40,100], center=true); square([100,40], center=true);}
//   shell2d([-10,10]) {square([40,100], center=true); square([100,40], center=true);}
//   shell2d(10,or=10) {square([40,100], center=true); square([100,40], center=true);}
//   shell2d(10,ir=10) {square([40,100], center=true); square([100,40], center=true);}
//   shell2d(10,round=10) {square([40,100], center=true); square([100,40], center=true);}
//   shell2d(10,fill=10) {square([40,100], center=true); square([100,40], center=true);}
//   shell2d(8,or=16,ir=8,round=16,fill=8) {square([40,100], center=true); square([100,40], center=true);}
module shell2d(thickness, or=0, ir=0, fill=0, round=0)
{
	thickness = is_scalar(thickness)? (
		thickness<0? [thickness,0] : [0,thickness]
	) : (thickness[0]>thickness[1])? (
		[thickness[1],thickness[0]]
	) : thickness;
	difference() {
		round2d(or=or,ir=ir)
			offset(delta=thickness[1])
				children();
		round2d(or=fill,ir=round)
			offset(delta=thickness[0])
				children();
	}
}



//////////////////////////////////////////////////////////////////////
// Section: Miscellaneous
//////////////////////////////////////////////////////////////////////


// Module: orient_and_align()
//
// Description:
//   Takes a vertically oriented shape, and re-orients and aligns it.
//   This is useful for making a custom shape available in various
//   orientations and alignments without extra translate()s and rotate()s.
//   Children should be vertically (Z-axis) oriented, and centered.
//   Non-extremity alignment points should be named via the `alignments` arg.
//   Named alignments, as well as `ALIGN_NEG`/`ALIGN_POS` are aligned pre-rotation.
//
// Usage:
//   orient_and_align(size, [orient], [align], [center], [noncentered], [orig_orient], [orig_align], [alignments]) ...
//
// Arguments:
//   size = The size of the part.
//   orient = The axis to align to.  Use ORIENT_ constants from constants.scad
//   align = The side of the origin the part should be aligned with.
//   center = If given, overrides `align`.  If true, centers vertically.  If false, `align` will be set to the value in `noncentered`.
//   noncentered = The value to set `align` to if `center` == `false`.  Default: `V_UP`.
//   orig_orient = The original orientation of the part.  Default: `ORIENT_Z`.
//   orig_align = The original alignment of the part.  Default: `V_CENTER`.
//   alignments = A list of `["name", [X,Y,Z]]` alignment-label/offset pairs.
//
// Example:
//   #cylinder(d=5, h=10);
//   orient_and_align([5,5,10], orient=ORIENT_Y, align=V_BACK, orig_align=V_UP) cylinder(d=5, h=10);
module orient_and_align(
	size=undef, orient=ORIENT_Z, align=V_CENTER,
	center=undef, noncentered=ALIGN_POS,
	orig_orient=ORIENT_Z, orig_align=V_CENTER,
	alignments=[]
) {
	algn = is_def(center)? (center? V_CENTER : noncentered) : align;
    if (orig_align != V_CENTER) {
		orient_and_align(size=size, orient=orient, align=algn) {
			translate(vmul(size/2, -orig_align)) children();
		}
    } else if (orig_orient != ORIENT_Z) {
		rotsize = (
			(orig_orient==ORIENT_X)? [size[1], size[2], size[0]] :
			(orig_orient==ORIENT_Y)? [size[0], size[2], size[1]] :
			vabs(rotate_points3d([size], orig_orient, reverse=true)[0])
		);
		orient_and_align(size=rotsize, orient=orient, align=algn) {
			rot(orig_orient,reverse=true) children();
		}
	} else if (is_scalar(algn)) {
		// If align is a number and not a vector, then translate PRE-rotation.
		orient_and_align(size=size, orient=orient) {
			translate(vmul(size/2, algn*V_UP)) children();
		}
	} else if (is_str(algn)) {
		// If align is a string, look for an alignments label that matches.
		found = search([algn], alignments, num_returns_per_match=1);
		if (found != [[]]) {
			orient_and_align(size=size, orient=orient) {
				idx = found[0];
				delta = alignments[idx][1];
				translate(-delta) children();
			}
		} else {
			assertion(1==0, str("Alignment label '", algn, "' is not known.", (alignments? str("  Try one of ", [for (v=alignments) v[0]], ".") : "")));
		}
	} else if (orient != ORIENT_Z) {
		rotsize = (
			(orient==ORIENT_X)? [size[2], size[0], size[1]] :
			(orient==ORIENT_Y)? [size[0], size[2], size[1]] :
			vabs(rotate_points3d([size], orient)[0])
		);
		orient_and_align(size=rotsize, align=algn) {
			rotate(orient) children();
		}
	} else if (is_def(algn) && algn != [0,0,0]) {
		translate(vmul(size/2, algn)) children();
	} else {
		children();
	}
}



// vim: noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 nowrap


// Section: Cuboids


// Module: cuboid()
//
// Description:
//   Creates a cube or cuboid object, with optional chamfering or filleting/rounding.
//
// Arguments:
//   size = The size of the cube.
//   chamfer = Size of chamfer, inset from sides.  Default: No chamferring.
//   fillet = Radius of fillet for edge rounding.  Default: No filleting.
//   edges = Edges to chamfer/fillet.  Use `EDGE` constants from constants.scad. Default: `EDGES_ALL`
//   trimcorners = If true, rounds or chamfers corners where three chamferred/filleted edges meet.  Default: `true`
//   p1 = Align the cuboid's corner at `p1`, if given.  Forces `align=V_UP+V_BACK+V_RIGHT`.
//   p2 = If given with `p1`, defines the cornerpoints of the cuboid.
//   align = The side of the origin to align to.  Use `V_` constants from `constants.scad`.  Default: `V_CENTER`
//   center = If given, overrides `align`.  A true value sets `align=V_CENTER`, false sets `align=V_UP+V_BACK+V_RIGHT`.
//
// Example: Simple regular cube.
//   cuboid(40);
// Example: Cube with minimum cornerpoint given.
//   cuboid(20, p1=[10,0,0]);
// Example: Rectangular cube, with given X, Y, and Z sizes.
//   cuboid([20,40,50]);
// Example: Rectangular cube defined by opposing cornerpoints.
//   cuboid(p1=[0,10,0], p2=[20,30,30]);
// Example: Rectangular cube with chamferred edges and corners.
//   cuboid([30,40,50], chamfer=5);
// Example: Rectangular cube with chamferred edges, without trimmed corners.
//   cuboid([30,40,50], chamfer=5, trimcorners=false);
// Example: Rectangular cube with rounded edges and corners.
//   cuboid([30,40,50], fillet=10);
// Example: Rectangular cube with rounded edges, without trimmed corners.
//   cuboid([30,40,50], fillet=10, trimcorners=false);
// Example: Rectangular cube with only some edges chamferred.
//   cuboid([30,40,50], chamfer=5, edges=EDGE_TOP_FR+EDGE_TOP_RT+EDGE_FR_RT, $fn=24);
// Example: Rectangular cube with only some edges rounded.
//   cuboid([30,40,50], fillet=5, edges=EDGE_TOP_FR+EDGE_TOP_RT+EDGE_FR_RT, $fn=24);
module cuboid(
	size=[1,1,1],
	p1=undef, p2=undef,
	chamfer=undef,
	fillet=undef,
	edges=EDGES_ALL,
	trimcorners=true,
	align=[0,0,0],
	center=undef
) {
	size = scalar_vec3(size);
	if (is_def(p1)) {
		if (is_def(p2)) {
			translate([for (v=array_zip([p1,p2],fill=0)) min(v)]) {
				cuboid(size=vabs(p2-p1), chamfer=chamfer, fillet=fillet, edges=edges, trimcorners=trimcorners, align=V_ALLPOS);
			}
		} else {
			translate(p1) {
				cuboid(size=size, chamfer=chamfer, fillet=fillet, edges=edges, trimcorners=trimcorners, align=V_ALLPOS);
			}
		}
	} else {
		majrots = [[0,90,0], [90,0,0], [0,0,0]];

		// Not the most elegant, but should work fine.
		// Size for edge E can be ignored if there are only zeros in both edges !E
		relevantsize = [for(a=[0:2]) if(max(edges[(a+1)%3]+edges[(a+2)%3])>0) size[a]];

		if (chamfer != undef && len(relevantsize) > 0) assertion(chamfer <= min(relevantsize)/2, "chamfer must be smaller than half the cube width, length, or height.");
		if (fillet != undef && len(relevantsize) > 0 )  assertion(fillet <= min(relevantsize)/2, "fillet must be smaller than half the cube width, length, or height.");
		algn = (!is_def(center))? (is_scalar(align)? align*V_UP : align) : (center==true)? V_CENTER : V_ALLPOS;
		translate(vmul(size/2, algn)) {
			if (chamfer != undef) {
				isize = [for (v = size) max(0.001, v-2*chamfer)];
				if (edges == EDGES_ALL && trimcorners) {
					hull() {
						cube([size[0], isize[1], isize[2]], center=true);
						cube([isize[0], size[1], isize[2]], center=true);
						cube([isize[0], isize[1], size[2]], center=true);
					}
				} else {
					difference() {
						cube(size, center=true);

						// Chamfer edges
						for (i = [0:3], axis=[0:2]) {
							if (edges[axis][i]>0) {
								translate(vmul(EDGE_OFFSETS[axis][i], size/2)) {
									rotate(majrots[axis]) {
										zrot(45) cube([chamfer*sqrt(2), chamfer*sqrt(2), size[axis]+0.01], center=true);
									}
								}
							}
						}

						// Chamfer triple-edge corners.
						if (trimcorners) {
							for (za=[-1,1], ya=[-1,1], xa=[-1,1]) {
								if (corner_edge_count(edges, [xa,ya,za]) > 2) {
									translate(vmul([xa,ya,za]/2, size-[1,1,1]*chamfer*4/3)) {
										rot(from=V_UP, to=[xa,ya,za]) {
											upcube(chamfer*3);
										}
									}
								}
							}
						}
					}
				}
			} else if (fillet != undef) {
				sides = quantup(segs(fillet),4);
				sc = 1/cos(180/sides);
				isize = [for (v = size) max(0.001, v-2*fillet)];
				if (edges == EDGES_ALL) {
					minkowski() {
						cube(isize, center=true);
						if (trimcorners) {
							rotate_extrude(convexity=2,$fn=sides) {
								polygon([for (i=[0:1:sides/2]) let(a=i*360/sides-90) fillet*sc*[cos(a),sin(a)]]);
							}
						} else {
							intersection() {
								zrot(180/sides) cylinder(r=fillet*sc, h=fillet*2, center=true, $fn=sides);
								rotate([90,0,0]) zrot(180/sides) cylinder(r=fillet*sc, h=fillet*2, center=true, $fn=sides);
								rotate([0,90,0]) zrot(180/sides) cylinder(r=fillet*sc, h=fillet*2, center=true, $fn=sides);
							}
						}
					}
				} else {
					difference() {
						cube(size, center=true);

						// Round edges.
						for (i = [0:3], axis=[0:2]) {
							if (edges[axis][i]>0) {
								difference() {
									translate(vmul(EDGE_OFFSETS[axis][i], size/2)) {
										rotate(majrots[axis]) cube([fillet*2, fillet*2, size[axis]+0.1], center=true);
									}
									translate(vmul(EDGE_OFFSETS[axis][i], size/2 - [1,1,1]*fillet)) {
										rotate(majrots[axis]) zrot(180/sides) cylinder(h=size[axis]+0.2, r=fillet*sc, center=true, $fn=sides);
									}
								}
							}
						}

						// Round triple-edge corners.
						if (trimcorners) {
							for (za=[-1,1], ya=[-1,1], xa=[-1,1]) {
								if (corner_edge_count(edges, [xa,ya,za]) > 2) {
									difference() {
										translate(vmul([xa,ya,za], size/2)) {
											cube(fillet*2, center=true);
										}
										translate(vmul([xa,ya,za], size/2-[1,1,1]*fillet)) {
											zrot(180/sides) sphere(r=fillet*sc*sc, $fn=sides);
										}
									}
								}
							}
						}
					}
				}
			} else {
				cube(size=size, center=true);
			}
		}
	}
}



// Module: cube2pt()
// Status: DEPRECATED, use `cuboid(p1,p2)` instead.
//
// Usage:
//   cube2pt(p1,p2)
//
// Description:
//   Creates a cube between two points.
//
// Arguments:
//   p1 = Coordinate point of one cube corner.
//   p2 = Coordinate point of opposite cube corner.
module cube2pt(p1,p2) {
	deprecate("cube2pt()", "cuboid(p1,p2)");
	cuboid(p1=p1, p2=p2);
}



// Module: span_cube()
//
// Description:
//   Creates a cube that spans the X, Y, and Z ranges given.
//
// Arguments:
//   xspan = [min, max] X axis range.
//   yspan = [min, max] Y axis range.
//   zspan = [min, max] Z axis range.
//
// Example:
//   span_cube([0,15], [5,10], [0, 10]);
module span_cube(xspan, yspan, zspan) {
	span = [xspan, yspan, zspan];
	cuboid(p1=array_subindex(span,0), p2=array_subindex(span,1));
}



// Module: offsetcube()
// Status: DEPRECATED, use `cuboid(..., align)` instead.
//
// Description:
//   Makes a cube that is offset along the given vector by half the cube's size.
//   For example, if `v=[-1,1,0]`, the cube's front right edge will be centered at the origin.
//
// Arguments:
//   size = size of cube.
//   v = vector to offset along.
module offsetcube(size=[1,1,1], v=[0,0,0]) {
	deprecate("offsetcube()", "cuboid()");
	cuboid(size=size, align=v);
}


// Module: leftcube()
//
// Description:
//   Makes a cube that is aligned on the left side of the origin.
//
// Usage:
//   leftcube(size);
//
// Arguments:
//   size = The size of the cube to make.
//
// Example:
//   leftcube([20,30,40]);
module leftcube(size=[1,1,1]) {siz = scalar_vec3(size); left(siz[0]/2) cube(size=size, center=true);}


// Module: rightcube()
//
// Description:
//   Makes a cube that is aligned on the right side of the origin.
//
// Usage:
//   rightcube(size);
//
// Arguments:
//   size = The size of the cube to make.
//
// Example:
//   rightcube([20,30,40]);
module rightcube(size=[1,1,1]) {siz = scalar_vec3(size); right(siz[0]/2) cube(size=size, center=true);}


// Module: fwdcube()
//
// Description:
//   Makes a cube that is aligned on the front side of the origin.
//
// Usage:
//   fwdcube(size);
//
// Arguments:
//   size = The size of the cube to make.
//
// Example:
//   fwdcube([20,30,40]);
module fwdcube(size=[1,1,1]) {siz = scalar_vec3(size); fwd(siz[1]/2) cube(size=size, center=true);}


// Module: backcube()
//
// Description:
//   Makes a cube that is aligned on the front side of the origin.
//
// Usage:
//   backcube(size);
//
// Arguments:
//   size = The size of the cube to make.
//
// Example:
//   backcube([20,30,40]);
module backcube(size=[1,1,1]) {siz = scalar_vec3(size); back(siz[1]/2) cube(size=size, center=true);}


// Module: downcube()
//
// Description:
//   Makes a cube that is aligned on the bottom side of the origin.
//
// Usage:
//   downcube(size);
//
// Arguments:
//   size = The size of the cube to make.
//
// Example:
//   downcube([20,30,40]);
module downcube(size=[1,1,1]) {siz = scalar_vec3(size); down(siz[2]/2) cube(size=size, center=true);}


// Module: upcube()
//
// Description:
//   Makes a cube that is aligned on the top side of the origin.
//
// Usage:
//   upcube(size);
//
// Arguments:
//   size = The size of the cube to make.
//
// Example:
//   upcube([20,30,40]);
module upcube(size=[1,1,1]) {siz = scalar_vec3(size); up(siz[2]/2) cube(size=size, center=true);}


// Module: chamfcube()
// Status: DEPRECATED, use `cuboid(..., chamfer, edges, trimcorners)` instead.
//
// Description:
//   Makes a cube with chamfered edges.
//
// Arguments:
//   size = Size of cube [X,Y,Z].  (Default: `[1,1,1]`)
//   chamfer = Chamfer inset along axis.  (Default: `0.25`)
//   chamfaxes = Array [X,Y,Z] of boolean values to specify which axis edges should be chamfered.
//   chamfcorners = Boolean to specify if corners should be flat chamferred.
module chamfcube(size=[1,1,1], chamfer=0.25, chamfaxes=[1,1,1], chamfcorners=false) {
	deprecate("chamfcube()", "cuboid()");
	cuboid(
		size=size,
		chamfer=chamfer,
		trimcorners=chamfcorners,
		edges = (
			(chamfaxes[0]? EDGES_X_ALL : EDGES_NONE) +
			(chamfaxes[1]? EDGES_Y_ALL : EDGES_NONE) +
			(chamfaxes[2]? EDGES_Z_ALL : EDGES_NONE)
		)
	);
}


// Module: rrect()
// Status: DEPRECATED, use `cuboid(..., fillet, edges)` instead.
//
// Description:
//   Makes a cube with rounded (filletted) vertical edges. The `r` size will be
//   limited to a maximum of half the length of the shortest XY side.
//
// Arguments:
//   size = Size of cube [X,Y,Z].  (Default: `[1,1,1]`)
//   r = Radius of edge/corner rounding.  (Default: `0.25`)
//   center = If true, object will be centered.  If false, sits on top of XY plane.
module rrect(size=[1,1,1], r=0.25, center=false) {
	deprecate("rrect()", "cuboid()");
	cuboid(size=size, fillet=r, edges=EDGES_Z_ALL, align=center? V_CENTER : V_UP);
}


// Module: rcube()
// Status: DEPRECATED, use `cuboid(..., fillet)` instead.
//
// Description:
//   Makes a cube with rounded (filletted) edges and corners.  The `r` size will be
//   limited to a maximum of half the length of the shortest cube side.
//
// Arguments:
//   size = Size of cube [X,Y,Z].  (Default: `[1,1,1]`)
//   r = Radius of edge/corner rounding.  (Default: `0.25`)
//   center = If true, object will be centered.  If false, sits on top of XY plane.
module rcube(size=[1,1,1], r=0.25, center=false) {
	deprecate("rcube()", "cuboid()");
	cuboid(size=size, fillet=r, align=center? V_CENTER : V_UP);
}



// Section: Prismoids


// Module: prismoid()
//
// Description:
//   Creates a rectangular prismoid shape.
//
// Usage:
//   prismoid(size1, size2, h, [shift], [orient], [align|center]);
//
// Arguments:
//   size1 = [width, length] of the axis-negative end of the prism.
//   size2 = [width, length] of the axis-positive end of the prism.
//   h = Height of the prism.
//   shift = [x, y] amount to shift the center of the top with respect to the center of the bottom.
//   orient = Orientation of the prismoid.  Use the `ORIENT_` constants from `constants.scad`.  Default: `ORIENT_Z`.
//   align = Alignment of the prismoid by the axis-negative (size1) end.  Use the `V_` constants from `constants.scad`.  Default: `ALIGN_POS`.
//   center = If given, overrides `align`.  A true value sets `align=V_CENTER`, false sets `align=ALIGN_POS`.
//
// Example: Rectangular Pyramid
//   prismoid(size1=[40,40], size2=[0,0], h=20);
// Example: Prism
//   prismoid(size1=[40,40], size2=[0,40], h=20);
// Example: Truncated Pyramid
//   prismoid(size1=[35,50], size2=[20,30], h=20);
// Example: Wedge
//   prismoid(size1=[60,35], size2=[30,0], h=30);
// Example: Truncated Tetrahedron
//   prismoid(size1=[10,40], size2=[40,10], h=40);
// Example: Inverted Truncated Pyramid
//   prismoid(size1=[15,5], size2=[30,20], h=20);
// Example: Right Prism
//   prismoid(size1=[30,60], size2=[0,60], shift=[-15,0], h=30);
// Example(FlatSpin): Shifting/Skewing
//   prismoid(size1=[50,30], size2=[20,20], h=20, shift=[15,5]);
module prismoid(
	size1=[1,1], size2=[1,1], h=1, shift=[0,0],
	orient=ORIENT_Z, align=ALIGN_POS, center=undef
) {
	eps = 0.001;
	s1 = [max(size1[0], eps), max(size1[1], eps)];
	s2 = [max(size2[0], eps), max(size2[1], eps)];
	shiftby = point3d(shift);
	orient_and_align([s1[0], s1[1], h], orient, align, center, noncentered=ALIGN_POS) {
		polyhedron(
			points=[
				[+s2[0]/2, +s2[1]/2, +h/2] + shiftby,
				[+s2[0]/2, -s2[1]/2, +h/2] + shiftby,
				[-s2[0]/2, -s2[1]/2, +h/2] + shiftby,
				[-s2[0]/2, +s2[1]/2, +h/2] + shiftby,
				[+s1[0]/2, +s1[1]/2, -h/2],
				[+s1[0]/2, -s1[1]/2, -h/2],
				[-s1[0]/2, -s1[1]/2, -h/2],
				[-s1[0]/2, +s1[1]/2, -h/2],
			],
			faces=[
				[0, 1, 2],
				[0, 2, 3],
				[0, 4, 5],
				[0, 5, 1],
				[1, 5, 6],
				[1, 6, 2],
				[2, 6, 7],
				[2, 7, 3],
				[3, 7, 4],
				[3, 4, 0],
				[4, 7, 6],
				[4, 6, 5],
			],
			convexity=2
		);
	}
}


// Module: trapezoid()
// Status: DEPRECATED, use `prismoid()` instead.
//
// Description:
//   Creates a rectangular prismoid shape.
//
// Usage:
//   trapezoid(size1, size2, h, [shift], [orient], [align|center]);
//
// Arguments:
//   size1 = [width, length] of the axis-negative end of the prism.
//   size2 = [width, length] of the axis-positive end of the prism.
//   h = Height of the prism.
//   shift = [x, y] amount to shift the center of the top with respect to the center of the bottom.
//   orient = Orientation of the prismoid.  Use the `ORIENT_` constants from `constants.scad`.  Default: `ORIENT_Z`.
//   align = Alignment of the prismoid by the axis-negative (size1) end.  Use the `V_` constants from `constants.scad`.  Default: `V_UP`
//   center = If given, overrides `align`.  A true value sets `align=V_CENTER`, false sets `align=V_UP`.
module trapezoid(size1=[1,1], size2=[1,1], h=1, center=false) {
	deprecate("trapezoid()", "prismoid()");
	prismoid(size1=size1, size2=size2, h=h, center=center);
}


// Module: rounded_prismoid()
//
// Description:
//   Creates a rectangular prismoid shape with rounded vertical edges.
//
// Arguments:
//   size1 = [width, length] of the bottom of the prism.
//   size2 = [width, length] of the top of the prism.
//   h = Height of the prism.
//   r = radius of vertical edge fillets.
//   r1 = radius of vertical edge fillets at bottom.
//   r2 = radius of vertical edge fillets at top.
//   shift = [x, y] amount to shift the center of the top with respect to the center of the bottom.
//   orient = Orientation of the prismoid.  Use the `ORIENT_` constants from `constants.scad`.  Default: `ORIENT_Z`.
//   align = Alignment of the prismoid by the axis-negative (`size1`) end.  Use the `V_` constants from `constants.scad`.  Default: `V_UP`.
//   center = vertically center the prism.  Overrides `align`.
//
// Example: Rounded Pyramid
//   rounded_prismoid(size1=[40,40], size2=[0,0], h=25, r=5);
// Example: Centered Rounded Pyramid
//   rounded_prismoid(size1=[40,40], size2=[0,0], h=25, r=5, center=true);
// Example: Disparate Top and Bottom Radii
//   rounded_prismoid(size1=[40,60], size2=[40,60], h=20, r1=3, r2=10, $fn=24);
// Example(FlatSpin): Shifting/Skewing
//   rounded_prismoid(size1=[50,30], size2=[20,20], h=20, shift=[15,5], r=5);
module rounded_prismoid(
	size1, size2, h, shift=[0,0],
	r=undef, r1=undef, r2=undef,
	align=V_UP, orient=ORIENT_Z, center=undef
) {
	eps = 0.001;
	maxrad1 = min(size1[0]/2, size1[1]/2);
	maxrad2 = min(size2[0]/2, size2[1]/2);
	rr1 = min(maxrad1, (r1!=undef)? r1 : r);
	rr2 = min(maxrad2, (r2!=undef)? r2 : r);
	shiftby = point3d(shift);
	orient_and_align([size1.x, size1.y, h], orient, align, center, noncentered=ALIGN_POS) {
		down(h/2)
		hull() {
			linear_extrude(height=eps, center=false, convexity=2) {
				offset(r=rr1) {
					square([max(eps, size1[0]-2*rr1), max(eps, size1[1]-2*rr1)], center=true);
				}
			}
			up(h-0.01) {
				translate(shiftby) {
					linear_extrude(height=eps, center=false, convexity=2) {
						offset(r=rr2) {
							square([max(eps, size2[0]-2*rr2), max(eps, size2[1]-2*rr2)], center=true);
						}
					}
				}
			}
		}
	}
}



// Module: pyramid()
// Status: DEPRECATED, use `cyl(, r2=0, $fn=N)` instead.
//
// Usage:
//   pyramid(n, h, l|r|d, [circum]);
//
// Description:
//   Creates a pyramidal prism with a given number of sides.
//
// Arguments:
//   n = number of pyramid sides.
//   h = height of the pyramid.
//   l = length of one side of the pyramid. (optional)
//   r = radius of the base of the pyramid. (optional)
//   d = diameter of the base of the pyramid. (optional)
//   circum = base circumscribes the circle of the given radius or diam.
module pyramid(n=4, h=1, l=1, r=undef, d=undef, circum=false)
{
	deprecate("pyramid()", "cyl()");
	radius = get_radius(r=r, d=d, dflt=l/2/sin(180/n));
	cyl(r1=radius, r2=0, l=h, circum=circum, $fn=n, realign=true, align=ALIGN_POS);
}


// Module: prism()
// Status: DEPRECATED, use `cyl(..., $fn=N)` instead.
//
// Usage:
//   prism(n, h, l|r|d, [circum]);
//
// Description:
//   Creates a vertical prism with a given number of sides.
//
// Arguments:
//   n = number of sides.
//   h = height of the prism.
//   l = length of one side of the prism. (optional)
//   r = radius of the prism. (optional)
//   d = diameter of the prism. (optional)
//   circum = prism circumscribes the circle of the given radius or diam.
module prism(n=3, h=1, l=1, r=undef, d=undef, circum=false, center=false)
{
	deprecate("prism()", "cyl()");
	radius = get_radius(r=r, d=d, dflt=l/2/sin(180/n));
	cyl(r=radius, l=h, circum=circum, $fn=n, realign=true, center=center);
}


// Module: right_triangle()
//
// Description:
//   Creates a 3D right triangular prism.
//
// Usage:
//   right_triangle(size, [orient], [align|center]);
//
// Arguments:
//   size = [width, thickness, height]
//   orient = The axis to place the hypotenuse along.  Only accepts `ORIENT_X`, `ORIENT_Y`, or `ORIENT_Z` from `constants.scad`.  Default: `ORIENT_Y`.
//   align = The side of the origin to align to.  Use `V_` constants from `constants.scad`.  Default: `V_UP+V_BACK+V_RIGHT`.
//   center = If given, overrides `align`.  A true value sets `align=V_CENTER`, false sets `align=V_UP+V_BACK+V_RIGHT`.
//
// Example: Centered
//   right_triangle([60, 10, 40], center=true);
// Example: *Non*-Centered
//   right_triangle([60, 10, 40]);
module right_triangle(size=[1, 1, 1], orient=ORIENT_Y, align=V_ALLPOS, center=undef)
{
	siz = scalar_vec3(size);
	orient_and_align(siz, align=align, center=center) {
		if (orient == ORIENT_X) {
			ang = atan2(siz[1], siz[2]);
			masksize = [siz[0], siz[1], norm([siz[1],siz[2]])] + [1,1,1];
			xrot(ang) {
				difference() {
					xrot(-ang) cube(siz, center=true);
					back(masksize[1]/2) cube(masksize, center=true);
				}
			}
		} else if (orient == ORIENT_Y) {
			ang = atan2(siz[0], siz[2]);
			masksize = [siz[0], siz[1], norm([siz[0],siz[2]])] + [1,1,1];
			yrot(-ang) {
				difference() {
					yrot(ang) cube(siz, center=true);
					right(masksize[0]/2) cube(masksize, center=true);
				}
			}
		} else if (orient == ORIENT_Z) {
			ang = atan2(siz[0], siz[1]);
			masksize = [norm([siz[0],siz[1]]), siz[1], siz[2]] + [1,1,1];
			zrot(-ang) {
				difference() {
					zrot(ang) cube(siz, center=true);
					back(masksize[1]/2) cube(masksize, center=true);
				}
			}
		}
	}
}



// Section: Cylindroids


// Module: cyl()
//
// Description:
//   Creates cylinders in various alignments and orientations,
//   with optional fillets and chamfers. You can use `r` and `l`
//   interchangably, and all variants allow specifying size
//   by either `r`|`d`, or `r1`|`d1` and `r2`|`d2`.
//   Note that that chamfers and fillets cannot cross the
//   midpoint of the cylinder's length.
//
// Usage: Normal Cylinders
//   cyl(l|h, r|d, [circum], [realign], [orient], [align], [center]);
//   cyl(l|h, r1|d1, r2/d2, [circum], [realign], [orient], [align], [center]);
//
// Usage: Chamferred Cylinders
//   cyl(l|h, r|d, chamfer, [chamfang], [from_end], [circum], [realign], [orient], [align], [center]);
//   cyl(l|h, r|d, chamfer1, [chamfang1], [from_end], [circum], [realign], [orient], [align], [center]);
//   cyl(l|h, r|d, chamfer2, [chamfang2], [from_end], [circum], [realign], [orient], [align], [center]);
//   cyl(l|h, r|d, chamfer1, chamfer2, [chamfang1], [chamfang2], [from_end], [circum], [realign], [orient], [align], [center]);
//
// Usage: Rounded/Filleted Cylinders
//   cyl(l|h, r|d, fillet, [circum], [realign], [orient], [align], [center]);
//   cyl(l|h, r|d, fillet1, [circum], [realign], [orient], [align], [center]);
//   cyl(l|h, r|d, fillet2, [circum], [realign], [orient], [align], [center]);
//   cyl(l|h, r|d, fillet1, fillet2, [circum], [realign], [orient], [align], [center]);
//
// Arguments:
//   l / h = Length of cylinder along oriented axis. (Default: 1.0)
//   r = Radius of cylinder.
//   r1 = Radius of the negative (X-, Y-, Z-) end of cylinder.
//   r2 = Radius of the positive (X+, Y+, Z+) end of cylinder.
//   d = Diameter of cylinder.
//   d1 = Diameter of the negative (X-, Y-, Z-) end of cylinder.
//   d2 = Diameter of the positive (X+, Y+, Z+) end of cylinder.
//   circum = If true, cylinder should circumscribe the circle of the given size.  Otherwise inscribes.  Default: `false`
//   chamfer = The size of the chamfers on the ends of the cylinder.  Default: none.
//   chamfer1 = The size of the chamfer on the axis-negative end of the cylinder.  Default: none.
//   chamfer2 = The size of the chamfer on the axis-positive end of the cylinder.  Default: none.
//   chamfang = The angle in degrees of the chamfers on the ends of the cylinder.
//   chamfang1 = The angle in degrees of the chamfer on the axis-negative end of the cylinder.
//   chamfang2 = The angle in degrees of the chamfer on the axis-positive end of the cylinder.
//   from_end = If true, chamfer is measured from the end of the cylinder, instead of inset from the edge.  Default: `false`.
//   fillet = The radius of the fillets on the ends of the cylinder.  Default: none.
//   fillet1 = The radius of the fillet on the axis-negative end of the cylinder.
//   fillet2 = The radius of the fillet on the axis-positive end of the cylinder.
//   realign = If true, rotate the cylinder by half the angle of one face.
//   orient = Orientation of the cylinder.  Use the `ORIENT_` constants from `constants.scad`.  Default: vertical.
//   align = Alignment of the cylinder.  Use the `V_` constants from `constants.scad`.  Default: centered.
//   center = If given, overrides `align`.  A true value sets `align=V_CENTER`, false sets `align=ALIGN_POS`.
//
// Example: By Radius
//   xdistribute(30) {
//       cyl(l=40, r=10);
//       cyl(l=40, r1=10, r2=5);
//   }
//
// Example: By Diameter
//   xdistribute(30) {
//       cyl(l=40, d=25);
//       cyl(l=40, d1=25, d2=10);
//   }
//
// Example: Chamferring
//   xdistribute(60) {
//       // Shown Left to right.
//       cyl(l=40, d=40, chamfer=7);  // Default chamfang=45
//       cyl(l=40, d=40, chamfer=7, chamfang=30, from_end=false);
//       cyl(l=40, d=40, chamfer=7, chamfang=30, from_end=true);
//   }
//
// Example: Rounding/Filleting
//   cyl(l=40, d=40, fillet=10);
//
// Example: Heterogenous Chamfers and Fillets
//   ydistribute(80) {
//       // Shown Front to Back.
//       cyl(l=40, d=40, fillet1=15, orient=ORIENT_X);
//       cyl(l=40, d=40, chamfer2=5, orient=ORIENT_X);
//       cyl(l=40, d=40, chamfer1=12, fillet2=10, orient=ORIENT_X);
//   }
//
// Example: Putting it all together
//   cyl(l=40, d1=25, d2=15, chamfer1=10, chamfang1=30, from_end=true, fillet2=5);
module cyl(
	l=undef, h=undef,
	r=undef, r1=undef, r2=undef,
	d=undef, d1=undef, d2=undef,
	chamfer=undef, chamfer1=undef, chamfer2=undef,
	chamfang=undef, chamfang1=undef, chamfang2=undef,
	fillet=undef, fillet1=undef, fillet2=undef,
	circum=false, realign=false, from_end=false,
	orient=ORIENT_Z, align=V_CENTER, center=undef
) {
	r1 = get_radius(r1, r, d1, d, 1);
	r2 = get_radius(r2, r, d2, d, 1);
	l = first_defined([l, h, 1]);
	sides = segs(max(r1,r2));
	sc = circum? 1/cos(180/sides) : 1;
	orient_and_align([r1*2,r1*2,l], orient, align, center=center) {
		zrot(realign? 180/sides : 0) {
			if (!any_defined([chamfer, chamfer1, chamfer2, fillet, fillet1, fillet2])) {
				cylinder(h=l, r1=r1*sc, r2=r2*sc, center=true, $fn=sides);
			} else {
				vang = atan2(l, r1-r2)/2;
				chang1 = 90-first_defined([chamfang1, chamfang, vang]);
				chang2 = 90-first_defined([chamfang2, chamfang, 90-vang]);
				cham1 = (chamfer != undef || chamfer1 != undef)?first_defined([chamfer1, chamfer]) * (from_end? 1 : tan(chang1)):undef;
				cham2 = (chamfer != undef || chamfer2 != undef)?first_defined([chamfer2, chamfer]) * (from_end? 1 : tan(chang2)):undef;
				fil1 = first_defined([fillet1, fillet]);
				fil2 = first_defined([fillet2, fillet]);
				if (chamfer != undef) {
					assertion(chamfer <= r1,  "chamfer is larger than the r1 radius of the cylinder.");
					assertion(chamfer <= r2,  "chamfer is larger than the r2 radius of the cylinder.");
					assertion(chamfer <= l/2, "chamfer is larger than half the length of the cylinder.");
				}
				if (cham1 != undef) {
					assertion(cham1 <= r1,  "chamfer1 is larger than the r1 radius of the cylinder.");
					assertion(cham1 <= l/2, "chamfer1 is larger than half the length of the cylinder.");
				}
				if (cham2 != undef) {
					assertion(cham2 <= r2,  "chamfer2 is larger than the r2 radius of the cylinder.");
					assertion(cham2 <= l/2, "chamfer2 is larger than half the length of the cylinder.");
				}
				if (fillet != undef) {
					assertion(fillet <= r1,  "fillet is larger than the r1 radius of the cylinder.");
					assertion(fillet <= r2,  "fillet is larger than the r2 radius of the cylinder.");
					assertion(fillet <= l/2, "fillet is larger than half the length of the cylinder.");
				}
				if (fil1 != undef) {
					assertion(fil1 <= r1,  "fillet1 is larger than the r1 radius of the cylinder.");
					assertion(fil1 <= l/2, "fillet1 is larger than half the length of the cylinder.");
				}
				if (fil2 != undef) {
					assertion(fil2 <= r2,  "fillet2 is larger than the r1 radius of the cylinder.");
					assertion(fil2 <= l/2, "fillet2 is larger than half the length of the cylinder.");
				}

				dy1 = first_defined([cham1, fil1, 0]);
				dy2 = first_defined([cham2, fil2, 0]);
				maxd = max(r1,r2,l);

				rotate_extrude(convexity=2) {
					hull() {
						difference() {
							union() {
								difference() {
									back(l/2) {
										if (cham2!=undef && cham2>0) {
											rr2 = sc * (r2 + (r1-r2)*dy2/l);
											chlen2 = min(rr2, cham2/sin(chang2));
											translate([rr2,-cham2]) {
												rotate(-chang2) {
													translate([-chlen2,-chlen2]) {
														square(chlen2, center=false);
													}
												}
											}
										} else if (fil2!=undef && fil2>0) {
											translate([r2-fil2*tan(vang),-fil2]) {
												circle(r=fil2);
											}
										} else {
											translate([r2-0.005,-0.005]) {
												square(0.01, center=true);
											}
										}
									}

									// Make sure the corner fiddly bits never cross the X axis.
									fwd(maxd) square(maxd, center=false);
								}
								difference() {
									fwd(l/2) {
										if (cham1!=undef && cham1>0) {
											rr1 = sc * (r1 + (r2-r1)*dy1/l);
											chlen1 = min(rr1, cham1/sin(chang1));
											translate([rr1,cham1]) {
												rotate(chang1) {
													left(chlen1) {
														square(chlen1, center=false);
													}
												}
											}
										} else if (fil1!=undef && fil1>0) {
											right(r1) {
												translate([-fil1/tan(vang),fil1]) {
													fsegs1 = quantup(segs(fil1),4);
													circle(r=fil1,$fn=fsegs1);
												}
											}
										} else {
											right(r1-0.01) {
												square(0.01, center=false);
											}
										}
									}

									// Make sure the corner fiddly bits never cross the X axis.
									square(maxd, center=false);
								}

								// Force the hull to extend to the axis
								right(0.01/2) square([0.01, l], center=true);
							}

							// Clear anything left of the Y axis.
							left(maxd/2) square(maxd, center=true);

							// Clear anything right of face
							right((r1+r2)/2) {
								rotate(90-vang*2) {
									fwd(maxd/2) square(maxd, center=false);
								}
							}
						}
					}
				}
			}
		}
	}
}



// Module: downcyl()
//
// Description:
//   Creates a cylinder aligned below the origin.
//
// Usage:
//   downcyl(l|h, r|d);
//   downcyl(l|h, r1|d1, r2|d2);
//
// Arguments:
//   l / h = Length of cylinder. (Default: 1.0)
//   r = Radius of cylinder.
//   r1 = Bottom radius of cylinder.
//   r2 = Top radius of cylinder.
//   d = Diameter of cylinder. (use instead of r)
//   d1 = Bottom diameter of cylinder.
//   d2 = Top diameter of cylinder.
//
// Example: Cylinder
//   downcyl(r=20, h=40);
// Example: Cone
//   downcyl(r1=10, r2=20, h=40);
module downcyl(r=undef, h=undef, l=undef, d=undef, d1=undef, d2=undef, r1=undef, r2=undef)
{
	h = first_defined([l, h, 1]);
	down(h/2) {
		cylinder(r=r, r1=r1, r2=r2, d=d, d1=d1, d2=d2, h=h, center=true);
	}
}



// Module: xcyl()
//
// Description:
//   Creates a cylinder oriented along the X axis.
//
// Usage:
//   xcyl(l|h, r|d, [align|center]);
//   xcyl(l|h, r1|d1, r2|d2, [align|center]);
//
// Arguments:
//   l / h = Length of cylinder along oriented axis. (Default: `1.0`)
//   r = Radius of cylinder.
//   r1 = Optional radius of left (X-) end of cylinder.
//   r2 = Optional radius of right (X+) end of cylinder.
//   d = Optional diameter of cylinder. (use instead of `r`)
//   d1 = Optional diameter of left (X-) end of cylinder.
//   d2 = Optional diameter of right (X+) end of cylinder.
//   align = The side of the origin to align to.  Use `V_` constants from `constants.scad`. Default: `V_CENTER`
//   center = If given, overrides `align`.  A `true` value sets `align=V_CENTER`, `false` sets `align=ALIGN_POS`.
//
// Example: By Radius
//   ydistribute(50) {
//       xcyl(l=35, r=10);
//       xcyl(l=35, r1=15, r2=5);
//   }
//
// Example: By Diameter
//   ydistribute(50) {
//       xcyl(l=35, d=20);
//       xcyl(l=35, d1=30, d2=10);
//   }
module xcyl(l=undef, r=undef, d=undef, r1=undef, r2=undef, d1=undef, d2=undef, h=undef, align=V_CENTER, center=undef)
{
	cyl(l=l, h=h, r=r, r1=r1, r2=r2, d=d, d1=d1, d2=d2, orient=ORIENT_X, align=align, center=center);
}



// Module: ycyl()
//
// Description:
//   Creates a cylinder oriented along the Y axis.
//
// Usage:
//   ycyl(l|h, r|d, [align|center]);
//   ycyl(l|h, r1|d1, r2|d2, [align|center]);
//
// Arguments:
//   l / h = Length of cylinder along oriented axis. (Default: `1.0`)
//   r = Radius of cylinder.
//   r1 = Radius of front (Y-) end of cone.
//   r2 = Radius of back (Y+) end of one.
//   d = Diameter of cylinder.
//   d1 = Diameter of front (Y-) end of one.
//   d2 = Diameter of back (Y+) end of one.
//   align = The side of the origin to align to.  Use `V_` constants from `constants.scad`. Default: `V_CENTER`
//   center = Overrides `align` if given.  If true, `align=V_CENTER`, if false, `align=ALIGN_POS`.
//
// Example: By Radius
//   xdistribute(50) {
//       ycyl(l=35, r=10);
//       ycyl(l=35, r1=15, r2=5);
//   }
//
// Example: By Diameter
//   xdistribute(50) {
//       ycyl(l=35, d=20);
//       ycyl(l=35, d1=30, d2=10);
//   }
module ycyl(l=undef, r=undef, d=undef, r1=undef, r2=undef, d1=undef, d2=undef, h=undef, align=V_CENTER, center=undef)
{
	cyl(l=l, h=h, r=r, r1=r1, r2=r2, d=d, d1=d1, d2=d2, orient=ORIENT_Y, align=align, center=center);
}



// Module: zcyl()
//
// Description:
//   Creates a cylinder oriented along the Z axis.
//
// Usage:
//   zcyl(l|h, r|d, [align|center]);
//   zcyl(l|h, r1|d1, r2|d2, [align|center]);
//
// Arguments:
//   l / h = Length of cylinder along oriented axis. (Default: 1.0)
//   r = Radius of cylinder.
//   r1 = Radius of front (Y-) end of cone.
//   r2 = Radius of back (Y+) end of one.
//   d = Diameter of cylinder.
//   d1 = Diameter of front (Y-) end of one.
//   d2 = Diameter of back (Y+) end of one.
//   align = The side of the origin to align to.  Use `V_` constants from `constants.scad`. Default: `V_CENTER`
//   center = Overrides `align` if given.  If true, `align=V_CENTER`, if false, `align=ALIGN_POS`.
//
// Example: By Radius
//   xdistribute(50) {
//       zcyl(l=35, r=10);
//       zcyl(l=35, r1=15, r2=5);
//   }
//
// Example: By Diameter
//   xdistribute(50) {
//       zcyl(l=35, d=20);
//       zcyl(l=35, d1=30, d2=10);
//   }
module zcyl(l=undef, r=undef, d=undef, r1=undef, r2=undef, d1=undef, d2=undef, h=undef, align=V_CENTER, center=undef)
{
	cyl(l=l, h=h, r=r, r1=r1, r2=r2, d=d, d1=d1, d2=d2, orient=ORIENT_Z, align=align, center=center);
}



// Module: chamferred_cylinder()
// Status: DEPRECATED, use `cyl(..., chamfer)` instead.
//
// Usage:
//   chamferred_cylinder(h, r|d, chamfer|chamfedge, [top], [bottom], [center])
//
// Description:
//   Creates a cylinder with chamferred (bevelled) edges.
//
// Arguments:
//   h = height of cylinder. (Default: 1.0)
//   r = radius of cylinder. (Default: 1.0)
//   d = diameter of cylinder. (use instead of r)
//   chamfer = radial inset of the edge chamfer. (Default: 0.25)
//   chamfedge = length of the chamfer edge. (Use instead of chamfer)
//   top = boolean.  If true, chamfer the top edges. (Default: True)
//   bottom = boolean.  If true, chamfer the bottom edges. (Default: True)
//   center = boolean.  If true, cylinder is centered. (Default: false)
module chamferred_cylinder(h=1, r=undef, d=undef, chamfer=0.25, chamfedge=undef, angle=45, center=false, top=true, bottom=true)
{
	deprecate("chamf_cyl()` and `chamferred_cylinder()", "cyl()");
	r = get_radius(r=r, d=d, dflt=1);
	chamf = (chamfedge == undef)? chamfer : chamfedge * cos(angle);
	cyl(l=h, r=r, chamfer1=bottom? chamf : 0, chamfer2=top? chamf : 0, chamfang=angle, center=center);
}



// Module: chamf_cyl()
// Status: DEPRECATED, use `cyl(..., chamfer)` instead.
//
// Usage:
//   chamf_cyl(h, r|d, chamfer|chamfedge, [top], [bottom], [center])
//
// Description:
//   Creates a cylinder with chamferred (bevelled) edges.  Basically a shortcut of `chamferred_cylinder()`
//
// Arguments:
//   h = height of cylinder. (Default: 1.0)
//   r = radius of cylinder. (Default: 1.0)
//   d = diameter of cylinder. (use instead of r)
//   chamfer = radial inset of the edge chamfer. (Default: 0.25)
//   chamfedge = length of the chamfer edge. (Use instead of chamfer)
//   top = boolean.  If true, chamfer the top edges. (Default: True)
//   bottom = boolean.  If true, chamfer the bottom edges. (Default: True)
//   center = boolean.  If true, cylinder is centered. (Default: false)
module chamf_cyl(h=1, r=undef, d=undef, chamfer=0.25, chamfedge=undef, angle=45, center=false, top=true, bottom=true)
	chamferred_cylinder(h=h, r=r, d=d, chamfer=chamfer, chamfedge=chamfedge, angle=angle, center=center, top=top, bottom=bottom);


// Module: filleted_cylinder()
// Status: DEPRECATED, use `cyl(..., fillet)` instead.
//
// Usage:
//   filleted_cylinder(h, r|d, fillet, [center]);
//
// Description:
//   Creates a cylinder with filletted (rounded) ends.
//
// Arguments:
//   h = height of cylinder. (Default: 1.0)
//   r = radius of cylinder. (Default: 1.0)
//   d = diameter of cylinder. (Use instead of r)
//   fillet = radius of the edge filleting. (Default: 0.25)
//   center = boolean.  If true, cylinder is centered. (Default: false)
module filleted_cylinder(h=1, r=undef, d=undef, r1=undef, r2=undef, d1=undef, d2=undef, fillet=0.25, center=false) {
	deprecate("filleted_cylinder()", "cyl()");
	cyl(l=h, r=r, d=d, r1=r1, r2=r2, d1=d1, d2=d2, fillet=fillet, orient=ORIENT_Z, center=center);
}



// Module: rcylinder()
// Status: DEPRECATED, use `cyl(..., fillet)` instead.
//
// Usage:
//   rcylinder(h, r|d, fillet, [center]);
//
// Description:
//   Creates a cylinder with filletted (rounded) ends.
//   Basically a shortcut for `filleted_cylinder()`.
//
// Arguments:
//   h = height of cylinder. (Default: 1.0)
//   r = radius of cylinder. (Default: 1.0)
//   d = diameter of cylinder. (Use instead of r)
//   fillet = radius of the edge filleting. (Default: 0.25)
//   center = boolean.  If true, cylinder is centered. (Default: false)
module rcylinder(h=1, r=1, r1=undef, r2=undef, d=undef, d1=undef, d2=undef, fillet=0.25, center=false) {
	deprecate("rcylinder()", "cyl(..., fillet)");
	cyl(l=h, r=r, d=d, r1=r1, r2=r2, d1=d1, d2=d2, fillet=fillet, orient=ORIENT_Z, center=center);
}



// Module: tube()
//
// Description:
//   Makes a hollow tube with the given outer size and wall thickness.
//
// Usage:
//   tube(h, ir|id, wall, [realign], [orient], [align]);
//   tube(h, or|od, wall, [realign], [orient], [align]);
//   tube(h, ir|id, or|od, [realign], [orient], [align]);
//   tube(h, ir1|id1, ir2|id2, wall, [realign], [orient], [align]);
//   tube(h, or1|od1, or2|od2, wall, [realign], [orient], [align]);
//   tube(h, ir1|id1, ir2|id2, or1|od1, or2|od2, [realign], [orient], [align]);
//
// Arguments:
//   h = height of tube. (Default: 1)
//   or = Outer radius of tube.
//   or1 = Outer radius of bottom of tube.  (Default: value of r)
//   or2 = Outer radius of top of tube.  (Default: value of r)
//   od = Outer diameter of tube.
//   od1 = Outer diameter of bottom of tube.
//   od2 = Outer diameter of top of tube.
//   wall = horizontal thickness of tube wall. (Default 0.5)
//   ir = Inner radius of tube.
//   ir1 = Inner radius of bottom of tube.
//   ir2 = Inner radius of top of tube.
//   id = Inner diameter of tube.
//   id1 = Inner diameter of bottom of tube.
//   id2 = Inner diameter of top of tube.
//   realign = If true, rotate the tube by half the angle of one face.
//   orient = Orientation of the tube.  Use the `ORIENT_` constants from `constants.scad`.  Default: vertical.
//   align = Alignment of the tube.  Use the `V_` constants from `constants.scad`.  Default: centered.
//
// Example: These all Produce the Same Tube
//   tube(h=30, or=40, wall=5);
//   tube(h=30, ir=35, wall=5);
//   tube(h=30, or=40, ir=35);
//   tube(h=30, od=80, id=70);
// Example: These all Produce the Same Conical Tube
//   tube(h=30, or1=40, or2=25, wall=5);
//   tube(h=30, ir1=35, or2=20, wall=5);
//   tube(h=30, or1=40, or2=25, ir1=35, ir2=20);
// Example: Circular Wedge
//   tube(h=30, or1=40, or2=30, ir1=20, ir2=30);
module tube(
	h=1, wall=undef,
	r=undef, r1=undef, r2=undef,
	d=undef, d1=undef, d2=undef,
	or=undef, or1=undef, or2=undef,
	od=undef, od1=undef, od2=undef,
	ir=undef, id=undef, ir1=undef,
	ir2=undef, id1=undef, id2=undef,
	center=undef, orient=ORIENT_Z, align=ALIGN_POS,
	realign=false
) {
	r1 = first_defined([or1, od1==undef?undef:od1/2, r1, d1==undef?undef:d1/2, or, od==undef?undef:od/2, r, d==undef?undef:d/2, ir1==undef||wall==undef?undef:ir1+wall, id1==undef||wall==undef?undef:id1/2+wall, ir==undef||wall==undef?undef:ir+wall, id==undef||wall==undef?undef:id/2+wall]);
	r2 = first_defined([or2, od2==undef?undef:od2/2, r2, d2==undef?undef:d2/2, or, od==undef?undef:od/2, r, d==undef?undef:d/2, ir2==undef||wall==undef?undef:ir2+wall, id2==undef||wall==undef?undef:id2/2+wall, ir==undef||wall==undef?undef:ir+wall, id==undef||wall==undef?undef:id/2+wall]);
	ir1 = first_defined([ir1, id1==undef?undef:id1/2, ir, id==undef?undef:id/2, r1==undef||wall==undef?undef:r1-wall, d1==undef||wall==undef?undef:d1/2-wall, r==undef||wall==undef?undef:r-wall, d==undef||wall==undef?undef:d/2-wall]);
	ir2 = first_defined([ir2, id2==undef?undef:id2/2, ir, id==undef?undef:id/2, r2==undef||wall==undef?undef:r2-wall, d2==undef||wall==undef?undef:d2/2-wall, r==undef||wall==undef?undef:r-wall, d==undef||wall==undef?undef:d/2-wall]);
	assertion(ir1 <= r1, "Inner radius is larger than outer radius.");
	assertion(ir2 <= r2, "Inner radius is larger than outer radius.");
	sides = segs(max(r1,r2));
	orient_and_align([r1*2,r1*2,h], orient, align, center=center) {
		zrot(realign? 180/sides : 0) {
			difference() {
				cylinder(h=h, r1=r1, r2=r2, center=true, $fn=sides);
				if (ir1 == ir2) {
					cylinder(h=h+2, r1=ir1, r2=ir2, center=true);
				} else {
					cylinder(h=h+2, r=min(ir1,ir2), center=true);
					diff = abs(ir1-ir2);
					diff2 = diff*(h+1)/h;
					if (ir1 > ir2) {
						zmove(-0.5)
							cylinder(h=h+1, r1=ir2+diff2, r2=ir2, center=true);
					} else {
						zmove(0.5)
							cylinder(h=h+1, r1=ir1, r2=ir1+diff2, center=true);
					}
				}
			}
		}
	}
}


// Module: torus()
//
// Descriptiom:
//   Creates a torus shape.
//
// Usage:
//   torus(r|d, r2|d2, [orient], [align]);
//   torus(or|od, ir|id, [orient], [align]);
//
// Arguments:
//   r  = major radius of torus ring. (use with of 'r2', or 'd2')
//   r2 = minor radius of torus ring. (use with of 'r', or 'd')
//   d  = major diameter of torus ring. (use with of 'r2', or 'd2')
//   d2 = minor diameter of torus ring. (use with of 'r', or 'd')
//   or = outer radius of the torus. (use with 'ir', or 'id')
//   ir = inside radius of the torus. (use with 'or', or 'od')
//   od = outer diameter of the torus. (use with 'ir' or 'id')
//   id = inside diameter of the torus. (use with 'or' or 'od')
//   orient = Orientation of the torus.  Use the `ORIENT_` constants from `constants.scad`.  Default: `ORIENT_Z`.
//   align = Alignment of the torus.  Use the `V_` constants from `constants.scad`.  Default: `V_CENTER`.
//
// Example:
//   // These all produce the same torus.
//   torus(r=22.5, r2=7.5);
//   torus(d=45, d2=15);
//   torus(or=30, ir=15);
//   torus(od=60, id=30);
module torus(
	r=undef,  d=undef,
	r2=undef, d2=undef,
	or=undef, od=undef,
	ir=undef, id=undef,
	orient=ORIENT_Z, align=V_CENTER, center=undef
) {
	orr = get_radius(r=or, d=od, dflt=1.0);
	irr = get_radius(r=ir, d=id, dflt=0.5);
	majrad = get_radius(r=r, d=d, dflt=(orr+irr)/2);
	minrad = get_radius(r=r2, d=d2, dflt=(orr-irr)/2);
	orient_and_align([(majrad+minrad)*2, (majrad+minrad)*2, minrad*2], orient, align, center=center) {
		rotate_extrude(convexity=4) {
			right(majrad) circle(minrad);
		}
	}
}



// Section: Spheroids


// Module: staggered_sphere()
//
// Description:
//   An alternate construction to the standard `sphere()` built-in, with different triangulation.
//
// Usage:
//   staggered_sphere(r|d, [circum])
//
// Arguments:
//   r = Radius of the sphere.
//   d = Diameter of the sphere.
//   circum = If true, circumscribes the perfect sphere of the given size.
//
// Example:
//   staggered_sphere(d=100, circum=true, $fn=10);
module staggered_sphere(r=undef, d=undef, circum=false, align=V_CENTER) {
	r = get_radius(r=r, d=d, dflt=1);
	sides = segs(r);
	vsides = max(3, ceil(sides/2))+1;
	step = 360/sides;
	vstep = 180/(vsides-1);
	rr = circum? r/cos(180/sides)/cos(180/sides) : r;
	pts = concat(
		[[0,0,rr]],
		[
			for (p = [1:vsides-2], t = [0:sides-1]) let(
				ta = (t+(p%2/2))*step,
				pa = p*vstep
			) spherical_to_xyz(rr, ta, pa)
		],
		[[0,0,-rr]]
	);
	pcnt = len(pts);
	faces = concat(
		[
			for (i = [1:sides], j=[0,1])
			j? [0, i%sides+1, i] : [pcnt-1, pcnt-1-(i%sides+1), pcnt-1-i]
		],
		[
			for (p = [0:vsides-4], i = [0:sides-1], j=[0,1]) let(
				b1 = 1+p*sides,
				b2 = 1+(p+1)*sides,
				v1 = b1+i,
				v2 = b1+(i+1)%sides,
				v3 = b2+((i+((p%2)?(sides-1):0))%sides),
				v4 = b2+((i+1+((p%2)?(sides-1):0))%sides)
			) j? [v1,v4,v3] : [v1,v2,v4]
		]
	);
	zrot((floor(sides/4)%2==1)? 180/sides : 0) polyhedron(points=pts, faces=faces);
}



// Section: 3D Printing Shapes


// Module: teardrop2d()
//
// Description:
//   Makes a 2D teardrop shape. Useful for extruding into 3D printable holes.
//
// Usage:
//   teardrop2d(r|d, [ang], [cap_h]);
//
// Arguments:
//   r = radius of circular part of teardrop.  (Default: 1)
//   d = diameter of spherical portion of bottom. (Use instead of r)
//   ang = angle of hat walls from the Y axis.  (Default: 45 degrees)
//   cap_h = if given, height above center where the shape will be truncated.
//
// Example(2D): Typical Shape
//   teardrop2d(r=30, ang=30);
// Example(2D): Crop Cap
//   teardrop2d(r=30, ang=30, cap_h=40);
// Example(2D): Close Crop
//   teardrop2d(r=30, ang=30, cap_h=20);
module teardrop2d(r=1, d=undef, ang=45, cap_h=undef)
{
	eps = 0.01;
	r = get_radius(r=r, d=d, dflt=1);
	cord = 2 * r * cos(ang);
	cord_h = r * sin(ang);
	tip_y = (cord/2)/tan(ang);
	cap_h = min((is_def(cap_h)? cap_h : tip_y+cord_h), tip_y+cord_h);
	cap_w = cord * (1 - (cap_h - cord_h)/tip_y);
	difference() {
		hull() {
			zrot(90) circle(r=r);
			back(cap_h-eps/2) square([max(eps,cap_w), eps], center=true);
		}
		back(r+cap_h) square(2*r, center=true);
	}
}


// Module: teardrop()
//
// Description:
//   Makes a teardrop shape in the XZ plane. Useful for 3D printable holes.
//
// Usage:
//   teardrop(r|d, l|h, [ang], [cap_h], [orient], [align])
//
// Arguments:
//   r = Radius of circular part of teardrop.  (Default: 1)
//   d = Diameter of circular portion of bottom. (Use instead of r)
//   l = Thickness of teardrop. (Default: 1)
//   ang = Angle of hat walls from the Z axis.  (Default: 45 degrees)
//   cap_h = If given, height above center where the shape will be truncated.
//   orient = Orientation of the shape.  Use the `ORIENT_` constants from `constants.scad`.  Default: `ORIENT_Y`.
//   align = Alignment of the shape.  Use the `V_` constants from `constants.scad`.  Default: `V_CENTER`.
//
// Example: Typical Shape
//   teardrop(r=30, h=10, ang=30);
// Example: Crop Cap
//   teardrop(r=30, h=10, ang=30, cap_h=40);
// Example: Close Crop
//   teardrop(r=30, h=10, ang=30, cap_h=20);
module teardrop(r=undef, d=undef, l=undef, h=undef, ang=45, cap_h=undef, orient=ORIENT_Y, align=V_CENTER)
{
	r = get_radius(r=r, d=d, dflt=1);
	l = first_defined([l, h, 1]);
	orient_and_align([r*2,r*2,l], orient, align) {
		linear_extrude(height=l, center=true, slices=2) {
			teardrop2d(r=r, ang=ang, cap_h=cap_h);
		}
	}
}


// Module: onion()
//
// Description:
//   Creates a sphere with a conical hat, to make a 3D teardrop.
//
// Usage:
//   onion(r|d, [maxang], [cap_h], [orient], [align]);
//
// Arguments:
//   r = radius of spherical portion of the bottom. (Default: 1)
//   d = diameter of spherical portion of bottom.
//   cap_h = height above sphere center to truncate teardrop shape.
//   maxang = angle of cone on top from vertical.
//   orient = Orientation of the shape.  Use the `ORIENT_` constants from `constants.scad`.  Default: `ORIENT_Y`.
//   align = Alignment of the shape.  Use the `V_` constants from `constants.scad`.  Default: `V_CENTER`.
//
// Example: Typical Shape
//   onion(r=30, maxang=30);
// Example: Crop Cap
//   onion(r=30, maxang=30, cap_h=40);
// Example: Close Crop
//   onion(r=30, maxang=30, cap_h=20);
module onion(cap_h=undef, r=undef, d=undef, maxang=45, h=undef, orient=ORIENT_Z, align=V_CENTER)
{
	r = get_radius(r=r, d=d, dflt=1);
	h = first_defined([cap_h, h]);
	maxd = 3*r/tan(maxang);
	orient_and_align([r*2,r*2,r*2], orient, align) {
		rotate_extrude(convexity=2) {
			difference() {
				teardrop2d(r=r, ang=maxang, cap_h=h);
				left(r) square(size=[2*r,maxd], center=true);
			}
		}
	}
}


// Module: narrowing_strut()
//
// Description:
//   Makes a rectangular strut with the top side narrowing in a triangle.
//   The shape created may be likened to an extruded home plate from baseball.
//   This is useful for constructing parts that minimize the need to support
//   overhangs.
//
// Usage:
//   narrowing_strut(w, l, wall, [ang], [orient], [align]);
//
// Arguments:
//   w = Width (thickness) of the strut.
//   l = Length of the strut.
//   wall = height of rectangular portion of the strut.
//   ang = angle that the trianglar side will converge at.
//   orient = Orientation of the length axis of the shape.  Use the `ORIENT_` constants from `constants.scad`.  Default: `ORIENT_Y`.
//   align = Alignment of the shape.  Use the `V_` constants from `constants.scad`.  Default: `V_CENTER`.
//
// Example:
//   narrowing_strut(w=10, l=100, wall=5, ang=30);
module narrowing_strut(w=10, l=100, wall=5, ang=30, orient=ORIENT_Y, align=V_UP)
{
	h = wall + w/2/tan(ang);
	orient_and_align([w, h, l], orient, align, orig_orient=ORIENT_Z) {
		fwd(h/2) {
			linear_extrude(height=l, center=true, slices=2) {
				back(wall/2) square([w, wall], center=true);
				back(wall-0.001) {
					yscale(1/tan(ang)) {
						difference() {
							zrot(45) square(w/sqrt(2), center=true);
							fwd(w/2) square(w, center=true);
						}
					}
				}
			}
		}
	}
}


// Module: thinning_wall()
//
// Description:
//   Makes a rectangular wall which thins to a smaller width in the center,
//   with angled supports to prevent critical overhangs.
//
// Usage:
//   thinning_wall(h, l, thick, [ang], [strut], [wall], [orient], [align]);
//
// Arguments:
//   h = height of wall.
//   l = length of wall.  If given as a vector of two numbers, specifies bottom and top lengths, respectively.
//   thick = thickness of wall.
//   ang = maximum overhang angle of diagonal brace.
//   strut = the width of the diagonal brace.
//   wall = the thickness of the thinned portion of the wall.
//   orient = Orientation of the length axis of the wall.  Use the `ORIENT_` constants from `constants.scad`.  Default: `ORIENT_X`.
//   align = Alignment of the shape.  Use the `V_` constants from `constants.scad`.  Default: `V_CENTER`.
//
// Example: Typical Shape
//   thinning_wall(h=50, l=80, thick=4);
// Example: Trapezoidal
//   thinning_wall(h=50, l=[80,50], thick=4);
module thinning_wall(h=50, l=100, thick=5, ang=30, strut=5, wall=2, orient=ORIENT_X, align=V_CENTER)
{
	l1 = (l[0] == undef)? l : l[0];
	l2 = (l[1] == undef)? l : l[1];

	trap_ang = atan2((l2-l1)/2, h);
	corr1 = 1 + sin(trap_ang);
	corr2 = 1 - sin(trap_ang);

	z1 = h/2;
	z2 = max(0.1, z1 - strut);
	z3 = max(0.05, z2 - (thick-wall)/2*sin(90-ang)/sin(ang));

	x1 = l2/2;
	x2 = max(0.1, x1 - strut*corr1);
	x3 = max(0.05, x2 - (thick-wall)/2*sin(90-ang)/sin(ang)*corr1);
	x4 = l1/2;
	x5 = max(0.1, x4 - strut*corr2);
	x6 = max(0.05, x5 - (thick-wall)/2*sin(90-ang)/sin(ang)*corr2);

	y1 = thick/2;
	y2 = y1 - min(z2-z3, x2-x3) * sin(ang);

	orient_and_align([l1, thick, h], orient, align, orig_orient=ORIENT_X) {
		polyhedron(
			points=[
				[-x4, -y1, -z1],
				[ x4, -y1, -z1],
				[ x1, -y1,  z1],
				[-x1, -y1,  z1],

				[-x5, -y1, -z2],
				[ x5, -y1, -z2],
				[ x2, -y1,  z2],
				[-x2, -y1,  z2],

				[-x6, -y2, -z3],
				[ x6, -y2, -z3],
				[ x3, -y2,  z3],
				[-x3, -y2,  z3],

				[-x4,  y1, -z1],
				[ x4,  y1, -z1],
				[ x1,  y1,  z1],
				[-x1,  y1,  z1],

				[-x5,  y1, -z2],
				[ x5,  y1, -z2],
				[ x2,  y1,  z2],
				[-x2,  y1,  z2],

				[-x6,  y2, -z3],
				[ x6,  y2, -z3],
				[ x3,  y2,  z3],
				[-x3,  y2,  z3],
			],
			faces=[
				[ 4,  5,  1],
				[ 5,  6,  2],
				[ 6,  7,  3],
				[ 7,  4,  0],

				[ 4,  1,  0],
				[ 5,  2,  1],
				[ 6,  3,  2],
				[ 7,  0,  3],

				[ 8,  9,  5],
				[ 9, 10,  6],
				[10, 11,  7],
				[11,  8,  4],

				[ 8,  5,  4],
				[ 9,  6,  5],
				[10,  7,  6],
				[11,  4,  7],

				[11, 10,  9],
				[20, 21, 22],

				[11,  9,  8],
				[20, 22, 23],

				[16, 17, 21],
				[17, 18, 22],
				[18, 19, 23],
				[19, 16, 20],

				[16, 21, 20],
				[17, 22, 21],
				[18, 23, 22],
				[19, 20, 23],

				[12, 13, 17],
				[13, 14, 18],
				[14, 15, 19],
				[15, 12, 16],

				[12, 17, 16],
				[13, 18, 17],
				[14, 19, 18],
				[15, 16, 19],

				[ 0,  1, 13],
				[ 1,  2, 14],
				[ 2,  3, 15],
				[ 3,  0, 12],

				[ 0, 13, 12],
				[ 1, 14, 13],
				[ 2, 15, 14],
				[ 3, 12, 15],
			],
			convexity=6
		);
	}
}


// Module: braced_thinning_wall()
//
// Description:
//   Makes a rectangular wall with cross-bracing, which thins to a smaller width in the center,
//   with angled supports to prevent critical overhangs.
//
// Usage:
//   braced_thinning_wall(h, l, thick, [ang], [strut], [wall], [orient], [align]);
//
// Arguments:
//   h = height of wall.
//   l = length of wall.
//   thick = thickness of wall.
//   ang = maximum overhang angle of diagonal brace.
//   strut = the width of the diagonal brace.
//   wall = the thickness of the thinned portion of the wall.
//   orient = Orientation of the length axis of the wall.  Use the `ORIENT_` constants from `constants.scad`.  Default: `ORIENT_Y`.
//   align = Alignment of the shape.  Use the `V_` constants from `constants.scad`.  Default: `V_CENTER`.
//
// Example: Typical Shape
//   braced_thinning_wall(h=50, l=100, thick=5);
module braced_thinning_wall(h=50, l=100, thick=5, ang=30, strut=5, wall=2, orient=ORIENT_Y, align=V_CENTER)
{
	dang = atan((h-2*strut)/(l-2*strut));
	dlen = (h-2*strut)/sin(dang);
	orient_and_align([thick, l, h], orient, align, orig_orient=ORIENT_Y) {
		xrot_copies([0, 180]) {
			down(h/2) narrowing_strut(w=thick, l=l, wall=strut, ang=ang);
			fwd(l/2) xrot(-90) narrowing_strut(w=thick, l=h-0.1, wall=strut, ang=ang);
			intersection() {
				cube(size=[thick, l, h], center=true);
				xrot_copies([-dang,dang]) {
					zspread(strut/2) {
						scale([1,1,1.5]) yrot(45) {
							cube(size=[thick/sqrt(2), dlen, thick/sqrt(2)], center=true);
						}
					}
					cube(size=[thick, dlen, strut/2], center=true);
				}
			}
		}
		cube(size=[wall, l-0.1, h-0.1], center=true);
	}
}



// Module: thinning_triangle()
//
// Description:
//   Makes a triangular wall with thick edges, which thins to a smaller width in
//   the center, with angled supports to prevent critical overhangs.
//
// Usage:
//   thinning_triangle(h, l, thick, [ang], [strut], [wall], [diagonly], [orient], [align|center]);
//
// Arguments:
//   h = height of wall.
//   l = length of wall.
//   thick = thickness of wall.
//   ang = maximum overhang angle of diagonal brace.
//   strut = the width of the diagonal brace.
//   wall = the thickness of the thinned portion of the wall.
//   diagonly = boolean, which denotes only the diagonal side (hypotenuse) should be thick.
//   orient = Orientation of the length axis of the shape.  Use the `ORIENT_` constants from `constants.scad`.  Default: `ORIENT_Y`.
//   align = Alignment of the shape.  Use the `V_` constants from `constants.scad`.  Default: `V_CENTER`.
//   center = If true, centers shape.  If false, overrides `align` with `V_UP+V_BACK`.
//
// Example: Centered
//   thinning_triangle(h=50, l=80, thick=4, ang=30, strut=5, wall=2, center=true);
// Example: All Braces
//   thinning_triangle(h=50, l=80, thick=4, ang=30, strut=5, wall=2, center=false);
// Example: Diagonal Brace Only
//   thinning_triangle(h=50, l=80, thick=4, ang=30, strut=5, wall=2, diagonly=true, center=false);
module thinning_triangle(h=50, l=100, thick=5, ang=30, strut=5, wall=3, diagonly=false, center=undef, orient=ORIENT_Y, align=V_CENTER)
{
	dang = atan(h/l);
	dlen = h/sin(dang);
	orient_and_align([thick, l, h], orient, align, center=center, noncentered=V_UP+V_BACK, orig_orient=ORIENT_Y) {
		difference() {
			union() {
				if (!diagonly) {
					translate([0, 0, -h/2])
						narrowing_strut(w=thick, l=l, wall=strut, ang=ang);
					translate([0, -l/2, 0])
						xrot(-90) narrowing_strut(w=thick, l=h-0.1, wall=strut, ang=ang);
				}
				intersection() {
					cube(size=[thick, l, h], center=true);
					xrot(-dang) yrot(180) {
						narrowing_strut(w=thick, l=dlen*1.2, wall=strut, ang=ang);
					}
				}
				cube(size=[wall, l-0.1, h-0.1], center=true);
			}
			xrot(-dang) {
				translate([0, 0, h/2]) {
					cube(size=[thick+0.1, l*2, h], center=true);
				}
			}
		}
	}
}


// Module: thinning_brace()
// Status: DEPRECATED, use `thinning_triangle(..., diagonly=true)` instead.
//
// Description:
//   Makes a triangular wall which thins to a smaller width in the center,
//   with angled supports to prevent critical overhangs.  Basically an alias
//   of thinning_triangle(), with diagonly=true.
//
// Usage:
//   thinning_brace(h, l, thick, [ang], [strut], [wall], [center])
//
// Arguments:
//   h = height of wall.
//   l = length of wall.
//   thick = thickness of wall.
//   ang = maximum overhang angle of diagonal brace.
//   strut = the width of the diagonal brace.
//   wall = the thickness of the thinned portion of the wall.
module thinning_brace(h=50, l=100, thick=5, ang=30, strut=5, wall=3, center=true)
{
	deprecate("thinning_brace()", "thinning_triangle(..., diagonly=true)");
	thinning_triangle(h=h, l=l, thick=thick, ang=ang, strut=strut, wall=wall, diagonly=true, center=center);
}


// Module: sparse_strut()
//
// Description:
//   Makes an open rectangular strut with X-shaped cross-bracing, designed to reduce
//   the need for support material in 3D printing.
//
// Usage:
//   sparse_strut(h, l, thick, [strut], [maxang], [max_bridge], [orient], [align])
//
// Arguments:
//   h = height of strut wall.
//   l = length of strut wall.
//   thick = thickness of strut wall.
//   maxang = maximum overhang angle of cross-braces.
//   max_bridge = maximum bridging distance between cross-braces.
//   strut = the width of the cross-braces.
//   orient = Orientation of the length axis of the shape.  Use the `ORIENT_` constants from `constants.scad`.  Default: `ORIENT_Y`.
//   align = Alignment of the shape.  Use the `V_` constants from `constants.scad`.  Default: `V_CENTER`.
//
// Example: Typical Shape
//   sparse_strut(h=40, l=100, thick=3);
// Example: Thinner Strut
//   sparse_strut(h=40, l=100, thick=3, strut=2);
// Example: Larger maxang
//   sparse_strut(h=40, l=100, thick=3, strut=2, maxang=45);
// Example: Longer max_bridge
//   sparse_strut(h=40, l=100, thick=3, strut=2, maxang=45, max_bridge=30);
module sparse_strut(h=50, l=100, thick=4, maxang=30, strut=5, max_bridge=20, orient=ORIENT_Y, align=V_CENTER)
{
	zoff = h/2 - strut/2;
	yoff = l/2 - strut/2;

	maxhyp = 1.5 * (max_bridge+strut)/2 / sin(maxang);
	maxz = 2 * maxhyp * cos(maxang);

	zreps = ceil(2*zoff/maxz);
	zstep = 2*zoff / zreps;

	hyp = zstep/2 / cos(maxang);
	maxy = min(2 * hyp * sin(maxang), max_bridge+strut);

	yreps = ceil(2*yoff/maxy);
	ystep = 2*yoff / yreps;

	ang = atan(ystep/zstep);
	len = zstep / cos(ang);

	orient_and_align([thick, l, h], orient, align, orig_orient=ORIENT_Y) {
		zspread(zoff*2)
			cube(size=[thick, l, strut], center=true);
		yspread(yoff*2)
			cube(size=[thick, strut, h], center=true);
		yspread(ystep, n=yreps) {
			zspread(zstep, n=zreps) {
				xrot( ang) cube(size=[thick, strut, len], center=true);
				xrot(-ang) cube(size=[thick, strut, len], center=true);
			}
		}
	}
}


// Module: sparse_strut3d()
//
// Usage:
//   sparse_strut3d(h, w, l, [thick], [maxang], [max_bridge], [strut], [orient], [align]);
//
// Description:
//   Makes an open rectangular strut with X-shaped cross-bracing, designed to reduce the
//   need for support material in 3D printing.
//
// Arguments:
//   h = Z size of strut.
//   w = X size of strut.
//   l = Y size of strut.
//   thick = thickness of strut walls.
//   maxang = maximum overhang angle of cross-braces.
//   max_bridge = maximum bridging distance between cross-braces.
//   strut = the width of the cross-braces.
//   orient = Orientation of the length axis of the shape.  Use the `ORIENT_` constants from `constants.scad`.  Default: `ORIENT_Y`.
//   align = Alignment of the shape.  Use the `V_` constants from `constants.scad`.  Default: `V_CENTER`.
//
// Example: Typical Shape
//   sparse_strut3d(h=30, w=30, l=100);
// Example: Thinner strut
//   sparse_strut3d(h=30, w=30, l=100, strut=2);
// Example: Larger maxang
//   sparse_strut3d(h=30, w=30, l=100, strut=2, maxang=50);
// Example: Smaller max_bridge
//   sparse_strut3d(h=30, w=30, l=100, strut=2, maxang=50, max_bridge=20);
module sparse_strut3d(h=50, l=100, w=50, thick=3, maxang=40, strut=3, max_bridge=30, orient=ORIENT_Y, align=V_CENTER)
{

	xoff = w - thick;
	yoff = l - thick;
	zoff = h - thick;

	xreps = ceil(xoff/yoff);
	yreps = ceil(yoff/xoff);
	zreps = ceil(zoff/min(xoff, yoff));

	xstep = xoff / xreps;
	ystep = yoff / yreps;
	zstep = zoff / zreps;

	cross_ang = atan2(xstep, ystep);
	cross_len = hypot(xstep, ystep);

	supp_ang = min(maxang, min(atan2(max_bridge, zstep), atan2(cross_len/2, zstep)));
	supp_reps = floor(cross_len/2/(zstep*sin(supp_ang)));
	supp_step = cross_len/2/supp_reps;

	orient_and_align([w, l, h], orient, align, orig_orient=ORIENT_Y) {
		intersection() {
			union() {
				ybridge = (l - (yreps+1) * strut) / yreps;
				xspread(xoff) sparse_strut(h=h, l=l, thick=thick, maxang=maxang, strut=strut, max_bridge=ybridge/ceil(ybridge/max_bridge));
				yspread(yoff) zrot(90) sparse_strut(h=h, l=w, thick=thick, maxang=maxang, strut=strut, max_bridge=max_bridge);
				for(zs = [0:zreps-1]) {
					for(xs = [0:xreps-1]) {
						for(ys = [0:yreps-1]) {
							translate([(xs+0.5)*xstep-xoff/2, (ys+0.5)*ystep-yoff/2, (zs+0.5)*zstep-zoff/2]) {
								zflip_copy(offset=-(zstep-strut)/2) {
									xflip_copy() {
										zrot(cross_ang) {
											down(strut/2) {
												cube([strut, cross_len, strut], center=true);
											}
											if (zreps>1) {
												back(cross_len/2) {
													zrot(-cross_ang) {
														down(strut) upcube([strut, strut, zstep+strut]);
													}
												}
											}
											for (soff = [0 : supp_reps-1] ) {
												yflip_copy() {
													back(soff*supp_step) {
														skew_xy(ya=supp_ang) {
															upcube([strut, strut, zstep]);
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
			cube([w,l,h], center=true);
		}
	}
}


// Module: corrugated_wall()
//
// Description:
//   Makes a corrugated wall which relieves contraction stress while still
//   providing support strength.  Designed with 3D printing in mind.
//
// Usage:
//   corrugated_wall(h, l, thick, [strut], [wall], [orient], [align]);
//
// Arguments:
//   h = height of strut wall.
//   l = length of strut wall.
//   thick = thickness of strut wall.
//   strut = the width of the cross-braces.
//   wall = thickness of corrugations.
//   orient = Orientation of the length axis of the shape.  Use the `ORIENT_` constants from `constants.scad`.  Default: `ORIENT_Y`.
//   align = Alignment of the shape.  Use the `V_` constants from `constants.scad`.  Default: `V_CENTER`.
//
// Example: Typical Shape
//   corrugated_wall(h=50, l=100);
// Example: Wider Strut
//   corrugated_wall(h=50, l=100, strut=8);
// Example: Thicker Wall
//   corrugated_wall(h=50, l=100, strut=8, wall=3);
module corrugated_wall(h=50, l=100, thick=5, strut=5, wall=2, orient=ORIENT_Y, align=V_CENTER)
{
	amplitude = (thick - wall) / 2;
	period = min(15, thick * 2);
	steps = quantup(segs(thick/2),4);
	step = period/steps;
	il = l - 2*strut + 2*step;
	orient_and_align([thick, l, h], orient, align, orig_orient=ORIENT_Y) {
		linear_extrude(height=h-2*strut+0.1, slices=2, convexity=ceil(2*il/period), center=true) {
			polygon(
				points=concat(
					[for (y=[-il/2:step:il/2]) [amplitude*sin(y/period*360)-wall/2, y] ],
					[for (y=[il/2:-step:-il/2]) [amplitude*sin(y/period*360)+wall/2, y] ]
				)
			);
		}

		difference() {
			cube([thick, l, h], center=true);
			cube([thick+0.5, l-2*strut, h-2*strut], center=true);
		}
	}
}


// Section: Miscellaneous


// Module: nil()
//
// Description:
//   Useful when you MUST pass a child to a module, but you want it to be nothing.
module nil() union() {}


// Module: noop()
//
// Description:
//   Passes through the children passed to it, with no action at all.
//   Useful while debugging when you want to replace a command.
module noop() children();


// Module: pie_slice()
//
// Description:
//   Creates a pie slice shape.
//
// Usage:
//   pie_slice(ang, l|h, r|d, [orient], [align|center]);
//   pie_slice(ang, l|h, r1|d1, r2|d2, [orient], [align|center]);
//
// Arguments:
//   ang = pie slice angle in degrees.
//   h = height of pie slice.
//   r = radius of pie slice.
//   r1 = bottom radius of pie slice.
//   r2 = top radius of pie slice.
//   d = diameter of pie slice.
//   d1 = bottom diameter of pie slice.
//   d2 = top diameter of pie slice.
//   orient = Orientation of the pie slice.  Use the `ORIENT_` constants from `constants.scad`.  Default: `ORIENT_Z`.
//   align = Alignment of the pie slice.  Use the `V_` constants from `constants.scad`.  Default: `V_CENTER`.
//   center = If given, overrides `align`.  A true value sets `align=V_CENTER`, false sets `align=ALIGN_POS`.
//
// Example: Cylindrical Pie Slice
//   pie_slice(ang=45, l=20, r=30);
// Example: Conical Pie Slice
//   pie_slice(ang=60, l=20, d1=50, d2=70);
module pie_slice(
	ang=30, l=undef,
	r=undef, r1=undef, r2=undef,
	d=undef, d1=undef, d2=undef,
	orient=ORIENT_Z, align=ALIGN_POS,
	center=undef, h=undef
) {
	l = first_defined([l, h, 1]);
	r1 = get_radius(r1, r, d1, d, 10);
	r2 = get_radius(r2, r, d2, d, 10);
	maxd = max(r1,r2)+0.1;
	orient_and_align([2*r1, 2*r1, l], orient, align, center=center) {
		difference() {
			cylinder(r1=r1, r2=r2, h=l, center=true);
			if (ang<180) rotate(ang) back(maxd/2) cube([2*maxd, maxd, l+0.1], center=true);
			difference() {
				fwd(maxd/2) cube([2*maxd, maxd, l+0.2], center=true);
				if (ang>180) rotate(ang-180) back(maxd/2) cube([2*maxd, maxd, l+0.1], center=true);
			}
		}
	}
}


// Module: interior_fillet()
//
// Description:
//   Creates a shape that can be unioned into a concave joint between two faces, to fillet them.
//   Center this part along the concave edge to be chamferred and union it in.
//
// Usage:
//   interior_fillet(l, r, [ang], [overlap], [orient], [align]);
//
// Arguments:
//   l = length of edge to fillet.
//   r = radius of fillet.
//   ang = angle between faces to fillet.
//   overlap = overlap size for unioning with faces.
//   orient = Orientation of the fillet.  Use the `ORIENT_` constants from `constants.scad`.  Default: `ORIENT_X`.
//   align = Alignment of the fillet.  Use the `V_` or `ALIGN_` constants from `constants.scad`.  Default: `V_CENTER`.
//
// Example:
//   union() {
//       translate([0,2,-4]) upcube([20, 4, 24]);
//       translate([0,-10,-4]) upcube([20, 20, 4]);
//       color("green") interior_fillet(l=20, r=10, orient=ORIENT_XNEG);
//   }
//
// Example:
//   interior_fillet(l=40, r=10, orient=ORIENT_Y_90);
module interior_fillet(l=1.0, r=1.0, ang=90, overlap=0.01, orient=ORIENT_X, align=V_CENTER) {
	dy = r/tan(ang/2);
	orient_and_align([l,r,r], orient, align, orig_orient=ORIENT_X) {
		difference() {
			translate([0,-overlap/tan(ang/2),-overlap]) {
				if (ang == 90) {
					translate([0,r/2,r/2]) cube([l,r,r], center=true);
				} else {
					rotate([90,0,90]) pie_slice(ang=ang, r=dy+overlap, h=l, center=true);
				}
			}
			translate([0,dy,r]) xcyl(l=l+0.1, r=r);
		}
	}
}



// Module: slot()
//
// Description:
//   Makes a linear slot with rounded ends, appropriate for bolts to slide along.
//
// Usage:
//   slot(h, l, r|d, [orient], [align|center]);
//   slot(h, p1, p2, r|d, [orient], [align|center]);
//   slot(h, l, r1|d1, r2|d2, [orient], [align|center]);
//   slot(h, p1, p2, r1|d1, r2|d2, [orient], [align|center]);
//
// Arguments:
//   p1 = center of starting circle of slot.
//   p2 = center of ending circle of slot.
//   l = length of slot along the X axis.
//   h = height of slot shape. (default: 10)
//   r = radius of slot circle. (default: 5)
//   r1 = bottom radius of slot cone.
//   r2 = top radius of slot cone.
//   d = diameter of slot circle.
//   d1 = bottom diameter of slot cone.
//   d2 = top diameter of slot cone.
//
// Example: Between Two Points
//   slot([0,0,0], [50,50,0], r1=5, r2=10, h=5);
// Example: By Length
//   slot(l=50, r1=5, r2=10, h=5);
module slot(
	p1=undef, p2=undef, h=10, l=undef,
	r=undef, r1=undef, r2=undef,
	d=undef, d1=undef, d2=undef
) {
	r1 = get_radius(r1=r1, r=r, d1=d1, d=d, dflt=5);
	r2 = get_radius(r1=r2, r=r, d1=d2, d=d, dflt=5);
	sides = quantup(segs(max(r1, r2)), 4);
	hull() spread(p1=p1, p2=p2, l=l, n=2) cyl(l=h, r1=r1, r2=r2, center=true, $fn=sides);
}


// Module: arced_slot()
//
// Description:
//   Makes an arced slot, appropriate for bolts to slide along.
//
// Usage:
//   arced_slot(h, r|d, sr|sd, [sa], [ea], [orient], [align|center], [$fn2]);
//   arced_slot(h, r|d, sr1|sd1, sr2|sd2, [sa], [ea], [orient], [align|center], [$fn2]);
//
// Arguments:
//   cp = centerpoint of slot arc. (default: [0, 0, 0])
//   h = height of slot arc shape. (default: 1.0)
//   r = radius of slot arc. (default: 0.5)
//   d = diameter of slot arc. (default: 1.0)
//   sr = radius of slot channel. (default: 0.5)
//   sd = diameter of slot channel. (default: 0.5)
//   sr1 = bottom radius of slot channel cone. (use instead of sr)
//   sr2 = top radius of slot channel cone. (use instead of sr)
//   sd1 = bottom diameter of slot channel cone. (use instead of sd)
//   sd2 = top diameter of slot channel cone. (use instead of sd)
//   sa = starting angle. (Default: 0.0)
//   ea = ending angle. (Default: 90.0)
//   orient = Orientation of the arced slot.  Use the `ORIENT_` constants from `constants.scad`.  Default: `ORIENT_Z`.
//   align = Alignment of the arced slot.  Use the `V_` constants from `constants.scad`.  Default: `V_CENTER`.
//   center = If true, centers vertically.  If false, drops flush with XY plane.  Overrides `align`.
//   $fn2 = The $fn value to use on the small round endcaps.  The major arcs are still based on $fn.  Default: $fn
//
// Example: Typical Arced Slot
//   arced_slot(d=60, h=5, sd=10, sa=60, ea=280);
// Example: Conical Arced Slot
//   arced_slot(r=60, h=5, sd1=10, sd2=15, sa=45, ea=180);
module arced_slot(
	r=undef, d=undef, h=1.0,
	sr=undef, sr1=undef, sr2=undef,
	sd=undef, sd1=undef, sd2=undef,
	sa=0, ea=90, cp=[0,0,0],
	orient=ORIENT_Z, align=V_CENTER,
	$fn2 = undef
) {
	r = get_radius(r=r, d=d, dflt=2);
	sr1 = get_radius(sr1, sr, sd1, sd, 2);
	sr2 = get_radius(sr2, sr, sd2, sd, 2);
	fn_minor = first_defined([$fn2, $fn]);
	da = ea - sa;
	orient_and_align([r+sr1, r+sr1, h], orient, align) {
		translate(cp) {
			zrot(sa) {
				difference() {
					pie_slice(ang=da, l=h, r1=r+sr1, r2=r+sr2, orient=ORIENT_Z, align=V_CENTER);
					cylinder(h=h+0.1, r1=r-sr1, r2=r-sr2, center=true);
				}
				right(r) cylinder(h=h, r1=sr1, r2=sr2, center=true, $fn=fn_minor);
				zrot(da) right(r) cylinder(h=h, r1=sr1, r2=sr2, center=true, $fn=fn_minor);
			}
		}
	}
}



// vim: noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 nowrap

difference()
{
    cuboid(size=flatten([plate_size, [plate_thickness]]), fillet=2.5, edges=EDGES_Z_ALL, $fn=24);
    grid2d(size=[plate_size[0]-20,plate_size[1]-20],
            spacing=switch_size[0]+switch_gap, cols=colunms, rows=rows, stagger=false)
        cuboid(size=flatten([switch_size, [plate_thickness+0.1]]));
}
