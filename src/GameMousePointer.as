package  
{
	import net.flashpunk.Sfx;
	
	import net.jacob_stewart.MousePointer;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class GameMousePointer extends MousePointer 
	{
		private var isOverButton:Boolean = false;
		private var enterButtonSfx:Sfx = new Sfx(Sounds.MENUBTNCLICK);
		
		
		
		public function GameMousePointer() 
		{
			super();
		}
		
		override public function update():void 
		{
			super.update();
			
			
			updateEnterButtonSfx();
		}
		// -------------------------------------------------------------
		
		
		private function updateEnterButtonSfx():void
		{
			if (button)
			{
				if (!isOverButton)
				{
					isOverButton = true;
					enterButtonSfx.play();
				}
			}
			else isOverButton = false;
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}