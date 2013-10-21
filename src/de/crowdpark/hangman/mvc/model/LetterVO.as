package de.crowdpark.hangman.mvc.model {
	
	
	public class LetterVO {
		
		private var _charIndex:int;
		private var _char:String;
		private var _found:Boolean;
		
		
		public function LetterVO( index:int, char:String ) {
			_charIndex = index;
			_char = char;
		}
		
		public function get char():String {
			return _char;
		}
		
		public function get charIndex():int {
			return _charIndex;
		}
		
		public function get found():Boolean {
			return _found;
		}
		
		public function set found( value:Boolean ):void {
			_found = value;
		}
		
		public function copy():LetterVO {
			var vo:LetterVO = new LetterVO(_charIndex, _char);
			vo.found = _found;
			
			return vo;
		}
		
		public function toString():String {
			return "LetterVO: " + _char + " " + _charIndex + " " + _found;
		}
	}
}