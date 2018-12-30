package {
	import flash.display.MovieClip;
	public class Engine extends MovieClip{
		var A:Array;
		
		public function Engine(){
			// constructor code
			A = new Array();
			var i:Number;
			
			for(i=0;i<3;i++){
				var c:Car = new Car();
				c.x = i*120;
				c.y = 0;
				c.alpha = i/3.0;
				A.push(c);
			}
			for(i=0;i<A.length;i++){
				stage.addChild(A[i]);
			}
			for(i=0;i<A.length;i++){
				A[i].x += 5;
			}
		}

	}
	
}
