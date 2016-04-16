# tutorial #

The IsoSprite class is the base class used to display non-drawing API created visual assets in a 3D isometric space.

![http://img384.imageshack.us/img384/3932/picture1nb2.png](http://img384.imageshack.us/img384/3932/picture1nb2.png)

In this example I have created a tree from two images.  The first image is the tree trunk, the other is the leaves of the tree.  In order to provide realistic isometric depth sorting, each visual asset is presented into its own 3D isometric bounding box.  This allows objects without elevation (object.z = 0) to be able to appear under the leaves of the tree if need be.  Obviously this isn't necessary for visual assets that have similar proportions.  Assume for the moment a tall, slender tree whose leaves do not extend too far beyond the extent of the trunk.  In this case a developer could composite both the trunk and leaves visual assets into one IsoSprite.

**code**
```
package 
{
	import as3isolib.display.IsoSprite;
	import as3isolib.display.primitive.IsoBox;
	import as3isolib.display.scene.IsoGrid;
	import as3isolib.display.scene.IsoScene;
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class IsoApplication extends Sprite
	{
		private var scene:IsoScene;
		private var assets:Object;
		
		private var loader:Loader
		
		private function loadAssets ():void
		{
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.INIT, loader_initHandler);
			loader.load(new URLRequest("assets/swf/assets.swf"));
			
		}
		
		private function loader_initHandler (evt:Event):void
		{
			buildScene();
		}
		
		private function buildScene ():void
		{
			scene = new IsoScene();
			scene.hostContainer = this; //it is recommended to use an IsoView
			
			var treeTrunkClass:Class = loader.contentLoaderInfo.applicationDomain.getDefinition("TreeTrunk") as Class;
			var treeLeavesClass:Class = loader.contentLoaderInfo.applicationDomain.getDefinition("TreeLeaves") as Class;
			
			var grid:IsoGrid = new IsoGrid();
			grid.showOrigin = false;
			scene.addChild(grid);
			
			var s0:IsoSprite = new IsoSprite();
			s0.setSize(25, 25, 65);
			s0.moveTo(50, 50, 0);
			s0.sprites = [treeTrunkClass];
			scene.addChild(s0);
			
			var s1:IsoSprite = new IsoSprite();
			s1.setSize(125, 125, 100);
			s1.moveTo(0, 0, 75);
			s1.sprites = [treeLeavesClass];
			scene.addChild(s1);
			
			scene.render();
		}
		
		public function IsoApplication ()
		{
			loadAssets();
		}
	}
}

```

In order to render visual assets correctly so that appear in the expected 3D isometric coordinate space, a bit of asset preparation is necessary.  The example assets were prepared in the Flash IDE and then exported for AS3 along with the SWF.

The tree trunk asset was assigned the following properties - width:25, length:25, height:65.  Make note of the origin point of the MovieClip within the Flash IDE.

![http://img55.imageshack.us/img55/4310/picture2hz1.png](http://img55.imageshack.us/img55/4310/picture2hz1.png)

The tree leaves asset was assigned the following properties - width:125, length:125, height:100.  Again making note of the origin point of the MovieClip within the Flash IDE.

![http://img55.imageshack.us/img55/8367/picture3iw1.png](http://img55.imageshack.us/img55/8367/picture3iw1.png)

In order to eliminate the need to use offset calculations, all IIsoDisplayObjects present their origin in the same fashion.  If you were to imagine any 3D volume in isometric space, assuming that any visual assets does not extend into any of the negative octants of space, the origin would reside at the top corner (in screen orientation) of the bottom face.