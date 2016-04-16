#labels Featured,Phase-Implementation,tutorial

# TUTORIAL BEING UPDATED TO REFLECT BETA API #

---

# tutorial #

The as3isolib IIsoPrimitive primitive types have various styling attributes available for customization.

Those attributes are:
  * render style - determines if the primitive is rendered as a shaded, solid or wireframe model.
  * face line alphas - polygon edge alphas.
  * face line colors - polygon edge colors
  * face line thicknesses - polygon edge thicknesses
  * face alphas - polygon fill alphas
  * face colors - polygon fill colors

By default all IIsoPrimitives are rendered as RenderStyleType.SHADED meaning that individual faces are shaded to different colors to add to the perception of depth.  RenderStyleType.SOLID will draw all faces with color #FFFFFF.  RenderStyleType.WIREFRAME renders all faces as transparent.  Rendered as transparent allows mouse events to still be triggered.

In this example the face alphas and face colors have changed from their defaults.  As you can see, since each face has a set line thickness, the bolder face edges on the back faces are now present.

![http://img135.imageshack.us/img135/1391/picture1mu3.png](http://img135.imageshack.us/img135/1391/picture1mu3.png)

**code**
```
package 
{
	import as3isolib.display.primitive.IsoBox;
	import as3isolib.display.scene.IsoScene;
	import as3isolib.enum.RenderStyleType;
	
	import flash.display.Sprite;
	
	public class IsoApplication extends Sprite
	{
		public function IsoApplication ()
		{
			var box:IsoBox = new IsoBox();
			box.styleType = RenderStyleType.SHADED;
			box.faceColors = [0xff0000, 0x00ff00, 0x0000ff, 0xff0000, 0x00ff00, 0x0000ff]
			box.faceAlphas = [.5, .5, .5, .5, .5, .5];
			box.setSize(25, 30, 40);
			box.moveTo(200, 0, 0);
			
			var scene:IsoScene = new IsoScene();
			scene.hostContainer = this;
			scene.addChild(box);
			scene.render();
		}
	}
}
```

While changing the face colors while being rendered as a RenderStyleType.SHADED has visible effects, doing so while being rendered as a RenderStyleType.SOLID does not:

![http://img509.imageshack.us/img509/8924/picture2rv3.png](http://img509.imageshack.us/img509/8924/picture2rv3.png)

**code**
```
box.styleType = RenderStyleType.SOLID;
box.faceColors = [0xff0000, 0x00ff00, 0x0000ff, 0xff0000, 0x00ff00, 0x0000ff]
box.faceAlphas = [.5, .5, .5, .5, .5, .5];
```

Being rendered as RenderStyleType.WIREFRAME ignores both the faceColors and faceAlphas setting altogether. Notice that the shadow is still being rendered.  Shadow rendering is handled by the scene, not the IIsoPrimitive.

![http://img118.imageshack.us/img118/7986/picture3gk6.png](http://img118.imageshack.us/img118/7986/picture3gk6.png)

**code**
```
box.styleType = RenderStyleType.WIREFRAME;
box.faceColors = [0xff0000, 0x00ff00, 0x0000ff, 0xff0000, 0x00ff00, 0x0000ff]
box.faceAlphas = [.5, .5, .5, .5, .5, .5];
```