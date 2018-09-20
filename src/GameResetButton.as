package  
{
	import net.flashpunk.Graphic;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	
	import net.jacob_stewart.Button;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class GameResetButton extends Button 
	{
		private var gm:GameManager;
		private var guiBtnSfx:Sfx = new Sfx(Sounds.MENUBTNCLICK);
		private var collidableStates:Array = new Array;
		
		
		
		public function GameResetButton(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int=0) 
		{
			super(x, y, graphic, layer);
		}
		
		override public function init():void 
		{
			super.init();
			
			
			normal = new Image(Images.GAMERESETNORMAL);
			hover = new Image(Images.GAMERESETHOVER);
			down = normal;
			
			setHitbox(106, 33);
		}
		
		override public function added():void 
		{
			super.added();
			
			
			gm = world.getInstance(Game.NAME_GameManager) as GameManager;
			collidableStates.push(gm.IDLE, gm.WIN);
		}
		// -------------------------------------------------------------
		
		
		override public function update():void 
		{
			updateCollidable();
			
			
			super.update();
		}
		
		private function updateCollidable():void
		{
			collidable = false;
			if (collidableStates.indexOf(gm.state) != -1) collidable = true;
		}
		
		override public function interactivity():void 
		{
			if (collidable) super.interactivity();
		}
		// -------------------------------------------------------------
		
		
		override public function click():void 
		{
			super.click();
			
			
			guiBtnSfx.play();
			gm.runTitleMenu();
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}