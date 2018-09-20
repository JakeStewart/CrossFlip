package net.jacob_stewart 
{
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class Button extends EntityPlus 
	{
		public const NORMAL:uint = 0;
		public const HOVER:uint = 1;
		public const DOWN:uint = 2;
		public var state:uint = NORMAL;
		
		public var clicked:Boolean = false;
		
		public var normal:Image;
		public var hover:Image;
		public var down:Image;
		
		
		
		public function Button(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int=0) 
		{
			super(x, y, graphic, layer);
		}
		
		override public function init():void 
		{
			super.init();
			
			
			type = JS.TYPE_Button;
		}
		
		override public function added():void 
		{
			super.added();
			
			
			graphic = normal;
		}
		
		override public function update():void
		{
			super.update();
			
			
			state = NORMAL;
			interactivity();
			if (Input.mouseReleased) clicked = false;
			changeState();
		}
		
		public function interactivity():void
		{
			if (collideMouse())
			{
				if (clicked) state = DOWN;
				else state = HOVER;
				
				if (Input.mousePressed) clicked = true;
				if (clicked && Input.mouseReleased) click();
			}
			else if (clicked) state = HOVER;
		}
		
		// What happens when a button is clicked
		public function click():void
		{
			
		}
		
		// Changes what's rendered on the screen when the player interacts with the button
		public function changeState():void
		{
			switch(state)
			{
				case 0:
					graphic = normal;
					break;
				case 1:
					graphic = hover;
					break;
				case 2:
					graphic = down;
					break;
			}
		}
		// -------------------------------------------------------------
		
		
		public function collideMouse():Boolean
		{
			if (collidePoint(x, y, world.mouseX, world.mouseY)) return true;
			return false;
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}