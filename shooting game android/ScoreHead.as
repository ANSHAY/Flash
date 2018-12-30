package  {
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	
	public class ScoreHead extends MovieClip {
		
		private var stageRef:Stage;
		public var nKills:Number=0;
		public var nHits:Number=0;
		public var nScore:Number=0;
		
		public function ScoreHead(stageRef:Stage) {
			this.stageRef=stageRef;
			
			kills.text = "0";
			hits.text = "0";
			score.text = "0";
			
			x=1;
			y=1;
			
			// constructor code
		}
		
		public function updateKills(val:Number){
			nKills += val;
			kills.text = String(nKills);
			//updateScore(val);
		}
		public function updateHits(val:Number){
			nHits += val;
			hits.text = String(nHits);
			updateScore(-10*val);
		}
		public function updateScore(val:Number){
			nScore += val;
			score.text = String(nScore);
		}
	}
	
}
