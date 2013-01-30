/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.edit.operators.*;
import learnmath.mathml.*;

class learnmath.mathml.edit.operators.SignOperator implements Operator{

	var _operator:Number;

	public function SignOperator(operator:Number){
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
		if(_operator==Constant.SIGN_01){
			return "-";
		}else if(_operator==Constant.SIGN_02){
			return "+";
		}else if(_operator==Constant.SIGN_03){
			return "&ast;";
		}else if(_operator==Constant.SIGN_04){
			return "&times;";
		}else if(_operator==Constant.SIGN_05){
			return "&divide;";
		}else if(_operator==Constant.SIGN_06){
			return "&centerdot;";
		}else if(_operator==Constant.SIGN_07){
			return "&plusmn;";
		}else if(_operator==Constant.SIGN_08){
			return "&mnplus;";
		}else if(_operator==Constant.SIGN_09){
			return "&CircleTimes;";
		}else if(_operator==Constant.SIGN_10){
			return "&CirclePlus;";
		}else if(_operator==Constant.SIGN_11){
			return "&CircleMinus;";
		}else if(_operator==Constant.SIGN_12){
			return "&CircleDot;";
		}else if(_operator==Constant.SIGN_13){
			return "&ratio;";
		}else if(_operator==Constant.SIGN_14){
			return "&Proportion;";
		}else if(_operator==Constant.SIGN_15){
			return "&mid;";
		}else if(_operator==Constant.SIGN_16){
			return "&parallel;";
		}else if(_operator==Constant.SIGN_17){
			return "&brvbar;";
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