package de.crowdpark.hangman.services{
	
	
	import de.crowdpark.hangman.services.sound.ClickSound;
	import de.crowdpark.hangman.services.sound.LoseSound;
	import de.crowdpark.hangman.services.sound.WinSound;
	
	import flash.media.Sound;
	
	import org.robotlegs.mvcs.Actor;
	
	
	/**
	 * Plays sounds and stops them.
	 */
	public class SoundService extends Actor{
		
		private var _sounds:Object = {
			click: ClickSound,
			lose: LoseSound,
			win: WinSound
		}
		
		private var _activeSounds:Object = {};
		
		public function playSound( id:String ):void {
			var soundClass:Class = _sounds[id];
			
			if ( soundClass ){
				var sound:SoundObject = new SoundObject( id, soundClass );
				sound.finished.add( onSoundFinished );
				
				_activeSounds[sound.id] = sound;
				
				sound.play();
			} else {
				trace("Sound not found!");
			}
		}
		
		public function stopSounds():void {
			var sound:SoundObject;
			
			for ( var key:String in _activeSounds ) {
				destroySound( key );
			}
		}
		
		private function destroySound( id:String ):void {
			var sound:SoundObject = _activeSounds[id];
			
			if ( sound ){
				sound.destroy();
				sound = null;
				
				_activeSounds[id] = null;
				
				delete _activeSounds[id];
			}
		}
		
		private function onSoundFinished( id:String ):void {
			destroySound( id );
		}
	}
}