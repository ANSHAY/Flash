﻿package  {
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	
	public class Stinger extends MovieClip {
		
		private var stageRef:Stage;
		private var vy:Number=1;
		private var ay:Number=0.3;
		private var target:Ship;
		private var fireTimer:Timer;
		private var fireDelay:Number = 400;
		private var canFire:Boolean=true;
		
		public function Stinger(stageRef:Stage,ship:Ship) {
			this.stageRef=stageRef;
			this.target = ship;
			
			x = Math.random()*stageRef.stageWidth;
			y = -10;
			
			addEventListener(Event.ENTER_FRAME,loop,false,0,true);
			fireTimer = new Timer(fireDelay,1);
			fireTimer.addEventListener(TimerEvent.TIMER,fireTimerHandler,false,0,true);
			fireTimer.start();
			// constructor code
		}
		
		public function loop(e:Event){
			vy += ay;
			y += vy;
			
			if(y>stageRef.stageHeight){
				removeSelf();
			}
			if(y>target.y-15 && y<target.y+15){
				fireWeapon();
			}
			if(canFire){
				fireBullet();
			}
		}
		public function removeSelf(){
			removeEventListener(Event.ENTER_FRAME,loop);
			if(stage.contains(this)){
				stage.removeChild(this);
			}
		}
		
		public function fireWeapon(){
			stage.addChild(new StingerBullets(stageRef,x,y,10));
			stage.addChild(new StingerBullets(stageRef,x,y+10,10));
			stage.addChild(new StingerBullets(stageRef,x,y,-10));
			stage.addChild(new StingerBullets(stageRef,x,y+10,-10));			
		}
		
		public function fireBullet(){
			var sx=(target.x-x)/50;
			var sy=(target.y-y)/50;
			stage.addChild(new StingerBullets(stageRef,x,y+5,sx,sy));
			canFire = false;
			fireTimer.start();
		}
		
		public function fireTimerHandler(e:TimerEvent){
			canFire = true;
		}
	}
	
}
