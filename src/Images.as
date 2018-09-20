package  
{
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Jacob Stewart
	 */
	public class Images 
	{
		[Embed(source = "../assets/images/Background_01_Dark.png")] public static const BACKGROUNDDARK:Class;
		public static var backgroundDark:Image = new Image(BACKGROUNDDARK);
		
		[Embed(source = "../assets/images/Background_01_Bright.png")] public static const BACKGROUNDBRIGHT:Class;
		public static var backgroundBright:Image = new Image(BACKGROUNDBRIGHT);
		
		[Embed(source = "../assets/images/Game_title_01.png")] public static const GAMETITLE:Class;
		public static var gameTitle:Image = new Image(GAMETITLE);
		
		
		
		
		[Embed(source = "../assets/images/Easy.png")] public static const EASYNORMAL:Class;
		public static var easyNormal:Image = new Image(EASYNORMAL);
		[Embed(source = "../assets/images/Easy_Over.png")] public static const EASYHOVER:Class;
		public static var easyHover:Image = new Image(EASYHOVER);
		
		
		[Embed(source = "../assets/images/Medium.png")] public static const MEDIUMNORMAL:Class;
		public static var mediumNormal:Image = new Image(MEDIUMNORMAL);
		[Embed(source = "../assets/images/Medium_Over.png")] public static const MEDIUMHOVER:Class;
		public static var mediumHover:Image = new Image(MEDIUMHOVER);
		
		
		[Embed(source = "../assets/images/Hard.png")] public static const HARDNORMAL:Class;
		public static var hardNormal:Image = new Image(HARDNORMAL);
		[Embed(source = "../assets/images/Hard_Over.png")] public static const HARDHOVER:Class;
		public static var hardHover:Image = new Image(HARDHOVER);
		
		
		
		
		[Embed(source = "../assets/images/Game_reset_Normal.png")] public static const GAMERESETNORMAL:Class;
		[Embed(source = "../assets/images/Game_reset_Hover.png")] public static const GAMERESETHOVER:Class;
		
		[Embed(source = "../assets/images/You_win_01.png")] public static const YOUWIN:Class;
		public static var youWin:Image = new Image(YOUWIN);
		
		[Embed(source = "../assets/images/Square_flip_Spritesheet1.png")] public static const SQUAREFLIPSPRITEMAP:Class;
		
		[Embed(source = "../assets/images/Game_piece_Border_glow_01.png")] public static const GAMEPIECEBORDERGLOW:Class;
		[Embed(source = "../assets/images/Game_piece_Outline_01.png")] public static const GAMEPIECEOUTLINE:Class;
		
		
		
		public function Images() 
		{
			
		}
		
	}

}