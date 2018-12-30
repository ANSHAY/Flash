package  {
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class Engine extends MovieClip {
		private var numStars:Number = 80;
		private var enemyList:Array = new Array();
		var ourShip:Ship;
		
		public function Engine() {
			// constructor code
			ourShip = new Ship(stage);
			
			stage.addChild(ourShip);
			ourShip.x = stage.stageWidth/2;
			ourShip.y = stage.stageHeight*3/4;
			
			for(var i:int = 0; i<numStars; i++){
				stage.addChildAt(new Star(stage),1);
			}
			
			addEventListener(Event.ENTER_FRAME,loop,false,0,true);
		}
		
		public function loop(e:Event){
			
			if(Math.floor(Math.random()*90)<=1){
				var enemy = new Stinger(stage,ourShip);
				enemy.addEventListener(Event.REMOVED_FROM_STAGE,removeEnemy,false,0,true);
				enemyList.push(enemy);				
				stage.addChild(enemy);
			}
			
		}
		public function removeEnemy(e:Event){
			removeEventListener(Event.REMOVED_FROM_STAGE,removeEnemy);
			enemyList.splice(enemyList.indexOf(e.currentTarget),1);
		}

	}
	
}
