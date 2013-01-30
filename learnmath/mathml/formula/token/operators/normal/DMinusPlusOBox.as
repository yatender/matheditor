/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.token.*;
import learnmath.mathml.formula.script.*;
import flash.geom.*;

class learnmath.mathml.formula.token.operators.normal.DMinusPlusOBox extends OBox{

	var k:Number = 4/100;
	var wl:Number = 1;

	public function	DMinusPlusOBox(parentBox:Box){
		super(parentBox);
	}

	
	public function calculate(){
		DrawFormula.calculateText(finalBounds, text, style);
		var h1 = FontConstant.getHeight(style, "X");
		var w1 = FontConstant.getWidth(style, "X");
		
		finalBounds.width=w1*0.7;
		finalBounds.height=h1;
		finalBounds.y = finalBounds.y - h1/2
	}
	
	public function copyParentStyle(_styleParent:Style){
		super.copyParentStyle(_styleParent);
	}
	
	public function draw(graph:MovieClip){
		graph.lineStyle(finalBounds.height*k, getHexColor(), 100);
		
		graph.moveTo(finalBounds.x+wl, finalBounds.y + finalBounds.height*0.3);
		graph.lineTo(finalBounds.x+finalBounds.width-wl, finalBounds.y + finalBounds.height*0.3);

		graph.moveTo(finalBounds.x+wl, finalBounds.y + finalBounds.height*0.5);
		graph.lineTo(finalBounds.x+finalBounds.width-wl, finalBounds.y + finalBounds.height*0.5);

		graph.moveTo(finalBounds.x+finalBounds.width/2, finalBounds.y + finalBounds.height*0.3);
		graph.lineTo(finalBounds.x+finalBounds.width/2, finalBounds.y + finalBounds.height*0.7);
		
	}
	
	public function toString():String{
		return "DMinusPlusOBox";
	}
	
}