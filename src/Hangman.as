package {
	
	import de.crowdpark.hangman.ApplicationContext;
	
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	
	
	[SWF(width='310', height='450', backgroundColor='#000000', frameRate='30')]
	public class Hangman extends Sprite {
		
		private var _context:ApplicationContext;
		
		public function Hangman() {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			_context = new ApplicationContext( this );
		}
	}
}