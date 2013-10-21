package de.crowdpark.hangman.mvc.view.gameView {
	
	
	import de.crowdpark.hangman.consts.AppConsts;
	import de.crowdpark.hangman.events.AppEvent;
	import de.crowdpark.hangman.mvc.model.LetterVO;
	import de.crowdpark.hangman.mvc.view.component.ViewComponentMediator;
	
	public class GameScreenMediator extends ViewComponentMediator {
		
		
		[Inject]
		public var _screen:GameScreen;
		
		
		override public function onRegister():void {
			_screen.eventBus.add( onKeySelected );
			_screen.removeSignal.add( onRemoveScreen );
			
			eventMap.mapListener( eventDispatcher, AppConsts.UPDATE_GUESSED_LETTERS, onUpdateLetters, AppEvent );
			eventMap.mapListener( eventDispatcher, AppConsts.UPDATE_GIBBIT, onUpdateGibbit, AppEvent );
			eventMap.mapListener( eventDispatcher, AppConsts.PREPARE_REMOVEMENT, onPrepareRemovement, AppEvent );
			
			super.onRegister();
		}
		
		override public function onRemove():void {
			eventMap.unmapListener( eventDispatcher, AppConsts.UPDATE_GUESSED_LETTERS, onUpdateLetters, AppEvent );
			eventMap.unmapListener( eventDispatcher, AppConsts.UPDATE_GIBBIT, onUpdateGibbit, AppEvent );
			eventMap.unmapListener( eventDispatcher, AppConsts.PREPARE_REMOVEMENT, onPrepareRemovement, AppEvent );
			
			super.onRemove();
		}
		
		private function onKeySelected( letter:String ):void {
			var event:AppEvent = new AppEvent( AppConsts.SELECTED_KEY );
			event.key = letter;
			
			dispatch( event );
		}
		
		private function onUpdateLetters( event:AppEvent ):void {
			var letters:Array = event.guessedLetters;
			
			for each ( var vo:LetterVO in letters ) {
				_screen.updateLetters( vo.charIndex, vo.char );
			}
		}
		
		private function onUpdateGibbit( event:AppEvent ):void {
			_screen.updateGibbet();
		}
		
		private function onPrepareRemovement( event:AppEvent ):void {
			_screen.prepareRemoval();
		}
		
		private function onRemoveScreen():void {
			dispatch( new AppEvent( AppConsts.SHOW_RESULT_SCREEN ));
		}
	}
}