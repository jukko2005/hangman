package de.crowdpark.hangman.mvc.view.gameView {
	
	
	import de.crowdpark.hangman.consts.AppConsts;
	import de.crowdpark.hangman.mvc.view.assets.GameScreenAsset;
	import de.crowdpark.hangman.mvc.view.component.ViewComponent;
	import de.crowdpark.hangman.utils.Displays;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.system.ApplicationDomain;
	import flash.text.TextField;
	import flash.utils.getQualifiedClassName;
	import flash.utils.setInterval;
	import flash.utils.setTimeout;
	
	import org.osflash.signals.Signal;
	
	public class GameScreen extends ViewComponent {
		
		private static const KEY_PREF : String = "key_";
		private static const KEY_FRAME_INACTIVE : String = "inactive";
		
		private var _gameScreen:GameScreenAsset;
		private var _cellContainer:Sprite;
		private var _removeSignal:Signal = new Signal();
		
		public function GameScreen( wordLength:int ) {
			super();
			
			createAsset();
			createCells( wordLength );
			configureKeyboard();
		}
		
		/**
		 * Adds main game asset to displayList
		 */
		private function createAsset():void {
			_gameScreen = new GameScreenAsset();
			
			addChild( _gameScreen );
		}
		
		
		/**
		 * Gets the class of cell - displayObject and creates a certain number of empty cells,
		 * regarding the length of the guessed word.
		 */
		private function createCells( len:int ):void {
			var cell:DisplayObject    = _gameScreen.getChildByName("cell") as DisplayObject;
			var cellClassName:String  = getQualifiedClassName( cell );
			var dom:ApplicationDomain = ApplicationDomain.currentDomain;
			var cellClass:Class       = Class( dom.getDefinition( cellClassName ));
			
			_cellContainer = new Sprite();
			_cellContainer.y = cell.y;
			
			var cellChild:DisplayObject;
			for ( var i:int = 0 ; i<len ; i++ ) {
				cellChild = new cellClass();
				cellChild.x = (cellChild.width + 5) * i;
				
				_cellContainer.addChild( cellChild );
			}
			
			_gameScreen.removeChild( cell );
			
			_cellContainer.x = (AppConsts.APP_WIDTH - _cellContainer.width) >> 1;
			
			addChild( _cellContainer );
		}
		
		/**
		 * Displays the next status of gibbit
		 */
		public function updateGibbet():void{
			var gibbet:MovieClip = _gameScreen.getChildByName( "gibbet" ) as MovieClip;
			
			gibbet.gotoAndStop( gibbet.currentFrame + 1 );
		}
		
		public function updateLetters( index:int, char:String ):void {
			var cell:Sprite = _cellContainer.getChildAt( index ) as Sprite;
			var label:TextField = cell.getChildByName( "txt_letter" ) as TextField;
			
			label.text = char.toUpperCase();
		}
		
		/**
		 * Gets the keyboard dispplayobject and adds listeners to all keys.
		 */
		private function configureKeyboard():void{
			var keyboard:MovieClip = _gameScreen.getChildByName( "keyboard" ) as MovieClip;
			var numChilds:int = keyboard.numChildren;
			var child:Sprite;
			
			for ( var i:int=0 ; i<numChilds ; i++ ){
				child = keyboard.getChildAt( i ) as Sprite;
				child.buttonMode = true;
				
				_listeners.add( child, MouseEvent.CLICK, onClickKeyboard, child.name );
			}
		}
		
		/**
		 * Callback of a keyboard click. Set the certain key inactive by removing the 
		 * eventlistener and dispatches a signal by the pressed key.
		 */
		private function onClickKeyboard( event:MouseEvent ):void {
			event.stopImmediatePropagation();
			
			var key:MovieClip  = MovieClip( event.target );
			var keyName:String = key.name;
			
			key.buttonMode = false;
			key.gotoAndStop( KEY_FRAME_INACTIVE );
			_listeners.remove( keyName );
			
			keyName = keyName.split( KEY_PREF )[1];
			
			_eventBus.dispatch( keyName );
		}
		
		/**
		 * Delays the removement.
		 */
		public function prepareRemoval():void {
			_listeners.removeAll();
			
			setTimeout( function removing():void {_removeSignal.dispatch();}, 3000 );
		}
		
		
		public function get removeSignal():Signal {
			return _removeSignal;
		}
		
		override public function destroy():void {
			_removeSignal.removeAll();
			_removeSignal = null;
			
			super.destroy();
		}
	}
}