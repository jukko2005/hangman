package de.crowdpark.hangman.utils{
	
	
	public class Strings {
		
		private static const SEP:String = "$$";
		
		/**
		 * Passes certain values into a givven String
		 */
		public static function parse( input:String, params:Object=null, sep:String=SEP ):String {
			var list:Array;
			
			for ( var key:Object in params ) {
				list  = input.split( sep + key + sep );
				input = list.join( params[ key ] );
			}
			
			return input;
		}
	}
}
