package  
{
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	
	import net.jacob_stewart.Button;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class DifficultyButton extends Button 
	{
		private var gm:GameManager;
		
		// difficulty would be 1 for easy, 2 for medium, 3 for hard.
		// The value is stored in gameMgr.difficultyVal which means how
		// many game pieces will be flipped beyond the piece clicked.
		private var difficulty:uint;
		
		private var gameStartSfx:Sfx = new Sfx(Sounds.GAMESTART);
		
		
		
		public function DifficultyButton(normal:Image, hover:Image, down:Image, difficulty:uint, x:Number=0, y:Number=0, layer:int=0) 
		{
			this.normal = normal;
			this.hover = hover;
			this.down = down;
			this.difficulty = difficulty;
			
			
			super(x, y, graphic, layer);
		}
		
		override public function init():void 
		{
			super.init();
			
			
			setHitbox(192, 64);
		}
		
		override public function added():void 
		{
			super.added();
			
			
			gm = world.getInstance(Game.NAME_GameManager) as GameManager;
		}
		
		override public function click():void 
		{
			super.click();
			
			gameStartSfx.play();
			gm.difficulty = difficulty;
			gm.startGame();
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}