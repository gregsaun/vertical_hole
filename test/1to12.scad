/*******************************************************************************
*
* Vertical Hole Tests
*
* Author: Grégoire Saunier
* Website: www.ekunn.com
*
* License: GNU GPL v3
*
* Description:
* To test vertical_hole library
*
* Resources:
*   - https://github.com/gregsaun/vertical_hole
*
******************************************************************************/


use <../src/vertical_hole.scad>


// Test model sizes
model_length = 105;
model_height = 17;
model_depth = 5;
hole_num = 12;
holes_spacing = 2;
hole_depth = model_depth*3;
layer_height = 0.2;


// With hole clearance
difference () {
    translate([0,0,0]) cube([model_length,model_depth,model_height]);
    for(i=[1 : 1 : hole_num]) {
        r = i/2; // holes from 1 to 10 diam, inc 1
        echo("r = ", r);
        translate([i*i-i*(r-holes_spacing),0,r+1]) vertical_hole( hole_depth, r, layer_height );
    }

    // Material saving
    translate([0,-1,4]) rotate([0,-12,0]) cube([model_length,model_depth+2,model_height]);
}

// Without hole clearance
delta_y = 20;
difference () {
    translate([0,delta_y,0]) color("cyan") cube([model_length,model_depth,model_height]);
    for(i=[1 : 1 : hole_num]) {
        r = i/2; // holes from 1 to 10 diam, inc 1
        echo("r = ", r);
        translate([i*i-i*(r-holes_spacing),20,r+1]) rotate([-90,0,0]) cylinder( hole_depth, r=r, $fn=40, center = true );
    }

    // Material saving
    translate([0,delta_y-1,4]) rotate([0,-12,0]) cube([model_length,model_depth+2,model_height]);
}