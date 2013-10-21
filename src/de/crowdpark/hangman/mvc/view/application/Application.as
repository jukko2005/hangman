package de.crowdpark.hangman.mvc.view.application {
	import de.crowdpark.hangman.consts.AppConsts;
	import de.crowdpark.hangman.mvc.view.asset.AppBackground;
	import de.crowdpark.hangman.mvc.view.asset.HeadlineAsset;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	
	public class Application extends Sprite {
		
		public function Application() {
			super();
			
			createBackground();
			createHeadline();
		}
		
		private function createBackground():void {
			var back:AppBackground = new AppBackground(AppConsts.APP_WIDTH, AppConsts.APP_HEIGHT);
			
			addChild( new Bitmap(back) );
		}
		
		private function createHeadline():void {
			var headline:HeadlineAsset = new HeadlineAsset();
			addChild( headline );
		}
	}
}