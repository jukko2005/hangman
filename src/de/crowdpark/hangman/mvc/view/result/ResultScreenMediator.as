package de.crowdpark.hangman.mvc.view.result {
	
	
	import de.crowdpark.hangman.consts.AppConsts;
	import de.crowdpark.hangman.mvc.view.component.ViewComponentMediator;
	
	import flash.events.Event;
	
	public class ResultScreenMediator extends ViewComponentMediator {
		
		[Inject]
		public var _screen:ResultScreen;
		
		override public function onRegister():void {
			_screen.eventBus.add( onClickedScreen );
			
			super.onRegister();
		}
		
		private function onClickedScreen():void {
			dispatch( new Event( AppConsts.SHOW_START_SCREEN ));
		}
	}
}