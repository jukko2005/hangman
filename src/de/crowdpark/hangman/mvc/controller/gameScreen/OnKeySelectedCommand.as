package de.crowdpark.hangman.mvc.controller.gameScreen {
	
	import de.crowdpark.hangman.consts.AppConsts;
	import de.crowdpark.hangman.events.AppEvent;
	import de.crowdpark.hangman.mvc.model.GameModel;
	import de.crowdpark.hangman.mvc.model.LetterVO;
	import de.crowdpark.hangman.services.SoundService;
	
	import org.robotlegs.mvcs.Command;
	
	public class OnKeySelectedCommand extends Command {
		
		
		[Inject]
		public var _event:AppEvent;
		
		[Inject]
		public var _game:GameModel;
		
		[Inject]
		public var _sound:SoundService;
		
		override public function execute():void {
			var hittedLetters:Array = getHittedLetters();
			if ( hittedLetters.length ) {
				handleSuccess( hittedLetters );
			} else {
				_game.attempts += 1;
				
				handleMistake();
			}
			
			_sound.playSound("click");
			
			checkEnd();
		}
		
		/**
		 * Get matched letters from guessed word
		 */
		private function getHittedLetters():Array {
			var selectedKey:String  = _event.key;
			var guessWordChars:Array = _game.guessWordChars;
			var len:int = guessWordChars.length;
			var hitted:Array = [];
			var vo:LetterVO;
			
			for ( var i:int=0 ; i<len ; i++ ){
				vo = guessWordChars[i];
				
				if ( vo.char == selectedKey ) {
					vo.found = true;
					
					hitted.push( vo.copy() );
				}
			}
			
			return hitted;
		}
		
		/**
		 * Update view and show guessed/correct letters
		 */
		private function handleSuccess( letters:Array ):void {
			var ev:AppEvent = new AppEvent( AppConsts.UPDATE_GUESSED_LETTERS );
			ev.guessedLetters = letters;
			
			dispatch( ev );
		}
		
		private function handleMistake():void {
			dispatch( new AppEvent( AppConsts.UPDATE_GIBBIT ));
		}
		
		/**
		 * Check if game is over regarding max_attempts or a complete guessed word
		 */
		private function checkEnd():void {
			if ( _game.attempts == AppConsts.MAX_ATTEMPTS ){ //failed
				_game.lose += 1;
				_sound.playSound("lose");
				dispatch( new AppEvent( AppConsts.PREPARE_REMOVEMENT ));
			} else if ( wordCompleted() ) { //success
				_game.won += 1;
				_game.success = true;
				_sound.playSound("win");
				dispatch( new AppEvent( AppConsts.PREPARE_REMOVEMENT ));
			}
		}
		
		/**
		 * Check if all letters where guessed
		 */
		private function wordCompleted():Boolean {
			var chars:Array = _game.guessWordChars;
			
			for each ( var vo:LetterVO in chars ) {
				if ( !vo.found ){
					return false;
				}
			}
			
			return true;
			
		}
	}
}