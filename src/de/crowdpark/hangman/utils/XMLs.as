package de.crowdpark.hangman.utils {
	public class XMLs {
		
		
		/**
		 * function collect
		 * Collects all children values and returns them in an array.
		 * 
		 * @param list XMLList
		 */
		public static function collect( list:XMLList ):Array {
			var result:Array = [];
			
			for each ( var node:XML in list.children() ) {
				result.push( node );
			}
			
			return result;
		}
	}
}