package net.jacob_stewart 
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class WorldPlus extends World 
	{
		public var children:Array = new Array;
		
		
		
		public function WorldPlus() 
		{
			super();
			init();
		}
		
		public function init():void
		{
			
		}
		// ------------------------------------------------------------------------------
		
		
		public function wpAdd(e:Entity):Entity
		{
			if (children.indexOf(e) == -1) children.push(e);
			return add(e);
		}
		
		public function wpAddList(list:Array):void
		{
			for (var i:uint = 0; i < list.length; i++)
			{
				if (list[i] is Array) wpAddList(list[i]);
				else if (list[i] is Entity) wpAdd(list[i]);
			}
		}
		// ------------------------------------------------------------------------------
		
		
		
		// ------------------------------------------------------------------------------
		
	}

}