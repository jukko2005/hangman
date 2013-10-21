package de.crowdpark.hangman{
	
	import de.crowdpark.hangman.consts.AppConsts;
	import de.crowdpark.hangman.events.AppEvent;
	import de.crowdpark.hangman.events.LoadingEvent;
	import de.crowdpark.hangman.mvc.controller.gameScreen.OnKeySelectedCommand;
	import de.crowdpark.hangman.mvc.controller.initialization.OnAppAssetsLoaded;
	import de.crowdpark.hangman.mvc.controller.initialization.OnConfigLoadedCommand;
	import de.crowdpark.hangman.mvc.controller.initialization.StartupCommand;
	import de.crowdpark.hangman.mvc.controller.result.ShowResultScreenCommand;
	import de.crowdpark.hangman.mvc.controller.startScreen.OnPlayClickedCommand;
	import de.crowdpark.hangman.mvc.controller.startScreen.OnSowStartScreenCommand;
	import de.crowdpark.hangman.mvc.model.ConfigModel;
	import de.crowdpark.hangman.mvc.model.GameModel;
	import de.crowdpark.hangman.mvc.view.result.ResultScreen;
	import de.crowdpark.hangman.mvc.view.application.Application;
	import de.crowdpark.hangman.mvc.view.application.ApplicationMediator;
	import de.crowdpark.hangman.mvc.view.gameView.GameScreen;
	import de.crowdpark.hangman.mvc.view.gameView.GameScreenMediator;
	import de.crowdpark.hangman.mvc.view.result.ResultScreenMediator;
	import de.crowdpark.hangman.mvc.view.startView.StartScreen;
	import de.crowdpark.hangman.mvc.view.startView.StartScreenMediator;
	import de.crowdpark.hangman.services.LoadingService;
	import de.crowdpark.hangman.services.SoundService;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	
	public class ApplicationContext extends Context{
		
		
		public function ApplicationContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true){
			super(contextView, autoStartup);
		}
		
		override public function startup():void {
			commandMap.mapEvent( ContextEvent.STARTUP_COMPLETE, StartupCommand, ContextEvent, true );
			commandMap.mapEvent( AppConsts.CONFIG_LOADED, OnConfigLoadedCommand, LoadingEvent, true );
			commandMap.mapEvent( AppConsts.APP_ASSETS_LOADED, OnAppAssetsLoaded, LoadingEvent, true );
			
			commandMap.mapEvent( AppConsts.SHOW_START_SCREEN, OnSowStartScreenCommand, Event );
			commandMap.mapEvent( AppConsts.START_GAME_CLICKED, OnPlayClickedCommand, Event );
			commandMap.mapEvent( AppConsts.SELECTED_KEY, OnKeySelectedCommand, AppEvent );
			commandMap.mapEvent( AppConsts.SHOW_RESULT_SCREEN, ShowResultScreenCommand, AppEvent );
			
			injector.mapSingleton( ConfigModel );
			injector.mapSingleton( GameModel );
			injector.mapSingleton( LoadingService );
			injector.mapSingleton( SoundService );
			
			mediatorMap.mapView( Application, ApplicationMediator );
			mediatorMap.mapView( StartScreen, StartScreenMediator );
			mediatorMap.mapView( GameScreen, GameScreenMediator );
			mediatorMap.mapView( ResultScreen, ResultScreenMediator );
			
			super.startup();
		}
	}
}