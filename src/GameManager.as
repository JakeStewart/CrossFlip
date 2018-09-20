package  
{
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class GameManager extends Entity 
	{
		public const TITLE:uint = 0;
		public const IDLE:uint = 1;
		public const FLIPPING:uint = 2;
		public const WIN:uint = 3;
		public var state:uint = TITLE;
		
		public var mp:GameMousePointer;
		private var ui:GUI_Manager;
		
		public var gamePieces:Array = new Array(25);
		public var pieceNumClicked:int = -1;
		
		
		
		private var startPoint:Point = new Point(300, 200);
		
		private var row1:Array = [0, 1, 2, 3, 4];
		private var row2:Array = [5, 6, 7, 8, 9];
		private var row3:Array = [10, 11, 12, 13, 14];
		private var row4:Array = [15, 16, 17, 18, 19];
		private var row5:Array = [20, 21, 22, 23, 24];
		private var rows:Array = [row1, row2, row3, row4, row5];
		
		// difficulty value is set when a DifficultyButton is clicked.
		// difficulty is equal to the difficulty value; 1, 2 or 4.
		// Its value is how many game pieces above, below, left & right
		// of the game piece clicked that will be flipped.
		public var difficulty:uint = 1;
		private var flipPieceNums:Array = new Array;
		
		
		
		public function GameManager(mp:GameMousePointer, ui:GUI_Manager) 
		{
			this.mp = mp;
			this.ui = ui;
			super();
			init();
		}
		
		private function init():void 
		{
			name = Game.NAME_GameManager;
		}
		
		override public function added():void 
		{
			super.added();
			runTitleMenu();
		}
		
		override public function update():void 
		{
			// debug();
		}
		// -------------------------------------------------------------
		
		
		public function runTitleMenu():void
		{
			state = TITLE;
			pieceNumClicked = -1;
			for each (var gp:GamePiece in gamePieces) world.recycle(gp);
			ui.runTitleMenu();
		}
		
		public function startGame():void
		{
			state = IDLE;
			ui.startGame();
			addGamePieces();
		}
		
		private function addGamePieces():void
		{
			var pieceNum:uint;
			for (var row:uint = 0; row < Game.ROW_COUNT; row++)
			{
				for (var column:uint = 0; column < Game.COLUMN_COUNT; column++)
				{
					gamePieces[pieceNum] = (GamePiece(world.create(GamePiece))._GamePiece(startPoint.x + (Game.GPSP * column), startPoint.y + (Game.GPSP * row), pieceNum, getflipPieceNums(pieceNum)));
					pieceNum++;
				}
			}
			
			if (Game.testWin) testWin();
		}
		
		private function getflipPieceNums(pieceNum:uint):Array
		{
			var flipPieceNums:Array = new Array;
			var rowLead:uint;
			var pieceNumInCheck:uint;
			
			flipPieceNums.push(pieceNum);
			
			for (var row:uint = 0; row < Game.ROW_COUNT; row++)
			{
				for (var column:uint = 0; column < Game.COLUMN_COUNT; column++)
				{
					if (rows[row][column] == pieceNum)
					{
						rowLead = rows[row][0];
						column = Game.COLUMN_COUNT;
						row = Game.ROW_COUNT;
					}
				}
			}
			
			for (var i:uint = 1; i < difficulty + 1; i++)
			{
				// Vertical
				if (isOnBoardVertical(i, -1)) flipPieceNums.push(pieceNumInCheck); // Up
				if (isOnBoardVertical(i, 1)) flipPieceNums.push(pieceNumInCheck); // Down
				
				// Horizontal
				if (isOnBoardHorizontal(i, -1)) flipPieceNums.push(pieceNumInCheck); // Left
				if (isOnBoardHorizontal(i, 1)) flipPieceNums.push(pieceNumInCheck); // Right
			}
			
			
			return flipPieceNums;
			
			
			
			function isOnBoardVertical(rowDiff:uint, posOrNeg:int):Boolean
			{
				pieceNumInCheck = pieceNum + ((Game.COLUMN_COUNT * rowDiff) * posOrNeg);
				if (pieceNumInCheck > -1 && pieceNumInCheck < Game.GP_COUNT) return true;
				return false;
			}
			
			function isOnBoardHorizontal(columnDiff:uint, posOrNeg:int):Boolean
			{
				pieceNumInCheck = pieceNum + (columnDiff * posOrNeg);
				if (pieceNumInCheck > rowLead - 1 && pieceNumInCheck < rowLead + Game.COLUMN_COUNT) return true;
				return false;
			}
		}
		// -------------------------------------------------------------
		
		
		public function flip():void
		{
			state = FLIPPING;
			
			var gp:GamePiece = gamePieces[pieceNumClicked];
			flipPieceNums = gp.flipPieceNums;
			for (var i:uint = 0; i < flipPieceNums.length; i++)
			{
				gp = gamePieces[flipPieceNums[i]];
				gp.flip();
			}
		}
		// -------------------------------------------------------------
		
		
		public function checkForWin():void
		{
			var gp:GamePiece;
			var gpClicked:GamePiece = gamePieces[pieceNumClicked];
			
			for (var i:uint = 0; i < gamePieces.length; i++)
			{
				gp = gamePieces[i];
				if (gp.isGreen != gpClicked.isGreen)
				{
					state = IDLE;
					i = gamePieces.length;
				}
				
				if (i == gamePieces.length - 1)
				{
					state = WIN;
					ui.win();
				}
			}
		}
		// -------------------------------------------------------------
		
		
		public function testWin():void
		{
			state = FLIPPING;
			pieceNumClicked = 0;
			for each (var gp:GamePiece in gamePieces) gp.toGreen();
		}
		
		
		/*
		public function testWin():void
		{
			state = FLIPPING;
			var gp:GamePiece;
			var gpCenterNum:uint = uint((Game.GP_COUNT - 1) * .5);
			for each (gp in gamePieces) gp.toGreen();
			gp = gamePieces[gpCenterNum];
			// gp.toRed();
			for (var i:uint = 0; i < difficulty; i++)
			{
				
			}
		}
		*/
		
		
		// -------------------------------------------------------------
		
		
		private function debug():void
		{
			debug1();
		}
		
		private function debug1():void
		{
			if (Input.pressed(Key.T))
			{
				// for each (var gp:GamePiece in gamePieces) trace("gp.state: ", gp.state);
				// for each (var gp:GamePiece in gamePieces) gp.changeState();
				for each (var gp:GamePiece in gamePieces) trace(gp.name);
				trace("-------------------------------");
			}
		}
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}