/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.edit.operators.*;
import learnmath.mathml.*;

class learnmath.mathml.edit.operators.EqOperator implements Operator{

	var _operator:Number;

	public function EqOperator(operator:Number){
		_operator = operator;
	}
	
	public function addOperatorToText(xml:XML, node:XMLNode, leftString:String):XMLNode{
		// this need to be a mtext node
		if(node.nodeName=="mtext"){
			var parentOfMtext = node.parentNode;
			OperatorManager.splitTextNode(xml, node, leftString);
			return addInSign(xml, node, getSign(_operator));
		}
	}
	
	
	public function addInSign(xml:XML, node:XMLNode, intSign:String):XMLNode{
			var mtext2:XMLNode = xml.createElement("mo");
			var tNode2:XMLNode = xml.createTextNode(intSign);
			mtext2.appendChild(tNode2);
			
			OperatorManager.insertSiblingNode(xml, node, mtext2);
			var nextNode = OperatorManager.insertEndNode(xml, mtext2);
			return nextNode;
	}

	
	
	private function getSign(_operator:Number):String{
		if(_operator==Constant.EQ_01){
			return "<";
		}else if(_operator==Constant.EQ_02){
			return ">";
		}else if(_operator==Constant.EQ_03){
			return "&le;";
		}else if(_operator==Constant.EQ_04){
			return "&ge;";
		}else if(_operator==Constant.EQ_05){
			return "&equals;";
		}else if(_operator==Constant.EQ_06){
			return "&ne;";
		}else if(_operator==Constant.EQ_07){
			return "&equiv;";
		}else if(_operator==Constant.EQ_08){
			return "&sim;";
		}else if(_operator==Constant.EQ_09){
			return "&approx;";
		}else if(_operator==Constant.EQ_10){
			return "&bcong;";
		}else if(_operator==Constant.EQ_11){
			return "&efDot;";
		}else if(_operator==Constant.EQ_12){
			return "&Lt;";
		}else if(_operator==Constant.EQ_13){
			return "&Gt;";
		}else if(_operator==Constant.EQ_14){
			return "&NotGreaterGreater;";
		}else if(_operator==Constant.EQ_15){
			return "&NotLessLess;";
		}else if(_operator==Constant.EQ_16){
			return "&nless;";
		}else if(_operator==Constant.EQ_17){
			return "&ngtr;";
		}else if(_operator==Constant.EQ_18){
			return "&Ll;";
		}else if(_operator==Constant.EQ_19){
			return "&Gg;";
		}else if(_operator==Constant.EQ_20){
			return "&leqq;";
		}else if(_operator==Constant.EQ_21){
			return "&geqq;";
		}else if(_operator==Constant.EQ_22){
			return "&nleqq;";
		}else if(_operator==Constant.EQ_23){
			return "&ngeqq;";
		}else if(_operator==Constant.EQ_24){
			return "&nap;";
		}else if(_operator==Constant.EQ_25){
			return "&ncong;";						
		}
	}
	
	public function replaceMRow(xml:XML, node:XMLNode):XMLNode{
		return null;
	}
	
	public function replaceMOver(xml:XML, node:XMLNode):XMLNode{
		return null;
	}
	
	public function replaceMUnder(xml:XML, node:XMLNode):XMLNode{
		return null;
	}
		
	public function replaceMSup(xml:XML, node:XMLNode):XMLNode{
		return null;
	}
	

}