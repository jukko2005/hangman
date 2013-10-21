package de.crowdpark.hangman.events {
	
	import de.crowdpark.hangman.mvc.loader.LoaderVO;
	
	import flash.events.Event;
	
	public class LoadingEvent extends Event {
		
		private var _vo:LoaderVO;
		
		public function LoadingEvent(type:String, loaderVO:LoaderVO=null, bubbles:Boolean=false ){
			super(type, bubbles );
			
			_vo = loaderVO;
		}
		
		public function get vo():LoaderVO {
			return _vo;
		}
	}
}