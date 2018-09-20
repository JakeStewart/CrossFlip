package net.jacob_stewart 
{
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class Keys 
	{
		
		public function Keys() 
		{
			super();
		}
		// -------------------------------------------------------------------------------------
		
		
		public static function defineKeys():void
		{
			Input.define(KEY_SELECT, Key.SPACE, Key.ENTER);
			Input.define(KEY_CANCEL, Key.ESCAPE, Key.BACKSPACE);
			Input.define(KEY_ATTACK, Key.CONTROL);
			
			Input.define(KEY_DIR, Key.UP, Key.RIGHT, Key.DOWN, Key.LEFT, Key.W, Key.D, Key.S, Key.A);
			Input.define(KEY_VER, Key.UP, Key.DOWN, Key.W, Key.S);
			Input.define(KEY_HOR, Key.RIGHT, Key.LEFT, Key.D, Key.A);
			Input.define(KEY_UP, Key.UP, Key.W);
			Input.define(KEY_RIGHT, Key.RIGHT, Key.D);
			Input.define(KEY_DOWN, Key.DOWN, Key.S);
			Input.define(KEY_LEFT, Key.LEFT, Key.A);
			
			
			Input.define(NUMERIC, 
			Key.DIGIT_0, Key.DIGIT_1, Key.DIGIT_2, Key.DIGIT_3, Key.DIGIT_4, Key.DIGIT_5, Key.DIGIT_6, Key.DIGIT_7, Key.DIGIT_8, Key.DIGIT_9,
			Key.NUMPAD_0, Key.NUMPAD_1, Key.NUMPAD_2, Key.NUMPAD_3, Key.NUMPAD_4, Key.NUMPAD_5, Key.NUMPAD_6, Key.NUMPAD_7, Key.NUMPAD_8, Key.NUMPAD_9);
			
			Input.define(NUMERIC_DIGIT, 
			Key.DIGIT_0, Key.DIGIT_1, Key.DIGIT_2, Key.DIGIT_3, Key.DIGIT_4, Key.DIGIT_5, Key.DIGIT_6, Key.DIGIT_7, Key.DIGIT_8, Key.DIGIT_9);
			
			Input.define(NUMERIC_NUMPAD, 
			Key.NUMPAD_0, Key.NUMPAD_1, Key.NUMPAD_2, Key.NUMPAD_3, Key.NUMPAD_4, Key.NUMPAD_5, Key.NUMPAD_6, Key.NUMPAD_7, Key.NUMPAD_8, Key.NUMPAD_9);
		}
		
		/**
		 * A String representing keys that select things. Key.SPACE, Key.ENTER
		 */
		public static const KEY_SELECT:String = "SelectionKeys";
		
		/**
		 * A String representing keys that cancel or back out things. Key.ESCAPE, Key.BACKSPACE
		 */
		public static const KEY_CANCEL:String = "CancelKeys";
		
		/**
		 * A String representing keys that execute a player character attack. Key.CONTROL
		 */
		public static const KEY_ATTACK:String = "AttackKeys";
		
		/**
		 * A String representing the directional keys. Arrow keys and WASD keys
		 */
		public static const KEY_DIR:String = "DirectionalKeys";
		
		/**
		 * A String representing the UP, DOWN, W, and S keys
		 */
		public static const KEY_VER:String = "DirectionalKeys_Vertical";
		
		/**
		 * A String representing the RIGHT, LEFT, A, and D keys
		 */
		public static const KEY_HOR:String = "DirectionalKeys_Horizontal";
		
		/**
		 * A String representing the UP, and W keys
		 */
		public static const KEY_UP:String = "DirectionalKeys_Up";
		
		/**
		 * A String representing the RIGHT, and D keys
		 */
		public static const KEY_RIGHT:String = "DirectionalKeys_Right";
		
		/**
		 * A String representing the DOWN, and S keys
		 */
		public static const KEY_DOWN:String = "DirectionalKeys_Down";
		
		/**
		 * A String representing the LEFT, and A keys
		 */
		public static const KEY_LEFT:String = "DirectionalKeys_Left";
		
		/**
		 * A String representing the numerical keys
		 */
		public static const NUMERIC:String = "NumericalKeys";
		
		/**
		 * A String representing the numerical keys above letters
		 */
		public static const NUMERIC_DIGIT:String = "NumericalKeys_Digits";
		
		/**
		 * A String representing the numerical keys on the numpad
		 */
		public static const NUMERIC_NUMPAD:String = "NumericalKeys_Numpad";
		// -----------------------------------------------------------------------------
		
		
		
		// -----------------------------------------------------------------------------
		
		
		
		// -------------------------------------------------------------------------------------
		
	}

}