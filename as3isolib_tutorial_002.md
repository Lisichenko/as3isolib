# tutorial #

IsoScene is a container-type node that allows multiple IIsoDisplayObject children to be added.  If the layout is enabled, the IsoScene will depth sort each child according to their 3D isometric coordinates, regardless of the order they were added.

![http://img395.imageshack.us/img395/6660/picture2sn2.png](http://img395.imageshack.us/img395/6660/picture2sn2.png)

**code**
```
package 
{
	import as3isolib.display.primitive.IsoBox;
	import as3isolib.display.scene.IsoScene;
	
	import flash.display.Sprite;
	
	public class IsoApplication extends Sprite
	{
		public function IsoApplication ()
		{
			var box0:IsoBox = new IsoBox();
			box0.setSize(25, 25, 25);
			box0.moveTo(200, 0, 0);
			
			var box1:IsoBox = new IsoBox();
			box1.width = 10;
			box1.length = 25;
			box1.height = 50;
			box1.moveTo(230, -15, 20);
			
			var box2:IsoBox = new IsoBox();
			box2.setSize(10, 50, 5);
			box2.moveTo(200, 30, 10);
			
			var scene:IsoScene = new IsoScene();
			scene.hostContainer = this;
			scene.addChild(box2);
			scene.addChild(box1);
			scene.addChild(box0);
			scene.render();
		}
	}
}
```

IsoScene also has the ability to disregard the isometric layout which will depth sort each child according to the order they were added.  This feature is available for developers wishing to have a custom layout scheme.

![http://img72.imageshack.us/img72/4433/picture3gf7.png](http://img72.imageshack.us/img72/4433/picture3gf7.png)

**code**
```
scene.layoutEnabled = false;
```