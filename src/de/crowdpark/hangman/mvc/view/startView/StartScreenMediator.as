package de.crowdpark.hangman.mvc.view.startView {
	
	
	import de.crowdpark.hangman.consts.AppConsts;
	import de.crowdpark.hangman.mvc.view.component.ViewComponentMediator;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class StartScreenMediator extends ViewComponentMediator{
		
		[Inject]
		public var _screen:StartScreen;
		
		
		override public function onRegister():void {
			_screen.eventBus.add( onPlayClicked );
			
			super.onRegister();
		}
		
		private function onPlayClicked():void {
			dispatch( new Event( AppConsts.START_GAME_CLICKED ));
		}
	}
}