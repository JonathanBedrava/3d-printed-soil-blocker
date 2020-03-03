# 3d-printed-soil-blocker
A parametric design for a 3D printed soil blocker, using [OpenScad](http://www.openscad.org/), a free CAD modeller. Some scripting experience desired if you want to customize, but most parameters can be adjusted easily. 

## Modules
For best results, render and export each of the modules below independently, commenting out the calls to the modules you aren't working with. You may wish to position them in an easily sliceable way (e.g., rotating the press() 180 degrees on X). The four modules for building the main blocker components:
* outerBlocks()
    * The outer-most part of the soild block mold, including the finger grip above.
* press()
    * The inner part of the blocker press.
* spacer()
    * A small cylinder that rests between the press() and the underside of the top part of the outerBlocks()
* handle()
    * The handle of the press

## Bill of Materials for Assembly
With some changes to various parameters, a variety of parts can be used. However, here are what I went with for the defaults. 
* 1 x [1/4"-20 x 4" 18-8 Stainless Steel Threaded Rod](https://www.amazon.com/gp/product/B083CTZW5X/ref=ppx_yo_dt_b_asin_title_o03_s00?ie=UTF8&psc=1)
    * You might be able to find these at a hardware store.
* 2 x [1/4" Self-Locking Flange Nut](https://www.amazon.com/gp/product/B0093ODYJS/ref=ppx_yo_dt_b_asin_title_o03_s00?ie=UTF8&psc=1)
    * Square nuts make more sense in retrospect, but these work well enough.
* 1 x spring (optional?)
    * I haven't quite found the right spring yet. Stay tuned.

## Printing param
* .2mm layer height.
    * You could probably go up in layer height if you are using a larger nozzle, but strive for maximum layer adhesion
* 15-20% cubic infill is probably sufficient. YMMV
* PLA has about the right amount of stiffness, but I have not evaluated other materials.

## Assembly
1. Place the nuts in the slots in the press() and the handle(). Align the holes.
2. Slide the press() into outerBlocks().
    * The slot for the nut ought to run perpendicular to the finger grip of the outerBlocks().
    * Take care to align these well. This may be a tight fit depending on the accuracy of your printer, so some finagling may be required. The moldMargin parameter can be increased to give a bit more breathing room.
3. Slide the threaded rod through the top of the finger grip, through the spacer(), then into the hole at the top of the press. Screw the threaded rod into the nut.
    * If the nut spins freely, lock its rotation with a screwdriver or similar.
4. Affix the handle to the top of the nut.
    * If the nut spins freely, lock its rotation with a screwdriver or similar.
5. If the press's fit is tight once assembly is complete, push and pull the handle repeatedly until it slides freely. Applying some cooking oil might help.