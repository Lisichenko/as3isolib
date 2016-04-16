**prerequisites**

This example makes use of the Flex 2/3 SDK.

# tutorial #

Since as3isolib is purely an ActionScript 3 library it can be used in an ActionScript project, the Flash IDE or in a Flex project.  Flex is becoming the ubiquitous development platform for many development-centric as3 project and as such, you may want to incorporate as3isolib in your Flex project.

The following example show how to integrate a simple scene within a Flex application.

**code**
```
<?xml version="1.0" encoding="utf-8"?>
<mx:Application xmlns:mx="http://www.adobe.com/2006/mxml" layout="absolute" creationComplete="creationCompleteHandler()">

	<mx:Script>
		<![CDATA[
			import as3isolib.display.IsoView;
			import as3isolib.display.primitive.IsoBox;
			
			import as3isolib.display.scene.IsoScene;
			
			private function creationCompleteHandler ():void
			{
				var box:IsoBox = new IsoBox();
				
				var scene:IsoScene = new IsoScene();
				scene.hostContainer = isoHostContainer;
				scene.addChild(box);
				scene.render();
			}
			
		]]>
	</mx:Script>

	<mx:Panel title="as3isolib flex example" width="90%" height="90%" layout="absolute" verticalCenter="0" horizontalCenter="0">
		
		<mx:UIComponent id="isoHostContainer" verticalCenter="0" horizontalCenter="0" mask="{maskContainer}"/>
		<mx:Container id="maskContainer" width="100%" height="100%" backgroundColor="red"/>
		
	</mx:Panel>
	
</mx:Application>
```

If you wanted to make use of a more advanced integration using an IIsoView you could simply use the following code:

**code**
```
var box:IsoBox = new IsoBox();

var scene:IsoScene = new IsoScene();
scene.addChild(box);
scene.render();

var view:IsoView = new IsoView();
view.setSize(500, 300);
view.x = -250;
view.y = -150;
view.scene = scene;

isoHostContainer.addChild(view);
```

Thanks goes to Bryan Wills who provided the code samples.