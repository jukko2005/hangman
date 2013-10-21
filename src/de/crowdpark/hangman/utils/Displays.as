package de.crowdpark.hangman.utils {
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	
	public class Displays{
		
		
		/**
		 * Remove all children in a certain displayobjectcontainer
		 */
		public static function emptyContainer( container:DisplayObjectContainer ):void {
			while ( container.numChildren ) {
				container.removeChildAt( 0 );
			}
		}
		
		/**
		 * Remove DisplayObject from its parent
		 */
		public static function remove( display:DisplayObject ):void {
			var parent:DisplayObjectContainer = display.parent;
			
			if ( parent ) {
				parent.removeChild( display );
			}
		}
	}
}