package de.crowdpark.hangman.consts {
	
	public class AppConsts{
		
		private static const PACKAGE : String = "de.crowdpark.hangman.consts::";
		
		public static const APP_WIDTH  : int = 310;
		public static const APP_HEIGHT : int = 450;
		public static const APP_CONFIG_PATH : String = "config/config.xml";
		
		public static const APP_ASSETS_LOADED : String       = PACKAGE + "APP_ASSETS_LOADED";
		public static const CONFIG_LOADED : String           = PACKAGE + "CONFIG_LOADED";
		public static const DISPLAY_NAME_START_VIEW : String = "view_start";
		public static const DISPLAY_NAME_GAME_VIEW : String  = "view_game";
		public static const DISPLAY_NAME_END_VIEW : String   = "view_end";
		public static const MAX_ATTEMPTS : int               = 7;
		public static const SHOW_START_SCREEN : String       = PACKAGE + "SHOW_START_SCREEN";
		public static const PREPARE_REMOVEMENT : String      = PACKAGE + "PREPARE_REMOVEMENT";
		public static const REMOVE_VIEW : String             = PACKAGE + "REMOVE_DISPLAY";
		public static const SELECTED_KEY : String            = PACKAGE + "SELECTED_KEY";
		public static const START_GAME_CLICKED : String      = PACKAGE + "START_GAME_CLICKED";
		public static const UPDATE_GUESSED_LETTERS : String  = PACKAGE + "UPDATE_GUESSED_LETTERS";
		public static const UPDATE_GIBBIT : String           = PACKAGE + "UPDATE_GIBBIT";
		public static const SHOW_RESULT_SCREEN : String      = PACKAGE + "SHOW_RESULT_SCREEN";
	}
}