package net.jacob_stewart 
{
	import flash.ui.MouseCursor;
	import net.flashpunk.utils.Input;
	
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class MousePointer extends EntityPlus 
	{
		public var button:Button;
		
		
		
		public function MousePointer() 
		{
			super();
		}
		
		override public function init():void 
		{
			super.init();
			
			
			type = JS.TYPE_MousePointer;
			name = type;
		}
		
		override public function update():void 
		{
			super.update();
			
			
			Input.mouseCursor = MouseCursor.AUTO;
			button = collide(JS.TYPE_Button, world.mouseX, world.mouseY) as Button;
			if (qualificationCheck()) Input.mouseCursor = MouseCursor.BUTTON;
		}
		
		override public function epActive(active:Boolean, includeThis:Boolean = true, exclude:Array = null):void 
		{
			super.epActive(active, includeThis, exclude);
			
			
			if (!active && includeThis) Input.mouseCursor = MouseCursor.AUTO;
		}
		
		
		public function qualificationCheck():Boolean
		{
			if (button) return true;
			return false;
		}
		
	}

}