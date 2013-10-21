package de.crowdpark.hangman.mvc.controller.result {
	
	import de.crowdpark.hangman.consts.AppConsts;
	import de.crowdpark.hangman.mvc.model.GameModel;
	import de.crowdpark.hangman.mvc.view.result.ResultScreen;
	import de.crowdpark.hangman.mvc.view.gameView.GameScreen;
	
	import org.robotlegs.mvcs.Command;
	
	public class ShowResultScreenCommand extends Command{
		
		[Inject]
		public var _game:GameModel;
		
		override public function execute():void {
			var game:GameScreen = contextView.getChildByName( AppConsts.DISPLAY_NAME_GAME_VIEW ) as GameScreen;
			if ( game ){
				game.destroy();
			}
			
			var result:ResultScreen = new ResultScreen( _game.success );
			result.name = AppConsts.DISPLAY_NAME_END_VIEW;
			contextView.addChild( result );
		}
	}
}