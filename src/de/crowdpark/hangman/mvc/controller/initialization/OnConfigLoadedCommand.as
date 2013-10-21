package de.crowdpark.hangman.mvc.controller.initialization {
	
	import de.crowdpark.hangman.consts.AppConsts;
	import de.crowdpark.hangman.events.LoadingEvent;
	import de.crowdpark.hangman.mvc.loader.LoaderVO;
	import de.crowdpark.hangman.mvc.model.ConfigModel;
	import de.crowdpark.hangman.services.LoadingService;
	
	import org.robotlegs.mvcs.Command;
	
	public class OnConfigLoadedCommand extends Command {
		
		[Inject]
		public var _config:ConfigModel;
		
		[Inject]
		public var _event:LoadingEvent;
		
		[Inject]
		public var _loading:LoadingService;
		
		
		override public function execute():void {
			_config.config = _event.vo.content;
			
			var snippet:XMLList = _config.snippets.snippet.(@id == "main");
			var url:String = snippet.@url;
			
			_loading.load( new LoaderVO( AppConsts.APP_ASSETS_LOADED, url ));
		}
	}
}