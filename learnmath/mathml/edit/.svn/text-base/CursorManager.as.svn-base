/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.geom.*;
import learnmath.mathml.formula.*;
import learnmath.mathml.edit.*;

/*
*	Keep information about how to move the cursor for a box;
*/

class learnmath.mathml.edit.CursorManager{
	
	static var times:Number = 3;
	static var currentTime:Number = 0;
	static var displayedCursor:Boolean = false;
	static var displayedBox:Boolean = false;
	static var backGround:Number = 0xD2D5DC;
	static var lastX;
	static var lastY;
	static var lastH;
	
	var textNode:XMLNode;
	var leftString:String;
	
	
	public function CursorManager(_textNode:XMLNode){
		textNode = _textNode;
		leftString = textNode.childNodes[0].nodeValue;
	}
	
	public function getIndex(){
		return leftString.length;
	}
	
	public function drawCursor(graph:MovieClip){
		var box:Box = textNode.attributes["box"];
		var leftWidth = FontConstant.getWidth(box.style, leftString);

		var x = box.finalBounds.x + leftWidth;
		var y = box.finalBounds.y;
		var h = box.finalBounds.height;
		
		if((!displayedCursor) & currentTime==0){
			graph.lineStyle(2, 0x000000, 100);
			graph.moveTo(x-1, y);
			graph.lineTo(x-1 , y + h);
			displayedCursor = true;
			lastX = x;
			lastY = y;
			lastH = h;
		}else if(displayedCursor & currentTime==0){
			graph.lineStyle(2, backGround, 100);
			graph.moveTo(lastX-1, lastY);
			graph.lineTo(lastX-1 , lastY + lastH);
			displayedCursor = false;
		}

		currentTime++;
		
		if(currentTime>times){
			currentTime = 0;
		}
	}

	public function drawBoxCursor(graph:MovieClip){
		var box:Box = textNode.attributes["box"];
		if((!displayedBox) & currentTime==0){
			graph.lineStyle(2, 0x000000, 100);
			DrawRectangle.draw2(graph, box.finalBounds.x, box.finalBounds.y, box.finalBounds.x+ box.finalBounds.width, box.finalBounds.y+box.finalBounds.height);
			displayedBox = true;
		}else if(displayedBox & currentTime==0){
			graph.lineStyle(2, backGround, 100);
			DrawRectangle.draw2(graph, box.finalBounds.x, box.finalBounds.y, box.finalBounds.x+ box.finalBounds.width, box.finalBounds.y+box.finalBounds.height);
			displayedBox = false;
		}

		currentTime++;
		
		if(currentTime>times){
			currentTime = 0;
		}
	}


	public function clearCursor(graph:MovieClip){
		if(displayedCursor){
			graph.lineStyle(2, backGround, 100);
			graph.moveTo(lastX-1, lastY);
			graph.lineTo(lastX-1 , lastY + lastH);
			displayedCursor = false;
		}
		if(displayedBox){
			var box:Box = textNode.attributes["box"];
			graph.lineStyle(2, backGround, 100);
			DrawRectangle.draw2(graph, box.finalBounds.x, box.finalBounds.y, box.finalBounds.x+ box.finalBounds.width, box.finalBounds.y+box.finalBounds.height);
			displayedBox = false;
		}

	}

}