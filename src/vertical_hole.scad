/*******************************************************************************
*
* Vertical Hole Library
*
* Author: Grégoire Saunier
* Website: www.ekunn.com
*
* License : MIT License
*
* Description:
* When 3D printing vertical holes, the top of the hole is flat and reduce the
* hole diameter. This library creates a hole with a specific shape on its top
* in order to avoid a diameter reduction.
* Please visit https://github.com/gregsaun/vertical_hole/ for more information.
* This library as been inspired by the x-axis-end of the Prusa i3 MK2 printer.
*
* Resources :
*   - Openscad : www.openscad.org
*   - Openscad pushfit_rod module from Prusa i3 MK2 :
*     https://github.com/prusa3d/Original-Prusa-i3/blob/2408cbe5b307ca18e2968de5c82fe0842bb4e2a1/Printed-Parts/scad/x-end.scad
*   - Josef Průša : www.prusa3d.com
*
******************************************************************************/


// Create vertical hole with clearance on top
module vertical_hole (h, r, layer_height, n = 40) {
    
    clearance_height = layer_height + 0.001;
    //clearance_width = r*2/1.8;
    //clearance_width = r*0.9;
    clearance_width = r*0.8;

    // Side length of the clearance rotated cube
    clearance_side = sqrt( pow(clearance_width/2,2) + pow(clearance_width/2,2) );

    // Z coord of clearance rotated cube
    clearance_side_z = sqrt( pow(r,2) - pow(clearance_width/2,2) );
    
    // Z coord for top cube
    clearance_top_z = r + clearance_height + clearance_side/2;
    
    // Make the hole
    translate([0,0,0]) rotate([-90,0,0]) cylinder(h=h, r=r, $fn=n, center=true);
    // Add clearance on top of the hole
    difference () {
        translate([0,0,clearance_side_z]) rotate(a=[0,45,0]) cube([clearance_side, h, clearance_side], center=true);
        translate([0,0,clearance_top_z]) cube([clearance_side, h, clearance_side], center=true);

    }
}
