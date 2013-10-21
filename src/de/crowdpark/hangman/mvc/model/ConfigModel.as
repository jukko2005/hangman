package de.crowdpark.hangman.mvc.model {
	
	
	import de.crowdpark.hangman.consts.AppConsts;
	import de.crowdpark.hangman.mvc.loader.XMLLoader;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * Class ConfigModel
	 * Stores the loaded config file and returns certain values as a copy.
	 */
	public class ConfigModel extends Actor {
		
		private var _config:XML;
		
		
		public function get snippets():XMLList {
			return config.snippets;
		}
		
		public function get gameConf():XMLList {
			return config.game;
		}
		
		public function set config( value:XML ):void {
			_config = value;
		}
		
		public function get config():XML {
			return _config ? _config.copy() : new XML();
		}
	}
}