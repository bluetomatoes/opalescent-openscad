module createHexagonRotated(sidelength, height, twist) {
	linear_extrude(height = height, center = true, convesidelengthity = 0, slices = 8, twist = twist){
		polygon([[-2*sidelength,0],[-sidelength, sidelength*sqrt(3)],[sidelength, sidelength*sqrt(3)],[2*sidelength,0],[sidelength, -sidelength*sqrt(3)], [-sidelength, -sidelength*sqrt(3)]], [[0,1,2,3,4,5]]);
	}
}
module createHexVase(height,sidelength,basewidth, innerwidth, twist){
	difference() {
		createHexagonRotated(sidelength,height, twist);
		translate([0,0 , basewidth ])createHexagonRotated(sidelength-innerwidth, height-basewidth);
	}
}

//usage: createHexVase(
//	vase height, 
//	outer hexagon side length, 
//	base width (how deep the base goes into the vase area, cannot exceed vase height),
//	wall thickness,
//	twist (in degrees) )
//all in mm
createHexVase(70, 20, 2, 3, 80);