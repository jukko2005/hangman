package de.crowdpark.hangman.mvc.loader {
	import com.adobe.utils.XMLUtil;
	
	import de.crowdpark.hangman.utils.Listeners;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import org.osflash.signals.Signal;
	
	
	/**
	 * class XMLLoader
	 * Loads a certain xml file and checks if xml is valid
	 * After that check, a signal will be dispatched with a status code and the LoaderVO.
	 */
	public class XMLLoader {
		
		public static const ERROR_CODE   : int  = -1;
		public static const SUCCESS_CODE : int = 100;
		
		private var _listeners:Listeners = new Listeners();
		private var _loadingSignal:Signal = new Signal(int, LoaderVO);
		private var _loading:Boolean;
		
		private var _urlLoader:URLLoader = new URLLoader();
		private var _vo:LoaderVO;
		
		public function XMLLoader( loaderVO:LoaderVO ){
			_vo = loaderVO;
		}
		
		public function load():void {
			if ( !_loading ){
				_loading = true;
				
				_listeners.add( _urlLoader, Event.COMPLETE, onLoadingComplete );
				_listeners.add( _urlLoader, IOErrorEvent.IO_ERROR, onErrorLoading );
				
				var request:URLRequest = new URLRequest( _vo.url );
				_urlLoader.load( request );
			} else {
				trace( this + " :: Already loading!");
			}
		}
		
		private function onErrorLoading( event:IOErrorEvent ):void {
			_loading = false;
			
			_loadingSignal.dispatch( ERROR_CODE, _vo );
		}
		
		private function onLoadingComplete( event:Event ):void {
			_loading = false;
			
			checkContent();
		}
		
		private function checkContent():void {
			var loadedData:String = _urlLoader.data;
			
			if ( XMLUtil.isValidXML( loadedData ) ) {
				_vo.content = new XML(loadedData);
				
				_loadingSignal.dispatch( SUCCESS_CODE, _vo );
			} else {
				throw new Error("Invalid XML-Data for url: '" + _vo.url + "'" );
			}
		}
		
		public function get eventBus():Signal {
			return _loadingSignal;
		}
		
		public function destroy():void{
			_listeners.removeAll();
			_loadingSignal.removeAll();
			
			_listeners = null;
			_loadingSignal = null;
			_urlLoader = null;
		}
	}
}