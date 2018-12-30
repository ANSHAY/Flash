package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Stage;
	
	
	public class Explosion extends MovieClip {
		private var stageRef:Stage;
		
		public function Explosion(stageRef:Stage,x:Number,y:Number) {
			this.stageRef=stageRef;
			this.x=x;
			this.y=y;
			
			addEventListener(Event.ENTER_FRAME,loop,false,0,true);
			
			// constructor code
		}
		
		public function loop(e:Event){
			if(currentFrame==totalFrames){
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
