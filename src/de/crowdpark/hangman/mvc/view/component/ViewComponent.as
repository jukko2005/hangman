package de.crowdpark.hangman.mvc.view.component {
	
	
	import de.crowdpark.hangman.utils.Displays;
	import de.crowdpark.hangman.utils.Listeners;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;
	
	public class ViewComponent extends Sprite implements IComponent{
		
		protected var _listeners:Listeners = new Listeners();
		protected var _eventBus:Signal = new Signal();
		
		public function ViewComponent() {
			super();
		}
		
		public function get eventBus():Signal {
			return _eventBus;
		}
		
		public function get componentName():String {
			return name;
		}
		
		public function destroy():void{
			_listeners.removeAll();
			_listeners = null;
			
			_eventBus.removeAll();
			_eventBus = null;
			
			Displays.remove( this );
		}
	}
}