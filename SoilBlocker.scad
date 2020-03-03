outerBlockX = 42.5;
innerBlockX = 15;
outerBlockZ = 42.5;
innerBlockZ = 12;

moldMargin=.85;

wallThickness = 2.5;
fingerGripPostX = 13;
fingerGripZ = outerBlockZ*2;
fingerGripThickness = fingerGripPostX;

nutZ = 6.75;
nutFlangeX = 17;

rodRad = 6.75/2;
lipZ = 4;

fingerMargin = 12;

spacer = 18;

handleRad = 15;

$fn=55;

spacer();

//outerBlocks();
//translate([0,0,outerBlockZ])
//    press();

//translate([outerBlockX+wallThickness*1.5-moldMargin,outerBlockX+wallThickness*1.5+moldMargin/2,fingerGripZ+lipZ+nutZ+wallThickness+moldMargin*3+fingerMargin+fingerGripThickness+25])
//{
//    handle();
//}

//translate([outerBlockX+wallThickness+wallThickness/2,outerBlockX+wallThickness+wallThickness,outerBlockZ+outerBlockZ+lipZ])
//cylinder(r=6.35/2, h=101.6);

module handle()
{
    difference()
    {
        union(){
            rotate([0,90,0])
                cylinder(r=handleRad,h=outerBlockX*1.5,center=true);
            translate([-outerBlockX*1.5/2, -handleRad, -handleRad])
                cube([outerBlockX*1.5,handleRad*2,handleRad]);
        }
        translate([0,0,-handleRad])
        cylinder(r=rodRad,h=handleRad*2+1,center=true);
        translate([-nutFlangeX/2,-nutFlangeX/2,-nutZ])
        cube([nutFlangeX,outerBlockX+wallThickness*1.5+2+nutFlangeX/2+moldMargin*2,nutZ]);
    }
}

module press()
{
    innerMolds();
    lip();
    //translate([outerBlockX+wallThickness+wallThickness/2,outerBlockX+wallThickness+wallThickness,outerBlockZ+lipZ])
      //  translate([-(nutFlangeX+wallThickness)/2,-(nutFlangeX+wallThickness)/2,0])
        //cube([nutFlangeX+wallThickness,nutFlangeX+wallThickness,nutZ+wallThickness]);
}

module spacer()
{
    difference()
    {
        cylinder(r=rodRad+3,h=spacer);
        translate([0,0,-1])
        cylinder(r=rodRad,h=spacer+2);
    }
}

module lip()
{
    translate([moldMargin, moldMargin, outerBlockZ])
    {
        difference()
            {
            cube([outerBlockX*2+wallThickness*3 - moldMargin*2,outerBlockX*2+wallThickness*3 - moldMargin*2, lipZ+nutZ+wallThickness]);
            translate([outerBlockX+wallThickness*1.5-nutFlangeX/2,-1,lipZ])
                cube([nutFlangeX,outerBlockX+wallThickness*1.5+2+nutFlangeX/2+moldMargin*2,nutZ]);
            translate([outerBlockX+wallThickness*1.5-moldMargin,outerBlockX+wallThickness*1.5+moldMargin/2,2])
                cylinder(r=rodRad,h=fingerGripZ);
            }
            //translate([outerBlockX+wallThickness*1.5,outerBlockX+wallThickness*1.5,-lipZ-nutZ])
              //a  cylinder(r=rodRad,h=fingerGripZ);
    }
}

module innerMolds()
{
    translate([wallThickness,wallThickness,0])
        innerMold();
    translate([wallThickness+outerBlockX+moldMargin/2+wallThickness,wallThickness,0])
        innerMold();
    
    translate([wallThickness,wallThickness+outerBlockX+moldMargin/2+wallThickness,0])
        innerMold();

    translate([wallThickness+outerBlockX+moldMargin/2+wallThickness,wallThickness+outerBlockX+moldMargin/2+wallThickness,0])
        innerMold();
}

module innerMold()
{
    cube([outerBlockX-moldMargin,outerBlockX-moldMargin,outerBlockZ]);
    translate([(outerBlockX-moldMargin)/2-innerBlockX/2,(outerBlockX-moldMargin)/2-innerBlockX/2,-innerBlockZ])
    cube([innerBlockX,innerBlockX,innerBlockZ]);
}

module outerBlock()
{
    difference()
    {
        cube([outerBlockX+wallThickness*2,outerBlockX+wallThickness*2,outerBlockZ]);
        translate([wallThickness,wallThickness,-1])
            cube([outerBlockX,outerBlockX,outerBlockZ+2]);
    }
}

module outerBlocks()
{
    outerBlockRow();
    translate([0,outerBlockX+wallThickness])
        outerBlockRow();
    translate([-fingerGripPostX, outerBlockX+wallThickness*2-fingerGripPostX/2, 0]) {
        fingerGrip();
        }
}

module fingerGrip()
{
    barX = (outerBlockX+wallThickness)*2+fingerGripPostX*2+wallThickness;
    postZ = fingerGripZ+lipZ+nutZ+wallThickness+moldMargin*3+fingerMargin;

    cube([fingerGripPostX,fingerGripPostX,postZ]);
    translate([(outerBlockX+wallThickness)*2+fingerGripPostX+wallThickness,0,0])
        cube([fingerGripPostX,fingerGripPostX,postZ]);
    difference()
    {
        translate([0,0,postZ])
            cube([barX,fingerGripPostX,fingerGripThickness]);
        translate([barX/2,fingerGripPostX/2,fingerGripZ/2])
            cylinder(r=rodRad,h=fingerGripZ);

    }
}

module outerBlockRow()
{
    outerBlock();
    translate([outerBlockX+wallThickness,0,0])
        outerBlock();
    //translate([(outerBlockX+wallThickness)*2,0,0])
    //    outerBlock();
    //translate([(outerBlockX+wallThickness)*3,0,0])
      //  outerBlock();
}
