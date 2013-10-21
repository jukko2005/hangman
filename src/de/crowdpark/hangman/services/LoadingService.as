package de.crowdpark.hangman.services {
	
	import de.crowdpark.hangman.events.LoadingEvent;
	import de.crowdpark.hangman.mvc.loader.LoaderVO;
	import de.crowdpark.hangman.mvc.loader.XMLLoader;
	
	import org.robotlegs.mvcs.Actor;
	
	
	/**
	 * Loads xml files
	 */
	public class LoadingService extends Actor {
		
		
		private var _loader:XMLLoader;
		
		public function load( vo:LoaderVO ):void {
			_loader = new XMLLoader( vo );
			_loader.eventBus.add( onLoadingEvent );
			
			_loader.load();
		}
		
		private function onLoadingEvent( status:int, value:LoaderVO ):void {
			switch( status ){
				case XMLLoader.ERROR_CODE:
					trace("LOADING ERROR!");
					break;
				
				case XMLLoader.SUCCESS_CODE:
					//trace("Loaded Content is:", value.toXMLString() );
					destroyLoader();
					handleSuccess( value );
					break;
				
				default:
					trace("NO VALID STATUS CODE FOR LOAD: " + status );
			}
			
			
		}
		
		private function handleSuccess( vo:LoaderVO ):void {
			dispatch( new LoadingEvent( vo.event, vo ));
		}
		
		private function destroyLoader():void {
			_loader.destroy();
			_loader = null;
		}
	}
}