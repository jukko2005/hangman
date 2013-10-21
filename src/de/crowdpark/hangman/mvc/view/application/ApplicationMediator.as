package de.crowdpark.hangman.mvc.view.application {
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ApplicationMediator extends Mediator {
		[Inject]
		public var _app:Application;
		
		public function ApplicationMediator(){
			super();
		}
	}
}