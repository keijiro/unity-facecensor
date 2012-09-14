unity-facecensor
================

Pixelation image effect example.

![Lerpz](http://cloud.github.com/downloads/keijiro/unity-facecensor/lerpz.png)

Usage
-----

1. Add *Pixelation Image Effect* to the main camera.
1. Add *mask objects* to specify the area of pixelation.
1. Set *Scale* property to adjust the level of pixelation.

What is Mask Object?
--------------------

This effect uses alpha level on the framebuffer to blend the pixelated image (i.e. destination alpha blending).
So you should place some objects which cover the area of pixelation.
You can use AlphaFill shader to set the alpha level and leave the RGB levels.
