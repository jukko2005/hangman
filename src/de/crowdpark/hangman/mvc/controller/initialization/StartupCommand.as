package de.crowdpark.hangman.mvc.controller.initialization {
	
	
	import de.crowdpark.hangman.consts.AppConsts;
	import de.crowdpark.hangman.mvc.loader.LoaderVO;
	import de.crowdpark.hangman.mvc.model.ConfigModel;
	import de.crowdpark.hangman.mvc.view.application.Application;
	import de.crowdpark.hangman.services.LoadingService;
	
	import org.robotlegs.mvcs.Command;
	
	public class StartupCommand extends Command {
		
		[Inject]
		public var _loading:LoadingService;
		
		override public function execute():void {
			var app:Application = new Application();
			contextView.addChild( app );
			
			_loading.load( new LoaderVO(AppConsts.CONFIG_LOADED, AppConsts.APP_CONFIG_PATH) );
		}
	}
}