﻿/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.geom.*;
import learnmath.mathml.formula.*;

class learnmath.mathml.formula.Box{
	
	var originPoint:Point;
	var finalBounds:Rectangle;
	var style:Style;
	
	var parentBox:Box;
	
	public function Box(_parentBox:Box){
		parentBox = _parentBox;
		finalBounds = new Rectangle();
		originPoint = new Point();
		style = new Style();
	}
	
	public function initBounds(_originPoint:Point){
		finalBounds.x = _originPoint.x;
		finalBounds.y = _originPoint.y;
		finalBounds.width = 0;
		finalBounds.height = 0;
		originPoint.x = _originPoint.x;
		originPoint.y = _originPoint.y;
	}

	public function calculateBox(_originPoint:Point){
		initBounds(_originPoint);
		calculate();
	}

	public function calculate(){
		trace("Box.calculate() !!!")
	}
	

	public function moveOriginTo(newOriginPoint:Point){
		finalBounds.x = newOriginPoint.x;
		finalBounds.y = finalBounds.y + (newOriginPoint.y - originPoint.y);

		originPoint.x = newOriginPoint.x;
		originPoint.y = newOriginPoint.y;
		moveMyChildren();
	}
	
	public function moveMyChildren(){
	}
	

	public function changeSizeFromParent(){
	}

	public function resizeFromParent(){
		//parent box must be msubsup
		// parent of msubsup can be only type RowBox and if the next child is greater take this  height.
		var p = parentBox.parentBox;
		var nextChild;
		for(var i:Number =0; i<p.children.length;i++){
			var child:Box = p.children[i];
			if(child==parentBox){
				nextChild = p.children[i+1];
				break;
			}
		}
		if(nextChild!=null){
			var dxs = parentBox.finalBounds.y - nextChild.finalBounds.y;
			var dxi = nextChild.finalBounds.y + nextChild.finalBounds.height - parentBox.finalBounds.y - parentBox.finalBounds.height;
			if(dxs>0 & dxi>0){
				var min = dxs;
				if(dxi<min){
					min = dxi;
				}
				
				min = 0.8*min;
				
				parentBox.finalBounds.y = parentBox.finalBounds.y - min;
				parentBox.finalBounds.height = parentBox.finalBounds.height + min*2;
				
				finalBounds.y = finalBounds.y - min;
				finalBounds.height = finalBounds.height + min*2;
				
				parentBox.moveMyChildren();
				
			}
		}
		
	}



	public function copyParentStyle(_styleParent:Style){
		if(this.style.font==null){
			this.style.font = _styleParent.font;
		}
		if(this.style.size==null){
			this.style.size = _styleParent.size;
		}
		if(this.style.color==null){
			this.style.color = _styleParent.color;
		}
		if(this.style.fontweight==null){
			this.style.fontweight = _styleParent.fontweight;
		}
		if(this.style.fontstyle==null){
			this.style.fontstyle = _styleParent.fontstyle;
		}
	}
	
	public function getHexColor():Number{
		return parseInt(style.color.substring(1), 16);
	}

	public function drawBox(graph:MovieClip){
		draw(graph);
		//DrawFormula.drawRectangle(graph, finalBounds);
	}

	public function draw(graph:MovieClip){

	}


	public function toString():String{
		return "Box";
	}

	public function getTinethickness(l:Number, kLine:Number):Number{
		var s:Number = 1;
		if(l==1){
			s = finalBounds.height * kLine;
		}
		if(s<1){
			s=1;
		}else if(s>4){
			s=4;
		}
		return s;
	}
	
//added for editor

	var selectionStart:Number =0;
	var selectionEnd:Number =0;

	public function drawText(graph:MovieClip, p:Point, text:String){
		if(selectionStart>text.length){
			selectionStart=text.length;
		}
		if(selectionStart<0){
			selectionStart=0;
		}
		if(selectionEnd>text.length){
			selectionEnd=text.length;
		}
		if(selectionEnd<0){
			selectionEnd=0;
		}
		if(selectionStart==selectionEnd){
			DrawFormula.createText(graph, p, text, style);
		}else if((selectionStart==0 & selectionEnd==text.length) | (selectionEnd==0 & selectionStart==text.length)){
			var newStyle = style.getCopy();
			newStyle.color = "#ff0000";
			DrawFormula.createText(graph, p, text, newStyle);
		}else if(selectionEnd<selectionStart){
			drawTextS(graph, text, selectionEnd, selectionStart, p)
		}else{
			drawTextS(graph, text, selectionStart, selectionEnd, p)
		}
	}
	
	function drawTextS(graph:MovieClip, text:String, startS:Number, endS:Number,  p:Point){
			var t = text.substring(0,startS);
			DrawFormula.createText(graph, p, t, style);
			var w1 = FontConstant.getWidth(style, t);

			t = text.substring(startS, endS);
			var newStyle = this.style.getCopy();
			newStyle.color = "#ff0000";
			var newP = new Point();
			newP.x = p.x + w1-4;
			newP.y = p.y;
			DrawFormula.createText(graph, newP, t, newStyle);
			var w2 = FontConstant.getWidth(style, t);

			newP.x = p.x + w1 + w2-8;
			newP.y = p.y;
			t = text.substring(endS);
			DrawFormula.createText(graph, newP, t, style);
	}
	
}