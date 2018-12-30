package  {
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Bullet extends MovieClip {
		
		private var stageRef:Stage;
		private var bulletSpeed:Number = 15;
		
		public function Bullet(stageRef:Stage,shipX:Number,shipY:Number) {
			// constructor code
			this.stageRef = stageRef;
			this.x = shipX;
			this.y = shipY;
			addEventListener(Event.ENTER_FRAME,loop,false,0,true);
		}
		
		public function loop(e:Event){
			rotation += 10;
			y -= bulletSpeed;
			if (y<0){
				removeSelf();
			}
			
			for(var i:int=0; i<Engine.enemyList.length;i++){
				if(hitTestObject(Engine.enemyList[i].hit)){
					Engine.enemyList[i].takeHit();
					removeSelf();
				}
			}
		}
		
		public function removeSelf(){
			removeEventListener(Event.ENTER_FRAME,loop,false);
			if(stageRef.contains(this)){
				stageRef.removeChild(this);
			}
			
		}
	}
	
}
