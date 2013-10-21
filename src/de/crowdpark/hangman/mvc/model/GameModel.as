package de.crowdpark.hangman.mvc.model {
	
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * Class GameModel
	 * Stores main game data
	 */
	public class GameModel extends Actor {
		
		private var _won:int;
		private var _lose:int;
		private var _words:Array = [];
		private var _guessWordChars:Array;
		private var _attempts:int;
		private var _success:Boolean;
		
		public function set words( value:Array ):void {
			_words = value;
		}
		
		public function get words():Array {
			return _words;
		}
		
		public function set guessWordChars( value:Array ):void {
			_guessWordChars = value;
		}
		
		public function get guessWordChars():Array {
			return _guessWordChars;
		}
		
		public function get attempts():int {
			return _attempts;
		}
		
		public function set attempts( value:int ):void {
			_attempts = value;
		}
		
		
		public function get won():int {
			return _won;
		}
		
		public function set won( value:int ):void {
			_won = value;
		}
		
		public function set lose( value:int ):void {
			_lose = value;
		}
		
		public function get lose():int {
			return _lose
		}
		
		public function set success( value:Boolean ):void {
			_success = value;
		}
		
		public function get success():Boolean {
			return _success;
		}
	}
}