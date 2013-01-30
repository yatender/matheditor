/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.edit.*
import learnmath.mathml.formula.*;

class learnmath.mathml.edit.input.MouseManager{

	var selectBox:SelectBox;
	var xmlML:XML;
	var overText:XMLNode;
	
	
	public function MouseManager(_selectBox:SelectBox, _xmlML:XML){
		selectBox = _selectBox;
		xmlML = _xmlML;
	}

	public function moveCursor(graph:MovieClip, x:Number, y:Number):Boolean{
		//trace("moveCursor " + x + " " + y);
		x = x-graph._x;
		y = y-graph._y;
		var node = findOverText(graph, x, y);
		if(node!=null){
			if(node!=overText){
				if(overText!=null){
					overText.attributes["over"] = null;
				}
				overText = node;
				overText.attributes["over"] = "T";
				return true;
			}
		}else{
			if(overText!=null){
				overText.attributes["over"] = null;
				overText = null;
				return true;
			}
		}
		return false;
	}
	public function clickEvent(graph:MovieClip, x:Number, y:Number):Boolean{
		if(overText!=null){
			selectBox.init(overText);
			return true;
		}
		return false;
	}

	function findOverText(graph:MovieClip, x:Number, y:Number):XMLNode{
		return findRectanglesRecursiv(xmlML.childNodes, x, y);
	}

	public function findRectanglesRecursiv(children:Array, x:Number, y:Number):XMLNode{
		if(children==null){
			return null;
		}
		for(var i=0; i<children.length; i++){
			if(children[i].nodeName=='mtext' | children[i].nodeName=='mo'){
				var box:Box = children[i].attributes["box"];
				
				if(box.finalBounds.x<=x & (box.finalBounds.x+box.finalBounds.width)>=x &
					box.finalBounds.y<=y & (box.finalBounds.y+box.finalBounds.height)>=y){
					return children[i];
				}
			}
			var node = findRectanglesRecursiv(children[i].childNodes, x, y);
			if(node!=null){				
				return node;
			}
		}
		return null;
	}
	
}