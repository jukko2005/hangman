package de.crowdpark.hangman.mvc.controller.startScreen {
	import de.crowdpark.hangman.consts.AppConsts;
	import de.crowdpark.hangman.events.AppEvent;
	import de.crowdpark.hangman.mvc.model.GameModel;
	import de.crowdpark.hangman.mvc.model.LetterVO;
	import de.crowdpark.hangman.mvc.view.gameView.GameScreen;
	
	import org.robotlegs.mvcs.Command;
	
	public class OnPlayClickedCommand extends Command {
		
		[Inject]
		public var _game:GameModel;
		
		
		override public function execute():void {
			setGuessWord();
			
			var gameScreen:GameScreen = new GameScreen( _game.guessWordChars.length );
			gameScreen.name           = AppConsts.DISPLAY_NAME_GAME_VIEW;
			
			contextView.addChild( gameScreen );
			
			removeStartView();
		}
		
		/**
		 * Get a random word of predefined word-list and create a VO for each character
		 * Reset game values.
		 */
		private function setGuessWord():void {
			var wordList:Array   = _game.words;
			var wordIndex:int    = Math.floor( Math.random() * wordList.length );
			var guessWord:String = wordList[wordIndex];
			var len:int          = guessWord.length;
			var letters:Array    = [];
			
			for ( var i:int=0 ; i<len ; i++ ){
				letters.push( new LetterVO( i, guessWord.charAt(i) ));
			}
			
			_game.guessWordChars = letters;
			_game.attempts       = 0;
			_game.success        = false;
		}
		
		/**
		 * Remove start screen
		 */
		private function removeStartView():void {
			var event:AppEvent  = new AppEvent( AppConsts.REMOVE_VIEW );
			event.viewComponent = AppConsts.DISPLAY_NAME_START_VIEW;
			
			dispatch( event );
		}
	}
}