package de.crowdpark.hangman.utils {
	
	
	
	public class Snippets {
		
		private static var _snippets:XML;
		
		public static function register( list:XML ):void {
			_snippets = list;
		}
		
		/**
		 * Returns a certain snippet by the passed key. In addition to that you can 
		 * pass values into that snippet by setting the second 'params' parameter.
		 */
		public static function getSnippet( key:String, params:Object=null ):String {
			var value:String = _snippets ? _snippets[key] : "";
			
			if ( params ){
				value = Strings.parse( value, params );
			}
			
			return value;
		}
	}
}