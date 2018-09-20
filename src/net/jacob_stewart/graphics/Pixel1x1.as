package net.jacob_stewart.graphics 
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	import net.jacob_stewart.EntityPlus;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class Pixel1x1 extends EntityPlus 
	{
		public var image:Image = Image.createRect(1, 1);
		public var scaleX:Number;
		public var scaleY:Number;
		public var color:uint;
		public var alpha:Number;
		
		
		
		public function Pixel1x1(x:Number=0, y:Number=0, layer:int=0, scaleX:Number=1, scaleY:Number=1, color:uint=0xFFFFFF, alpha:Number=1) 
		{
			this.scaleX = scaleX;
			this.scaleY = scaleY;
			this.color = color;
			this.alpha = alpha;
			
			
			super(x, y, null, layer);
		}
		
		override public function init():void 
		{
			super.init();
			
			
			image.color = color;
			image.alpha = alpha;
			if (scaleX != 1) image.scaleX = scaleX;
			if (scaleY != 1) image.scaleY = scaleY;
			graphic = image;
		}
		// --------------------------------------------------------------------------------
		
		
		public function setColor(color:uint):void
		{
			this.color = color;
			image.color = color;
		}
		
		public function setAlpha(alpha:uint):void
		{
			this.alpha = alpha;
			image.alpha = alpha;
		}
		// --------------------------------------------------------------------------------
		
		
		
		// --------------------------------------------------------------------------------
		
	}

}