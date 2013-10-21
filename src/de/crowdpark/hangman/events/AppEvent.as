package de.crowdpark.hangman.events {
	
	import flash.events.Event;
	
	public class AppEvent extends Event{
		
		private var _viewComponent:String; //name of a certain viewcomponent
		private var _key:String;
		private var _guessedLetters:Array;
		
		public function AppEvent(type:String, bubbles:Boolean=false) {
			super(type, bubbles);
		}
		
		public function set viewComponent( value:String ):void {
			_viewComponent = value;
		}
		
		public function get viewComponent():String {
			return _viewComponent;
		}
		
		public function get key():String {
			return _key;
		}
		
		public function set key( value:String ):void {
			_key = value;
		}
		
		public function set guessedLetters( value:Array ):void {
			_guessedLetters = value;
		}
		
		public function get guessedLetters():Array {
			return _guessedLetters;
		}
	}
}