# tutorial #

In order to create a flexible API, a factory implementation was utilized to allow for custom rendering processes intended by the developer.  As3isolib comes with some default renderers which can be found in the as3isolib.display.renderers package.  Of note are the IViewRenderer classes.  IViewRenderer classes are designed to assist in rendering a view with relation to the view's scene (in most cases).  The following examples will illustrate how to implement IViewRenderers with an IIsoView.

This first example is of a default IIsoView w/ no IViewRenderers.  The content is specifically displayed beyond the boundaries of the IIsoView to show the inefficient use of objects in the display list that would normally not be visible.

**[example 1](http://megaswf.com/view/d7b6fd4732da45c033a81dc01a369bd0.html)**

**code**
```
view = new IsoView();
view.clipContent = false;
```

This second example shows the use of the DefaultViewRenderer and how it assists the view's scene in removing child objects from the display list that do not reside in the target viewing area.

**[example 2](http://megaswf.com/view/8eeeb70bc6b6fa477d84c0609e27573e.html)**

**code**
```
view = new IsoView();
view.clipContent = true;
view.viewRenderers = [new ClassFactory(DefaultViewRenderer)];
```

The last example illustrates the use of the DefaultViewRenderer from the previous example combined with the use of the ViewBoundsRenderer which indicates the bounding rectangle of the scene's children regardless if they appear in the display list.

**[example 3](http://megaswf.com/view/e5cb4f1841a28a3164bc4117e2b38752.html)**

**code**
```
view = new IsoView();
view.clipContent = true;
view.viewRenderers = [new ClassFactory(DefaultViewRenderer), new ClassFactory(ViewBoundsRenderer)];
```