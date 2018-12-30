package  {
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.AccelerometerEvent;
	import flash.sensors.Accelerometer;
	
	public class Ship extends MovieClip {
		private var stageRef:Stage;
		private var key:KeyObject;
		private var accX:Number = 10.0;
		private var accY:Number = 10.0;
		private var vx:Number = 0;
		private var vy:Number = 0;
		private var friction:Number = 1;
		private var maxSpeed:Number = 10;
		
		private var fireTimer:Timer;
		private var fireDelay:Number=100;
		private var canFire:Boolean = true;
		private var fl_Accelerometer:Accelerometer = new Accelerometer();

		public function Ship(stageRef:Stage) {
			// constructor code
			this.stageRef = stageRef;
			key = new KeyObject(stageRef);
			
			fireTimer = new Timer(fireDelay,1);
			fireTimer.addEventListener(TimerEvent.TIMER,timerEventHandler,false,0,true);
			
			//addEventListener(Event.ENTER_FRAME,loop,false,0,true);
			fl_Accelerometer.addEventListener(AccelerometerEvent.UPDATE, fl_AccelerometerUpdateHandler);
		}
		public function loop(e:Event) : void{
			
			// movement
//			if(key.isDown(Keyboard.LEFT)){
//				vx-=accX;
//			}
//			else if(key.isDown(Keyboard.RIGHT)){
//				vx+=accX;
//			}
//			else{
//				vx *= friction;
//			}
//			
//			if(key.isDown(Keyboard.UP)){
//				vy-=accY;
//			}
//			else if(key.isDown(Keyboard.DOWN)){
//				vy+=accY;
//			}
//			else
//				vy *= friction
			
			//if(key.isDown(Keyboard.SPACE)){
				fireBullet();
			//}
				
			// speed limiter	
			if(vx >= maxSpeed)
				vx = maxSpeed
			else if(vx <= -1*maxSpeed)
				vx = -1*maxSpeed
			if(vy >= maxSpeed)
				vy = maxSpeed
			else if(vy <= -1*maxSpeed)
				vy = -1*maxSpeed
			
			
			x += vx;
			y += vy;
			
			//ship dynamics
			rotation = vx;
			scaleX = (maxSpeed - Math.abs(vx))/(maxSpeed*4) + 0.75;
			scaleY = (maxSpeed - Math.abs(vy))/(maxSpeed*6) + 0.75;
			
			// restrict ship
			if(x>stage.stageWidth){
				x = stage.stageWidth - this.width/2;
				vx = -vx;
			}
			else if(x<0){
				x = this.width/2;
				vx = -vx;
			}
			if(y>stage.stageHeight){
				y = stage.stageHeight - this.height/2;
				vy = -vy;
			}
			else if(y<0){
				y = this.height/2;
				vy = -vy;
			}
			
		}

		function fl_AccelerometerUpdateHandler(event:AccelerometerEvent):void
		{
			vx -= event.accelerationX*accX -friction;
			vy += event.accelerationY*accY -friction;
			
			if(vx >= maxSpeed)
				vx = maxSpeed
			else if(vx <= -1*maxSpeed)
				vx = -1*maxSpeed
			if(vy >= maxSpeed)
				vy = maxSpeed
			else if(vy <= -1*maxSpeed)
				vy = -1*maxSpeed
			
			
			x += vx;
			y += vy;
			
			//ship dynamics
			rotation = vx;
			scaleX = (maxSpeed - Math.abs(vx))/(maxSpeed*4) + 0.75;
			scaleY = (maxSpeed - Math.abs(vy))/(maxSpeed*6) + 0.75;
			
			// restrict ship
			if(x>stage.stageWidth){
				x = stage.stageWidth - this.width/2;
				vx = -vx;
			}
			else if(x<0){
				x = this.width/2;
				vx = -vx;
			}
			if(y>stage.stageHeight){
				y = stage.stageHeight - this.height/2;
				vy = -vy;
			}
			else if(y<0){
				y = this.height/2;
				vy = -vy;
			}
			
		}

		public function fireBullet(){
			if(canFire){
				stageRef.addChild(new Bullet(stageRef,x+vx,y-18));
				canFire=false;
				fireTimer.start();
			}
		}
		
		public function timerEventHandler(e:TimerEvent){
			canFire = true;
		}
		
		public function takeHit(){
			dispatchEvent(new Event("hit"));
		}

	}
	
}
