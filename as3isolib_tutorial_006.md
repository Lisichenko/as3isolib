# tutorial #

Using ISceneRenderers allows a user to add custom styles and layout arrangements to an IsoScene.  Currently there are two types of ISceneRenderers, those that handle layout of a scene's child objects and those that help style the overall scene and/or children (such as applying shadows and other effects).  The use of an ISceneRenderer allows developers to create their own custom layouts and styling beyond the provided classes.

The means for implementing ISceneRenderers on a given scene utilizes a [factory method](http://en.wikipedia.org/wiki/Factory_method_pattern) (which was borrowed from the Flex SDK's IFactory and ClassFactory).

The given example shows a DefaultShadowRenderer being set as a style renderer for the scene.

![http://img410.imageshack.us/img410/8555/picture2gf7.png](http://img410.imageshack.us/img410/8555/picture2gf7.png)

**code**
```
package
{	
	import as3isolib.core.ClassFactory;
	import as3isolib.core.IFactory;
	import as3isolib.display.IsoView;
	import as3isolib.display.primitive.IsoBox;
	import as3isolib.display.renderers.DefaultShadowRenderer;
	import as3isolib.display.scene.IsoGrid;
	import as3isolib.display.scene.IsoScene;
	
	import flash.display.Sprite;
	
	public class IsoApplication extends Sprite
	{
		public function IsoApplication ()
		{			
			var scene:IsoScene = new IsoScene();
			scene.hostContainer = this;
			
			var g:IsoGrid = new IsoGrid();
			g.showOrigin = false;
			scene.addChild(g);
			
			var box:IsoBox = new IsoBox();
			box.setSize(25, 25, 25);
			box.moveBy(20, 20, 15); //feature request added
			scene.addChild(box);
			
			var factory:IFactory = new ClassFactory(DefaultShadowRenderer);
			factory.properties = {shadowColor:0x000000, shadowAlpha:0.15, drawAll:false};
			scene.styleRenderers = [factory];
			
			scene.render();
			
			var view:IsoView = new IsoView();
			view.y = 50;
			view.setSize(150, 100);
			view.scene = scene; //look in the future to be able to add more scenes
			
			addChild(view);
		}
	}
}
```

![http://img296.imageshack.us/img296/334/picture3fn5.png](http://img296.imageshack.us/img296/334/picture3fn5.png)

If for some chance you want a darker shadow of a different color you would simply do the following:

**code**
```
var factory:IFactory = new ClassFactory(DefaultShadowRenderer);
factory.properties = {shadowColor:0xFF0000, shadowAlpha:1.0, drawAll:false};
scene.styleRenderers = [factory];
```

IsoScenes can only have one ISceneRenderer set as the layoutRenderer however they can have any number of styleRenderers.  The more styleRenderers a scene has the more CPU intensive each render pass becomes.  StyleRenderers are applied in the order they were added.