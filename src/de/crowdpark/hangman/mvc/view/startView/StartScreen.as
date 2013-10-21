package de.crowdpark.hangman.mvc.view.startView {
	
	import de.crowdpark.hangman.mvc.view.assets.StartScreenAsset;
	import de.crowdpark.hangman.mvc.view.component.ViewComponent;
	import de.crowdpark.hangman.utils.Listeners;
	import de.crowdpark.hangman.utils.Snippets;
	
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import org.osflash.signals.Signal;
	
	public class StartScreen extends ViewComponent {
		
		private var _layer:StartScreenAsset;
		
		public function StartScreen( won:int, losts:int ) {
			super();
			
			createAsset();
			addText( won, losts );
			configureButton();
		}
		
		private function createAsset():void {
			_layer = new StartScreenAsset();
			
			addChild( _layer );
		}
		
		private function addText( won:int, lost:int ):void {
			var txtRules:TextField = _layer["rulesBubble"]["txt_rules"];
			txtRules.text = Snippets.getSnippet("RULES");
			
			var txtStatus:TextField = _layer["txt_statusbar"];
			txtStatus.text = Snippets.getSnippet( "STATUS", {won:won, lost:lost});
		}
		
		private function configureButton():void {
			var btnPlay:SimpleButton = _layer["btn_play"];
			_listeners.add( btnPlay, MouseEvent.CLICK, onClickPlay );
		}
		
		private function onClickPlay( event:MouseEvent ):void {
			event.stopImmediatePropagation();
			
			_eventBus.dispatch();
		}
		
	}
}