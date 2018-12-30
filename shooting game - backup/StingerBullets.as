package  {
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class StingerBullets extends MovieClip {
		
		private var stageRef:Stage;
		private var vx:Number;
		private var vy:Number;
		
		public function StingerBullets(stageRef:Stage,x:Number,y:Number,sx:Number=0,sy:Number=0) {
			this.stageRef = stageRef;
			this.x = x;
			this.y = y;
			vx = sx;
			vy = sy;
			
			addEventListener(Event.ENTER_FRAME,loop,false,0,true);			
			// constructor code
		}
		
		public function loop(e:Event){
			x+=vx;
			y+=vy;
			
			if(x>stageRef.stageWidth || x<0){
				removeSelf();
			}
		}
		
		public function removeSelf(){
			removeEventListener(Event.ENTER_FRAME,loop);
			if(stage.contains(this)){
				stage.removeChild(this);
			}
		}
	}
	
}
