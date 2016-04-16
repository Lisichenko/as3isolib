# tutorial #

The IsoView class is a basic viewport-type class that extends flash.display.Sprite.  It serves as the connecting object for the display list and the isometric objects' data.  It has very basic functionality associated with camera-based commands such as panning, zooming and focusing on a point or object.  These methods are enforced via the IIsoView interface.

In addition to this functionality, the IsoView class also does things such as clips content from its boundaries and provides a means of adding background and foreground content.  In the future (real soon I hope) a means to remove content from the display list if they reside outside of the boundaries of the current view will be implemented.

Here is a basic example of an IsoView:

![http://img530.imageshack.us/img530/3566/picture1hz6.png](http://img530.imageshack.us/img530/3566/picture1hz6.png)

**code**
```
package
{	
	import as3isolib.display.IsoView;
	import as3isolib.display.primitive.IsoBox;
	import as3isolib.display.scene.IsoGrid;
	import as3isolib.display.scene.IsoScene;
	
	import flash.display.Sprite;
	
	public class IsoApplication extends Sprite
	{
		public function IsoApplication ()
		{			
			var box:IsoBox = new IsoBox();
			box.moveTo(15, 15, 0);
			
			var grid:IsoGrid = new IsoGrid();
			
			var scene:IsoScene = new IsoScene();
			scene.addChild(box);
			scene.addChild(grid);
			scene.render();
			
			var view:IsoView = new IsoView();
			view.setSize(150, 100);
			view.addScene(scene);
			
			addChild(view);
		}
	}
}
```

And for some reason you want to not clip the content:

![http://img260.imageshack.us/img260/3532/picture2sk0.png](http://img260.imageshack.us/img260/3532/picture2sk0.png)

```
view.clipContent = false;
```