/*

as3isolib - An open-source ActionScript 3.0 Isometric Library developed to assist 
in creating isometrically projected content (such as games and graphics) 
targeted for the Flash player platform

http://code.google.com/p/as3isolib/

Copyright (c) 2006 J.W.Opitz, All Rights Reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*/
package as3isolib.display.primitive
{
	import as3isolib.core.IIsoDisplayObject;
	
	/**
	 * The IIsoPrimitive interface defines methods for any IIsoDisplayObject class that is utilizing Flash's drawing API.
	 */
	public interface IIsoPrimitive extends IIsoDisplayObject
	{
		//////////////////////////////////////////////////////////////////
		//	STYLES
		//////////////////////////////////////////////////////////////////
		
		/**
		 * @private
		 */
		function get faceAlphas ():Array;
		
		/**
		 * An array of alpha values corresponding to the various faces (where applicable).
		 * For a given IsoBox the values would be assigned in order to: top, right, front, left, back, bottom
		 */
		function set faceAlphas (value:Array):void;
		
		/**
		 * @private
		 */
		function get faceColors ():Array;
		
		/**
		 * An array of color values corresponding to the various faces (where applicable).
		 * For a given IsoBox the values would be assigned in order to: top, right, front, left, back, bottom
		 */
		function set faceColors (value:Array):void;
		
		/**
		 * @private
		 */
		function get lineAlphas ():Array;
		
		/**
		 * An array of alphas values corresponding to the various faces' outlines (where applicable).
		 * For a given IsoBox the values would be assigned in order to: top, right, front, left, back, bottom
		 */
		function set lineAlphas (value:Array):void;
		
		/**
		 * @private
		 */
		function get lineColors ():Array;
		
		/**
		 * An array of color values corresponding to the various faces' outlines (where applicable).
		 * For a given IsoBox the values would be assigned in order to: top, right, front, left, back, bottom
		 */
		function set lineColors (value:Array):void;
		
		/**
		 * @private
		 */
		function get lineThicknesses ():Array;
		
		/**
		 * An array of thickness values corresponding to the various faces' outlines (where applicable).
		 * For a given IsoBox the values would be assigned in order to: top, right, front, left, back, bottom
		 */
		function set lineThicknesses (value:Array):void;
		
		/**
		 * @private
		 */
		function get styleType ():String;
		
		/**
		 * For IIsoDisplayObjects that make use of Flash's drawing API, it is necessary to develop render logic corresponding to the
		 * varios render style types.
		 * 
		 * @see as3isolib.enum.RenderStyleType
		 */
		function set styleType (value:String):void;
		
		//////////////////////////////////////////////////////////////////
		//	INVALIDATION
		//////////////////////////////////////////////////////////////////
		
		/**
		 * Invalidates the geometry of the  IIsoDisplayObject.
		 */
		function invalidateGeometry ():void;		
	}
}