package 
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import net.jacob_stewart.MousePointer;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class GameWorld extends World 
	{
		
		public function GameWorld() 
		{
			super();
		}
		
		override public function begin():void 
		{
			super.begin();
			add(new GameManager(add(new GameMousePointer) as GameMousePointer, add(new GUI_Manager) as GUI_Manager));
		}
		// -------------------------------------------------------------
		
		
		override public function update():void 
		{
			super.update();
			updateConsoleVisible();
		}
		
		private function updateConsoleVisible():void
		{
			if (Input.pressed(Key.F12))
			{
				if (FP.console.visible) FP.console.visible = false;
				else FP.console.visible = true;
			}
			
			if (Input.pressed(FP.console.toggleKey) && !FP.console.visible) FP.console.visible = true;
			
			
			/*
			if (Input.pressed(FP.console.toggleKey))
			{
				if (!FP.console.visible && !FP.console.paused) FP.console.visible = true;
			}
			*/
			
			
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}