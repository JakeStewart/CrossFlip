package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	
	import net.jacob_stewart.EntityPlus;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class GUI_Manager extends EntityPlus 
	{
		private var backgroundDark:EntityPlus = new EntityPlus(0, 0, Images.backgroundDark);
		private var backgroundBright:EntityPlus = new EntityPlus(0, 0, Images.backgroundBright);
		private var gameTitle:EntityPlus = new EntityPlus(0, 0, Images.gameTitle, Game.LAYER_GUI);
		
		private var easyBtn:DifficultyButton = new DifficultyButton(Images.easyNormal, Images.easyHover, Images.easyNormal, Game.DIFFICULTY_EASY, FP.halfWidth - (Images.easyNormal.width * .5), 30, Game.LAYER_GUI);
		private var mediumBtn:DifficultyButton = new DifficultyButton(Images.mediumNormal, Images.mediumHover, Images.mediumNormal, Game.DIFFICULTY_MED, FP.halfWidth - (Images.mediumNormal.width * .5), FP.halfHeight - (Images.mediumNormal.height * .5), Game.LAYER_GUI);
		private var hardBtn:DifficultyButton = new DifficultyButton(Images.hardNormal, Images.hardHover, Images.hardNormal, Game.DIFFICULTY_HARD, FP.halfWidth - (Images.hardNormal.width * .5), 500, Game.LAYER_GUI);
		
		private var gameResetBtn:GameResetButton = new GameResetButton(600, 520, null, Game.LAYER_GUI);
		
		private var youWin:EntityPlus = new EntityPlus(FP.halfWidth - (Images.youWin.width * .5), FP.halfHeight - (Images.youWin.height * .5), Images.youWin, Game.LAYER_GUI);
		
		private var gameWinSfx:Sfx = new Sfx(Sounds.GAMEWIN);
		
		
		
		public function GUI_Manager() 
		{
			super();
		}
		
		override public function added():void 
		{
			super.added();
			
			
			world.add(backgroundDark);
			world.add(backgroundBright);
			world.add(gameTitle);
		}
		// -------------------------------------------------------------
		
		
		public function runTitleMenu():void
		{
			world.remove(youWin);
			world.remove(gameResetBtn);
			
			world.add(easyBtn);
			world.add(mediumBtn);
			world.add(hardBtn);
			
			FP.tween(Images.backgroundBright, { alpha: 0 }, .2);
		}
		
		public function startGame():void
		{
			world.add(gameResetBtn);
			
			world.remove(easyBtn);
			world.remove(mediumBtn);
			world.remove(hardBtn);
			
			FP.tween(Images.backgroundBright, { alpha: 1 }, .4);
		}
		
		public function win():void
		{
			world.add(youWin);
			gameWinSfx.play();
		}
		
		public function testWin():void
		{
			world.remove(youWin);
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}