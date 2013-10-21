package de.crowdpark.hangman.mvc.controller.initialization {
	import de.crowdpark.hangman.consts.AppConsts;
	import de.crowdpark.hangman.events.LoadingEvent;
	import de.crowdpark.hangman.mvc.model.ConfigModel;
	import de.crowdpark.hangman.mvc.model.GameModel;
	import de.crowdpark.hangman.utils.Snippets;
	import de.crowdpark.hangman.utils.XMLs;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class OnAppAssetsLoaded extends Command {
		
		[Inject]
		public var _event:LoadingEvent;
		
		[Inject]
		public var _game:GameModel;
		
		[Inject]
		public var _config:ConfigModel;
		
		override public function execute():void {
			var loadedSnippets:XML = _event.vo.content;
			Snippets.register( loadedSnippets );
			
			var words:XMLList = _config.gameConf.words;
			var wordList:Array = XMLs.collect( words );
			for ( var i:int=0 ; i<wordList.length ; i++ ){
				wordList[i] = Snippets.getSnippet( wordList[i] );
			}
			
			_game.words = wordList;
			
			dispatch( new Event( AppConsts.SHOW_START_SCREEN ));
		}
	}
}