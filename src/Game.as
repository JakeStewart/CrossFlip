package  
{
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class Game 
	{
		public static var testWin:Boolean = false;
		
		public static const NAME_GameManager:String = "GameManager";
		public static const FRAMERATE_FLIP:Number = 20;
		
		public static const COLUMN_COUNT:uint = 5;
		public static const ROW_COUNT:uint = 5;
		public static const GP_COUNT:uint = COLUMN_COUNT * ROW_COUNT;
		
		public static const GP_SIZE:uint = 32;
		public static const GP_WIDTH:uint = GP_SIZE;
		public static const GP_HEIGHT:uint = GP_SIZE;
		public static const GP_PAD:uint = 10;
		
		/**
		 * Game Piece Size Pad.
		 * Game.GP_SIZE + Game.GP_PAD
		 */
		public static const GPSP:uint = GP_SIZE + GP_PAD;
		
		public static const LAYER_GUI:int = -3;
		
		// The difficulty value represents how many pieces 
		// from the piece being flipped will flip
		public static const DIFFICULTY_EASY:uint = 1;
		public static const DIFFICULTY_MED:uint = 2;
		public static const DIFFICULTY_HARD:uint = 3;
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------
		
	}

}