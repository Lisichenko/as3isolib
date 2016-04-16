The as3isolib is developed to make use of the common invalidation/validation process.  Property changes and events flag an object for invalidation to be validated later.  This process conserves rendering time as consecutive property changes do not necessarily trigger validation of the object.  As3isolib's render phase is essentially its validation process.

By default, IsoViews are rendered separately from their scenes in order to reduce the cost of stacked rendering phases.

IsoView.render()
  * validatePosition() - _adjusts the internal display list for the view's contents based on a new position_
  * viewRenderers - _iterate through the viewRenderers array and execute IViewRenderer.renderView()_
  * scenes - _if rendering recursively, iterate through the scenes array and execute IIsoScene.render()_

IsoScene.render() - this consists of three phases: preRenderLogic, renderLogic, postRenderLogic
  * preRenderLogic() - _as the name implies, this performs any logic during each render phase before processing child objects.  At this point, the scene dispatches an IsoEvent of the type IsoEvent.RENDER.  Developers can listen for this event with the expectations that they can perform some additional logic before rendering of child objects takes place._
  * renderLogic() - _this is the core rendering phase that deals with child objects, layoutRenderers and styleRenderers._
    * children - _if recursively rendering the scene, iterate through each child and call child.render()_
    * layoutRenderer - _arrange child objects based on 3D isometric position_
    * styleRenderers - _iterate through the styleRenderers array and execute ISceneRenderer.renderScene()_
  * postRenderLogic - _performs any last minute cleanup before dispatching IsoEvent.RENDER\_COMPLETE.  Also calls the deprecated method sceneRendered._