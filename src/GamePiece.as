package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	
	import net.jacob_stewart.Button;
	import net.jacob_stewart.EntityPlus;
	import net.jacob_stewart.JS;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class GamePiece extends Button 
	{
		private var gm:GameManager;
		private var gp:GamePiece;
		
		private var pieceOutline:Image = new Image(Images.GAMEPIECEOUTLINE);
		private var borderGlow:Image = new Image(Images.GAMEPIECEBORDERGLOW);
		
		public var spriteMap:Spritemap = new Spritemap(Images.SQUAREFLIPSPRITEMAP, Game.GP_SIZE, Game.GP_SIZE, onFinishAnim);
		private const GREEN_NORMAL:String = "GreenNormal";
		private const GREEN_HOVER:String = "GreenHover";
		private const GREEN_DOWN:String = "GreenDown";
		private const FLIPTO_RED:String = "FlipToRed";
		private const RED_NORMAL:String = "RedNormal";
		private const RED_HOVER:String = "RedHover";
		private const RED_DOWN:String = "RedDown";
		private const FLIPTO_GREEN:String = "FlipToGreen";
		
		// Will hold the string name of the spritemap animation states 
		// depending on what color the piece currently is.
		private var animNormal:String;
		private var animHover:String;
		private var animDown:String;
		
		
		// 'true' indicates square is on green side,
		// 'false' indicates square is on red side.
		public var isGreen:Boolean = true;
		
		// pieceRef's value is set by gm.
		// Each of the 25 game pieces holds a unique number between 0 and 24
		// so that it can referenced by index in the gm.gamePieces array
		public var pieceNum:uint;
		
		public var flipPieceNums:Array = new Array;
		private var collidableStates:Array = new Array;
		
		
		
		public function GamePiece(x:Number=0, y:Number=0, graphic:Graphic=null, layer:int= -2) 
		{
			super(x, y, graphic, layer);
		}
		
		override public function init():void 
		{
			super.init();
			
			
			setHitbox(spriteMap.scaledWidth, spriteMap.scaledHeight);
			
			spriteMap.add(GREEN_NORMAL, [0], 1, false);
			spriteMap.add(GREEN_HOVER, [1], 1, false);
			spriteMap.add(GREEN_DOWN, [2], 1, false);
			spriteMap.add(FLIPTO_RED, [4, 5, 6, 7, 15, 14, 13, 12, 8], Game.FRAMERATE_FLIP, false);
			spriteMap.add(RED_NORMAL, [8], 1, false);
			spriteMap.add(RED_HOVER, [9], 1, false);
			spriteMap.add(RED_DOWN, [10], 1, false);
			spriteMap.add(FLIPTO_GREEN, [12, 13, 14, 15, 7, 6, 5, 4, 0], Game.FRAMERATE_FLIP, false);
			
			pieceOutline.visible = false;
			pieceOutline.x = (spriteMap.scaledWidth * .5) - (pieceOutline.scaledWidth * .5);
			pieceOutline.y = (spriteMap.scaledHeight * .5) - (pieceOutline.scaledHeight * .5);
			
			borderGlow.visible = false;
			borderGlow.x = (spriteMap.scaledWidth * .5) - (borderGlow.scaledWidth * .5);
			borderGlow.y = (spriteMap.scaledHeight * .5) - (borderGlow.scaledHeight * .5);
		}
		
		override public function added():void
		{
			super.added();
			
			
			if (!graphic)
			{
				addGraphic(pieceOutline);
				addGraphic(borderGlow);
				addGraphic(spriteMap);
			}
			
			
			gm = world.getInstance(Game.NAME_GameManager) as GameManager;
			if (collidableStates.indexOf(gm.IDLE) == -1) collidableStates.push(gm.IDLE);
			
			
			if (FP.rand(2) == 0) isGreen = true;
			else isGreen = false;
			
			
			if (isGreen) btnStatesToGreen();
			else btnStatesToRed();
		}
		// -------------------------------------------------------------
		
		
		override public function update():void 
		{
			updateCollidable();
			
			
			super.update();
			
			
			updateDisplayCross();
			updateOutline();
			updateGlow();
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
		
		private function updateDisplayCross():void
		{
			if (collidable && !collideMouse())
			{
				if (gm.mp.button is GamePiece)
				{
					gp = gm.mp.button as GamePiece;
					if (gp.flipPieceNums.indexOf(pieceNum) != -1)
					{
						state = HOVER;
						changeState();
					}
				}
			}
		}
		
		private function updateOutline():void
		{
			pieceOutline.visible = false;
			pieceOutline.alpha = .6;
			
			if (state == HOVER && gm.state == gm.IDLE)
			{
				pieceOutline.visible = true;
				if (collideMouse()) pieceOutline.alpha = 1;
			}
		}
		
		private function updateGlow():void
		{
			borderGlow.visible = false;
			if (collideMouse() && gm.state == gm.IDLE) borderGlow.visible = true;
		}
		// -------------------------------------------------------------
		
		
		override public function changeState():void 
		{
			if (gm.state == gm.IDLE)
			{
				switch(state)
				{
					case NORMAL:
						spriteMap.play(animNormal);
						break;
					case HOVER:
						spriteMap.play(animHover);
						break;
					case DOWN:
						spriteMap.play(animDown);
						break;
				}
			}
		}
		
		override public function click():void 
		{
			super.click();
			
			
			gm.pieceNumClicked = pieceNum;
			gm.flip();
		}
		// -------------------------------------------------------------
		
		
		private function btnStatesToGreen():void
		{
			animNormal = GREEN_NORMAL;
			animHover = GREEN_HOVER;
			animDown = GREEN_DOWN;
		}
		
		private function btnStatesToRed():void
		{
			animNormal = RED_NORMAL;
			animHover = RED_HOVER;
			animDown = RED_DOWN;
		}
		// -------------------------------------------------------------
		
		
		public function flip():void
		{
			if (isGreen) toRed();
			else toGreen();
		}
		
		public function toGreen():void
		{
			spriteMap.play(FLIPTO_GREEN);
			isGreen = true;
			btnStatesToGreen();
		}
		
		public function toRed():void
		{
			spriteMap.play(FLIPTO_RED);
			isGreen = false;
			btnStatesToRed();
		}
		
		private function onFinishAnim():void
		{
			if (spriteMap.currentAnim == FLIPTO_GREEN || spriteMap.currentAnim == FLIPTO_RED)
			{
				if (gm.pieceNumClicked == pieceNum) gm.checkForWin();
			}
		}
		// -------------------------------------------------------------
		
		
		public function _GamePiece(x:Number, y:Number, pieceNum:uint, flipPieceNums:Array):GamePiece
		{
			this.x = x, this.y = y;
			this.pieceNum = pieceNum;
			this.flipPieceNums = flipPieceNums;
			
			name = toString() + (pieceNum + 1).toString();
			
			return this;
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}