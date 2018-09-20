package net.jacob_stewart.entity_text 
{
	import net.flashpunk.graphics.Text;
	
	import net.jacob_stewart.EntityPlus;
	import net.jacob_stewart.JS;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class EntityText extends EntityPlus 
	{
		public var textStr:String;
		public var size:uint;
		
		public var text:Text;
		public var offset:uint;
		
		
		
		public function EntityText(textStr:String = "text", font:String = "default", size:uint = 16, x:Number=0, y:Number=0, alignX:Number = 0, alignY:Number = 0, offset:uint = 0, color:uint = JS.WHITE, alpha:Number = 1, layer:int = 0) 
		{
			text = new Text(textStr, 0, 0, { font: font, size: size, color: color, alpha: alpha } );
			
			
			super();
			
			
			this.x = x, this.y = y;
			
			if (x == -1) centerHor(text.textWidth, alignX);
			if (y == -1) centerVer(text.textHeight, alignY);
			
			this.offset = offset;
			this.x += this.offset, this.y += this.offset;
			
			
			this.layer = layer;
		}
		
		override public function init():void 
		{
			super.init();
			
			
			graphic = text;
		}
		// -------------------------------------------------------------------------
		
		
		public function alignLeft(alignX:Number):void
		{
			x = alignX;
		}
		
		public function alignCenter(alignX:Number):void
		{
			centerHor(text.textWidth, alignX);
		}
		
		public function alignRight(alignX:Number):void
		{
			x = alignX - text.textWidth;
		}
		// -------------------------------------------------------------------------
		
		
		public function changeText(newText:String, alignCenter:Boolean = false, alignRight:Boolean = false):void
		{
			var centerX:Number = x + (text.textWidth * .5);
			var rightX:Number = x + text.textWidth;
			
			text.text = newText;
			if (alignCenter) this.alignCenter(centerX);
			else if (alignRight) this.alignRight(rightX);
		}
		// -------------------------------------------------------------------------
		
		
		public function changeAlpha(alpha:Number):void
		{
			text.alpha = alpha;
		}
		
	}

}