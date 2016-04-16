# Introduction #

This is ported from [this](http://tech.groups.yahoo.com/group/as3isolib/message/386) group's thread.
It's basically a small workaround on how to retrieve the isometric coordinates once you get a click on one of your IsoSprites.

Future developments may render this tutorial irrelevant, so you might want to check documentation to see if there's a shorter and more efficient way of doing this. If this doesn't work for you and the date of this tutorial is older than the build you have, it may mean that this tutorial needs changing. Please use the comments section below.

You should be familiar with the 4th (building IsoSprites) and 7th (getting clicks on the grid) tutorials in the wiki page to understand this one.

# Details #

  1. When drawing your symbols to fit your isometric world, make sure they have their origin (0,0) in the correct place (read the IsoSprite tutorial). A good way to test yourself is to pick points on your symbol after creating it and check if these points in isometrics have x, y and z greater than 0, assuming your 2D (0,0) is your 3D (0,0,0)
  1. When creating a sprite to assign to your IsoSprite, create it as a MovieClip, and assign its owner to the IsoSprite object itself. Example:
```
var mc:MovieClip = new chair(); // chair is a movieClip
var iso:IsoSprite = new IsoSprite();
mc.owner = iso;
iso.sprites = [mc];
```
  1. After assigning a click handler for your IsoView (see tutorials), check your event.target.parent. If it is a MovieClip, then the click originated on one of your MovieClips. If not, then it's a click somewhere empty on the view.
```
if(evt.target.parent is MovieClip) ...
```
  1. Since the click event comes with localX and localY relative to the MovieClip, you need to add the MovieClip's X and Y to get the point relative to the view:
```
pt = new Pt(evt.target.parent.x + evt.localX, evt.target.parent.y + evt.localY);
```
  1. Next, convert the 2D click to 3D coordinates:
```
IsoMath.screenToIso(pt);
```
  1. The problem with pt now is that if your MovieClip has a height, then pt now equals the point on the floor behind the MovieClip that you clicked. So simply "move" that point towards the camera until it is within the boundaries of the IsoSprite. "Moving" the point towards the camera is done by incrementing its X and Y (the equivalent of drawing a 2D line straight down the screen). This is why we made sure our MovieClip is built isometrically correct in step 0 and why we save the isometric object as the MovieClip owner (since we need it now):
```
var iso:IsoSprite = evt.target.owner;
while(pt.x < iso.x || pt.y < iso.y)
{
pt.x++;
pt.y++;
}
```
  1. That's it. Now pt is the "floor" of the isometric object in its clicked position. Note that the only flaw here is that you can't know your Z value of the click.
  1. EDIT: If your MovieClip is made out of many other MovieClips, and you get your localX and Y relative to some internal MovieClip, instead of calculating offsets, I did this little trick when the click event happened (m\_view is the IsoView, and it's assuming your view takes up the entire stage area). After that you perform the loop in step 6:
```
var p:Point = new Point(evt.localX, evt.localY);
p = evt.target.localToGlobal(p);				
var pt:Pt = m_view.localToIso(p);
```