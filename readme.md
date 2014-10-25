Parallax 3d Effect
=============
<img src="http://www.josellausas.com/wp-content/uploads/2014/09/parallax_3d_effect-1024x576.jpg"></img>
## About
A simple parallax 3d effect implementation with Corona SDK. This runs on Android and iOS.
Gravity data from the accelerometer is then used to offset the angle of view. Illusion of depth is created by slightly moving the layers in the right direction, the magnitude of the movement depending on the distance to the eye.

To manage the scene I created 10 different layers. I placed the smaller shark in the front layer (layer 0), the larger shark in the middle (layer 5) and the back image to the background (layer 10).


Layer 0 has 0% displacement according to gravity, and Layer 10 has 100% displacement.
## More Info
####[Jose's GameDev Blog](http://www.josellausas.com/2014/09/parallax-3d-effect-corona)




