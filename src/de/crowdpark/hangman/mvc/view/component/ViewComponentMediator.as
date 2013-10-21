package de.crowdpark.hangman.mvc.view.component {
	
	
	import de.crowdpark.hangman.consts.AppConsts;
	import de.crowdpark.hangman.events.AppEvent;
	import de.crowdpark.hangman.utils.Listeners;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ViewComponentMediator extends Mediator {
		
		protected var _listeners:Listeners = new Listeners();
		
		public function ViewComponentMediator(){
			super();
		}
		
		override public function onRegister():void {
			eventMap.mapListener( eventDispatcher, AppConsts.REMOVE_VIEW, onRemoveComponent, AppEvent ); 
			
			
			super.onRegister();
		}
		
		override public function onRemove():void {
			eventMap.unmapListener( eventDispatcher, AppConsts.REMOVE_VIEW, onRemoveComponent, AppEvent );
			
			_listeners.removeAll();
			_listeners = null;
			
			super.onRemove();
		}
		
		protected function onRemoveComponent( event:AppEvent ):void {
			var comp:String = event.viewComponent;
			var view:IComponent = getViewComponent() as IComponent;
			
			if ( comp == view.componentName ) {
				view.destroy();
			}
		}
	}
}