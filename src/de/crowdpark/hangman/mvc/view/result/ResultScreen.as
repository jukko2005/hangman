package de.crowdpark.hangman.mvc.view.result {
	
	
	import de.crowdpark.hangman.mvc.view.asset.ResultScreenAsset;
	import de.crowdpark.hangman.mvc.view.component.ViewComponent;
	import de.crowdpark.hangman.utils.Snippets;
	
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class ResultScreen extends ViewComponent {
		
		private var _asset:ResultScreenAsset;
		private var _success:Boolean;
		
		public function ResultScreen( success:Boolean ){
			super();
			
			_success = success;
			
			setAsset();
			setText();
			
			buttonMode = true;
			
			_listeners.add( this, MouseEvent.CLICK, onClickedResultScreen );
		}
		
		private function setAsset():void {
			_asset = new ResultScreenAsset();
			addChild( _asset );
		}
		
		private function setText():void {
			var msgBox:TextField = _asset.getChildByName( "txt_message" ) as TextField;
			var msgKey:String    = _success ? "SUCCESS_MESSAGE" : "FAIL_MESSAGE";
			
			msgBox.text = Snippets.getSnippet( msgKey );
		}
		
		private function onClickedResultScreen( event:MouseEvent ):void {
			event.stopImmediatePropagation();
			
			_eventBus.dispatch();
		}
	}
}