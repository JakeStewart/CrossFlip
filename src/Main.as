package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	[SWF(width = "800", height = "600")]
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class Main extends Engine
	{
		
		public function Main():void 
		{
			super(800, 600);
		}
		
		override public function init():void
		{
			super.init();
			
			FP.world = new GameWorld;
			FP.console.enable();
			FP.console.visible = false;
		}
		// -------------------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------------------
		
	}
	
}