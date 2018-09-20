package net.jacob_stewart 
{
	import net.flashpunk.FP;
	import net.flashpunk.Tween;
	import net.flashpunk.Tweener;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.ColorTween;
	import net.flashpunk.utils.Ease;
	
	import net.jacob_stewart.tweens.MultiVarAnchorTween;
	
	/**
	 * Static class used to access global properties and functions.
	 * @author Jacob Stewart
	 */
	public class JS 
	{
		/* DEVELOPER */
		/**
		 * If true, allows user to do developer things when game is running
		 */
		public static var developer:Boolean = true;
		
		
		
		/* TYPE NAMES */
		public static const TYPE_Button:String = "Button";
		public static const TYPE_MousePointer:String = "MousePointer";
		public static const TYPE_GameManager:String = "GameManager";
		
		
		
		/* GAME */
		/**
		 * The pixel width of the game.
		 */
		public static const WIDTH:uint = FP.width;
		
		/**
		 * The pixel height of the game.
		 */
		public static const HEIGHT:uint = FP.height;
		
		/**
		 * The background screen color for the game
		 */
		public static const SCREENCOLOR:uint = 0x757575;
		
		
		
		/* COLOR */
		/**
		 * Color: Black - 0x000000
		 */
		public static const BLACK:uint = 0x000000;
		
		/**
		 * Color: White - 0xFFFFFF
		 */
		public static const WHITE:uint = 0xFFFFFF;
		
		/**
		 * Color: Red - 0xFF0000
		 */
		public static const RED:uint = 0xFF0000;
		
		/**
		 * Color: Blue - 0x0000FF
		 */
		public static const BLUE1:uint = 0x0000FF;
		// public static const BLUE:uint = FP.getColorRGB(0, 0, 255);
		
		
		
		/* TEXT */
		/**
		 * Default size for flashpunk.graphics.Text
		 */
		public static const TEXTSIZE_DEFAULT:uint = 16;
		
		
		
		/* TWEEN */
		/**
		 * An array of all the Ease functions
		 */
		public static var eases:Array = 
		[
			Ease.backIn, Ease.backInOut, Ease.backOut, 
			Ease.bounceIn, Ease.bounceInOut, Ease.bounceOut, 
			Ease.circIn, Ease.circInOut, Ease.circOut, 
			Ease.cubeIn, Ease.cubeInOut, Ease.cubeOut, 
			Ease.expoIn, Ease.expoInOut, Ease.expoOut, 
			Ease.quadIn, Ease.quadInOut, Ease.quadOut, 
			Ease.quartIn, Ease.quartInOut, Ease.quartOut, 
			Ease.quintIn, Ease.quintInOut, Ease.quintOut, 
			Ease.sineIn, Ease.sineInOut, Ease.sineOut
		];
		
		/**
		 * An array of all the Ease.easeIn functions
		 */
		public static var easesIn:Array = [Ease.backIn, Ease.bounceIn, Ease.circIn, Ease.cubeIn, Ease.expoIn, Ease.quadIn, Ease.quartIn, Ease.quintIn, Ease.sineIn];
		// public static var easesIn:Vector.<Function> = new Vector.<Function>([Ease.backIn, Ease.bounceIn, Ease.circIn, Ease.cubeIn, Ease.expoIn, Ease.quadIn, Ease.quartIn, Ease.quintIn, Ease.sineIn]);
		
		/**
		 * An array of all the Ease.easeOut functions
		 */
		public static var easesOut:Array = [Ease.backOut, Ease.bounceOut, Ease.circOut, Ease.cubeOut, Ease.expoOut, Ease.quadOut, Ease.quartOut, Ease.quintOut, Ease.sineOut];
		
		/**
		 * An array of all the Ease.easeInOut functions
		 */
		public static var easesInOut:Array = [Ease.backInOut, Ease.bounceInOut, Ease.circInOut, Ease.cubeInOut, Ease.expoInOut, Ease.quadInOut, Ease.quartInOut, Ease.quintInOut, Ease.sineInOut];
		// ------------------------------------------------------------------------------
		
		
		/* MATH */
		/**
		 * Rounds an integer to an even number if it's odd
		 * @param	num			The integer to round
		 * @param	roundUp		If the algorithm should round up
		 */
		public static function roundEven(num:int, roundUp:Boolean = true):int
		{
			if (num % 2 == 1)
			{
				if (roundUp) return num++;
				else return num--;
			}
			
			
			return num;
		}
		
		
		
		/* ARRAY */
		/**
		 * Takes a multidimensional array and returns a new one dimensional
		 * array containing every element of every array in the passed multidimensional array
		 * @param	list	The multidimensional array to pass
		 * @return	The flattened array
		 */
		public static function getArrayAsFlat(list:Array):Array
		{
			var flattened:Array = new Array;
			
			for (var i:uint = 0; i < list.length; i++)
			{
				if (list[i] is Array) flattened = flattened.concat(getArrayAsFlat(list[i]));
				else flattened.push(list[i]);
			}
			
			
			return flattened;
		}
		
		/**
		 * Removes an Object from a one or multidimensional array
		 * @param	list			The array containing the Object
		 * @param	o				The Object to remove from the array
		 */
		public static function splice(list:Array, o:*):void
		{
			if (list.indexOf(o) != -1) list.splice(list.indexOf(o), 1);
			else
			{
				for (var i:uint = 0; i < list.length; i++)
				{
					if (list[i] is Array) splice(list[i], o);
				}
			}
		}
		
		
		
		/* TEXT */
		/**
		 * Returns Text.textWidth value for any given size of Text
		 * @param	size	The size of the text
		 * @param	string	Optional string the function will use for the Text instance it creates
		 * @return	The width of the text
		 */
		public static function getTextWidth(size:uint, string:String = "Text"):uint
		{
			var text:Text = new Text(string, 0, 0, { size: size } );
			
			
			return text.textWidth;
		}
		
		/**
		 * Returns Text.textHeight value for any given size of Text
		 * @param	size	The size of the text
		 * @param	string	Optional string the function will use for the Text instance it creates
		 * @return	The height of the text
		 */
		public static function getTextHeight(size:uint, string:String = "Text"):uint
		{
			var text:Text = new Text(string, 0, 0, { size: size } );
			
			
			return text.textHeight;
		}
		
		
		
		/* OBJECT */
		
		/*
		public static function centerOnPoint(o:Object, width:uint, height:uint, pX:Number, pY:Number):void
		{
			if (!o.hasOwnProperty("width")) throw new Error("The Object does not have the property\"" + "width" + "\", or it is not accessible.");
			if (!o.hasOwnProperty("height")) throw new Error("The Object does not have the property\"" + "height" + "\", or it is not accessible.");
			var width:* = o["width"] as Number;
			if (width == null) throw new Error("The property \"" + "width" + "\" is not numeric.");
			var height:* = o["height"] as Number;
			if (height == null) throw new Error("The property \"" + "height" + "\" is not numeric.");
		}
		*/
		
		public static function centerOnPoint(o:Object, width:uint, height:uint, pX:Number, pY:Number):void
		{
			if (!o.hasOwnProperty("x")) throw new Error("The Object does not have the property\"" + "x" + "\", or it is not accessible.");
			if (!o.hasOwnProperty("y")) throw new Error("The Object does not have the property\"" + "y" + "\", or it is not accessible.");
			if (o["x"] == null) throw new Error("The property \"" + "x" + "\" is not numeric.");
			if (o["y"] == null) throw new Error("The property \"" + "y" + "\" is not numeric.");
			o["x"] = pX - (width * .5);
			o["y"] = pY - (height * .5);
		}
		
		
		
		/* TWEEN */
		/**
		 * Tweens multiple numeric public properties of an Object simultaneously, and anchors that tween to another object
		 * and returns the MultiVarAnchorTween
		 * @param	object			The object containing the properties
		 * @param	anchor			The anchor containing the properties to follow
		 * @param	values			An object containing key/value pairs of properties and target values
		 * @param	duration		Duration of the tween
		 * @param	ease			Optional easer function
		 * @param	onComplete		Optional completion callback
		 */
		public static function tweenMultiAnchor(object:Object, anchor:Object, values:Object, duration:Number, ease:Function = null, onComplete:Function = null, delay:Number = 0, type:uint = 0):MultiVarAnchorTween
		{
			var tweener:Tweener = FP.tweener;
			var tween:MultiVarAnchorTween = new MultiVarAnchorTween(onComplete, type);
			
			tween.tween(object, anchor, values, duration, ease, delay);
			return tweener.addTween(tween, true) as MultiVarAnchorTween;
		}
		
		/**
		 * Tweens a color's red, green, and blue properties
		 * independently. Can also tween an alpha value.
		 * @param	duration		Duration of the tween.
		 * @param	fromColor		Start color.
		 * @param	toColor			End color.
		 * @param	fromAlpha		Start alpha
		 * @param	toAlpha			End alpha.
		 * @param	ease			Optional easer function.
		 * @param	onComplete		Optional completion callback
		 */
		public static function tweenColor(duration:Number, fromColor:uint, toColor:uint, fromAlpha:Number = 1, toAlpha:Number = 1, ease:Function = null, onComplete:Function = null, type:uint = Tween.ONESHOT, start:Boolean = true):ColorTween
		{
			var tweener:Tweener = FP.tweener;
			var tween:ColorTween = new ColorTween(onComplete, type);
			
			tween.tween(duration, fromColor, toColor, fromAlpha, toAlpha, ease);
			return tweener.addTween(tween, true) as ColorTween;
		}
		
		/**
		 * Takes an array of Tween objects and calls Tween.cancel() on 
		 * each one, then clears the array to 0
		 * @param	tweens	The array of Tween objects to pass
		 */
		public static function cancelTweens(tweens:Array):void
		{
			for each (var tween:Tween in tweens) tween.cancel();
			tweens.length = 0;
		}
		
		/**
		 * Pulses the alpha property of an Image object
		 * @param	image	The image to pulse
		 */
		/*
		public static function alphaPulse(image:Image, alphaHigh:Number = 1, alphaLow:Number = 0, duration:Number = 1, ease:Ease = null, delay:Number = 0):void
		{
			var to:Number = alphaLow;
			if (image.alpha < alphaHigh) to = alphaHigh;
			FP.tween(image, { alpha: to }, duration, { complete: alphaPulse(image, alphaHigh, alphaLow, duration, ease, delay), ease: ease, delay: delay } );
		}
		*/
		
		
		
		/* MOUSE */
		/**
		 * Returns true if the mouse pointer is within the bounds of the game
		 * @param	world	The current FP.world
		 */
		public static function mouseIsOnScreen(world:World):Boolean
		{
			if ((world.mouseX >= 0 && world.mouseX <= FP.width)
			&& (world.mouseY >= 0 && world.mouseY <= FP.height)) return true;
			
			
			return false;
		}
		
		
		
		/* COLLISION */
		/**
		 * Checks if two specified circles overlap eachother.
		 * This is not a hitbox check.
		 * @param	c1X			Virtual center x position to place the Circle.
		 * @param	c1Y			Virtual center y position to place the Circle.
		 * @param	c2X			Center x position of the other circle.
		 * @param	c2Y			Center y position of the other circle.
		 * @param	c1Radius	Radius of the circle.
		 * @param	c2Radius	Radius of the other circle.
		 * @return	If they overlap.
		 */
		public static function collideCircles(c1X:Number, c1Y:Number, c2X:Number, c2Y:Number, c1Radius:Number, c2Radius:Number):Boolean
		{
			if (FP.distance(c1X, c1Y, c2X, c2Y) - (c1Radius + c2Radius) <= 0) return true;
			return false;
		}
		
		/**
		 * Checks if a specified circle overlaps a specified rectangle.
		 * This is not a hitbox check.
		 * @param	cX			Virtual center x position to place the Circle.
		 * @param	cY			Virtual center y position to place the Circle.
		 * @param	radius		Radius of the circle.
		 * @param	rX			X position of the rectangle.
		 * @param	rY			Y position of the rectangle.
		 * @param	rWidth		Width of the rectangle.
		 * @param	rHeight		Height of the rectangle.
		 * @return	If they overlap.
		 */
		public static function collideCircleRect(cX:Number, cY:Number, radius:Number, rX:Number, rY:Number, rWidth:Number, rHeight:Number):Boolean
		{
			if ((cX >= rX && cX <= rX + rWidth) || (cY >= rY && cY <= rY + rHeight))
			{
				// Circle becomes rectangle with a width and height of it's diameter. Check if both rectangles overlap.
				if (
					cX + radius >= rX // RIGHT edge of circle's rectangle is >= to the LEFT edge of the rectangle
					&& cY + radius >= rY // BOTTOM edge of circle's rectangle is >= to the TOP edge of the rectangle
					&& cX - radius <= rX + rWidth // LEFT edge of circle's rectangle is >= to the RIGHT edge of the rectangle
					&& cY - radius <= rY + rHeight// TOP edge of circle's rectangle is >= to the BOTTOM edge of the rectangle
				) return true;
				
				return false;
			}
			else // Determine rectangle corner point
			{
				// Top left corner
				var pX:Number = rX, pY:Number = rY;
				
				// Top right corner
				if (cX > rX + rWidth && cY < rY) pX += rWidth;
				
				// Bottom right corner
				else if (cX > rX + rWidth && cY > rY + rHeight) pX += rWidth, pY += rWidth;
				
				// Bottom left corner
				else if (cX < rX && cY > rY + rHeight) pY += rHeight;
			}
			
			
			if (FP.distance(cX, cY, pX, pY) <= radius) return true;
			return false;
		}
		// ------------------------------------------------------------------------------
		
		
		
		// ------------------------------------------------------------------------------
		
	}

}