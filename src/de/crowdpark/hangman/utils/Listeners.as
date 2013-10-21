package de.crowdpark.hangman.utils {
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	
	/**
	*	stores and manages a collection of ListenerData objects containing
	*	references to event dispatching objects of interest and their
	*	parameters
	*/
	public class Listeners {
		/**
		*	holding references to all stored ListenerData objects
		*/
		private var _listeners:Dictionary = new Dictionary();
		
		/**
		*	store a new ListenerData object with its parameters
		*	
		*/
		public function add( dispatcher:IEventDispatcher, type:String, callback:Function, id:String = null, overwrite:Boolean = false, useCapture:Boolean = false, priority:int = 0, useWeak:Boolean = true ):void {
			id = id || type;
			
			if ( hasListener( id ) ) {
				remove( id );
			}
			
			_listeners[ id ] = new ListenerData( this, dispatcher, type, callback, useCapture, priority, useWeak );
		}
		
		
		public function hasListener( id:String ):Boolean {
			return getListener( id ) != null;
		}
		
		public function remove( id:String ):void {
			if ( hasListener( id ) ) {
				getListener( id ).remove();
			}
			
			delete _listeners[ id ];
		}
		
		public function removeAll():void {
			for ( var id:String in _listeners ) {
				remove( id );
			}
		}
		
		private function getListener( id:String ):ListenerData {
			return _listeners[ id ] as ListenerData;
		}
		
		public function handleEvent( event:Event, callback:Function ):void{
			callback( event );
		}
	}
}

import de.crowdpark.hangman.utils.*;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.events.*;
import flash.utils.*;

/**
*	container for all needed data to manage a certain event dispatcher and its
*	parameters
*/
class ListenerData {
	private var _parent:Listeners;
	private var _dispatcher:IEventDispatcher;
	private var _type:String;
	private var _callback:Function;
	private var _useCapture:Boolean;
	
	
	public function ListenerData( parent:Listeners, dispatcher:IEventDispatcher, type:String, callback:Function, useCapture:Boolean, priority:int, useWeak:Boolean ) {
		_parent     = parent;
		_dispatcher = dispatcher;
		_type       = type;
		_callback   = callback;
		_useCapture = useCapture;
		
		_dispatcher.addEventListener( _type, handleEvent, useCapture, priority, useWeak);
	}
	
	/**
	 * remove this listener from the dispatcher
	 */
	public function remove():void {
		_dispatcher.removeEventListener( _type, handleEvent, _useCapture);
	}
	
	private function handleEvent( event:Event ):void {
		_callback( event );
	}
}
