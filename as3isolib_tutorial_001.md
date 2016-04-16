# tutorial #
This tutorial will demonstrate how to add an isometric primitive to the display list.

![http://img524.imageshack.us/img524/2527/picture1ad1.png](http://img524.imageshack.us/img524/2527/picture1ad1.png)

**source code**
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
			var box:IsoBox = new IsoBox();
			box.setSize(25, 25, 25);
			box.moveTo(200, 0, 0);
			
			var scene:IsoScene = new IsoScene();
			scene.hostContainer = this;
			scene.addChild(box);
			scene.render();
		}
	}
}
```