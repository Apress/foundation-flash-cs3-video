package {
	
	// ***********************************************************
	// Import required classes
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	// ***********************************************************
	// Define class and extend the MovieClip class
	//
	// Extending a class means that the TetrisShape is a type of
	// MovieClip and hence it takes on ALL MovieClip properties.
	public class TetrisShape extends MovieClip{
		
		// ***********************************************************
		// Define variables
		private var shapeMovie:MovieClip;
		private var shapeNumber:Number;
		private var shapeSpeed:Number;
		private var shapeRotation:Number;
		
		// ***********************************************************
		// Define TetrisShape function
		//
		// All classes shoudl have a funciton with the same name as
		// the class. This function is automatically executed when 
		// this class is used.
		public function TetrisShape() {
			
			// ***********************************************************
			// Set a random shape
			shapeNumber = Math.floor(Math.random() * 4);
			
			// ***********************************************************
			// Default rotation to zero
			shapeRotation;
			
			// ***********************************************************
			// Create a MovieClip to draw the shape in
			shapeMovie = new MovieClip();
			
			// ***********************************************************
			// Draw shape
			shapeMovie.graphics.beginFill(0x000000);
			
			switch(shapeNumber){
				case 0:
					shapeMovie.graphics.drawRect(-20,-20,40,40);
					break;
				case 1:
					shapeMovie.graphics.drawRect(-10,-40,20,80);
					break;
				case 2:
					shapeMovie.graphics.moveTo(-30,-20);
					shapeMovie.graphics.lineTo(-10,-20);
					shapeMovie.graphics.lineTo(-10,00);
					shapeMovie.graphics.lineTo(30,00);
					shapeMovie.graphics.lineTo(30,20);
					shapeMovie.graphics.lineTo(-30,20);
					shapeMovie.graphics.lineTo(-30,-20);
					break;
				case 3:
					shapeMovie.graphics.moveTo(-10,-30);
					shapeMovie.graphics.lineTo(10,-30);
					shapeMovie.graphics.lineTo(10,-10);
					shapeMovie.graphics.lineTo(30,-10);
					shapeMovie.graphics.lineTo(30,10);
					shapeMovie.graphics.lineTo(10,10);
					shapeMovie.graphics.lineTo(10,30);
					shapeMovie.graphics.lineTo(-10,30);
					shapeMovie.graphics.lineTo(-10,10);
					shapeMovie.graphics.lineTo(-30,10);
					shapeMovie.graphics.lineTo(-30,-10);
					shapeMovie.graphics.lineTo(-10,-10);
					break;
			}
			
			shapeMovie.graphics.endFill();
			
			addChild(shapeMovie);
			
			// ***********************************************************
			// Set the shape properties
			resetShape();
			
			// ***********************************************************
			// Start the animation
			startAnimation();
		}
		
		// ***********************************************************
		// This funciton is executed every 20 milliseconds and moves 
		// the shape as well as checks for when the shape leaves the
		// stage.
		private function shapeStep(timeEvent:TimerEvent):void {
			x += shapeSpeed;
			rotation += shapeRotation;
			if (x > 320) resetShape();
		}
		
		// ***********************************************************
		// This fucntion startes the animation timer
		private function startAnimation():void {
			var moveTimer:Timer = new Timer(20);
			moveTimer.addEventListener(TimerEvent.TIMER,shapeStep);
			moveTimer.start();
		}
		
		// ***********************************************************
		// This function resets the shape once it leaves the stage.
		private function resetShape():void {
			shapeSpeed = Math.random() * 5;
			x = -width;
			y = Math.random() * 240;
		}
		
		// ***********************************************************
		// This function is an optional addition that will set a
		// rotation
		public function setRotation(newRotation:Number):void {
			shapeRotation = newRotation;
		}
		
	}
}