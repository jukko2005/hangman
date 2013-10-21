package de.crowdpark.hangman.mvc.controller.startScreen {
	import de.crowdpark.hangman.consts.AppConsts;
	import de.crowdpark.hangman.mvc.model.GameModel;
	import de.crowdpark.hangman.mvc.view.result.ResultScreen;
	import de.crowdpark.hangman.mvc.view.startView.StartScreen;
	import de.crowdpark.hangman.services.SoundService;
	
	import org.robotlegs.mvcs.Command;
	
	public class OnSowStartScreenCommand extends Command {
		
		[Inject]
		public var _game:GameModel;
		
		[Inject]
		public var _sound:SoundService;
		
		override public function execute():void {
			var resultScreen:ResultScreen = contextView.getChildByName( AppConsts.DISPLAY_NAME_END_VIEW ) as ResultScreen;
			if ( resultScreen ) {
				resultScreen.destroy();
			}
			
			_sound.stopSounds();
			
			var startScreen:StartScreen = new StartScreen( _game.won, _game.lose );
			startScreen.name = AppConsts.DISPLAY_NAME_START_VIEW;
			contextView.addChild( startScreen );
		}
	}
}