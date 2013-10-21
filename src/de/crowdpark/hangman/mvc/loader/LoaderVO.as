package de.crowdpark.hangman.mvc.loader {
	
	
	public class LoaderVO {
		
		private var _event:String;
		private var _url:String;
		private var _content:XML;
		
		
		public function LoaderVO( event:String, url:String ){
			_event = event;
			_url = url;
		}
		
		public function get event():String {
			return _event;
		}
		
		public function get url():String {
			return _url;
		}
		
		public function set content( value:XML ):void {
			_content = value;
		}
		
		public function get content():XML {
			return _content;
		}
	}
}