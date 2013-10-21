package de.crowdpark.hangman.services {
	
	
	import de.crowdpark.hangman.utils.Listeners;
	
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	import org.osflash.signals.Signal;

	public class SoundObject {
		
		private var _finished:Signal = new Signal( String );
		private var _listeners:Listeners = new Listeners();
		
		private var _id:String;
		
		private var _snd:Sound;
		
		private var _sndChannel:SoundChannel;
		
		public function SoundObject( id:String, snd:Class ){
			_id = id;
			_snd = new snd();
		}
		
		public function play():void {
			_sndChannel = _snd.play();
			
			_listeners.add( _sndChannel, Event.SOUND_COMPLETE, onSoundComplete );
		}
		
		private function onSoundComplete( event:Event ):void {
			_finished.dispatch( _id );
		}
		
		public function get finished():Signal {
			return _finished;
		}
		
		public function get id():String {
			return _id;
		}
		
		public function destroy():void {
			_finished.removeAll();
			_finished = null;
			
			_listeners.removeAll();
			_listeners = null;
			
			if ( _sndChannel ){
				_sndChannel.stop();
				_sndChannel = null;
			}
			
			_snd = null;
		}
	}
}