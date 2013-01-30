/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.edit.operators.*;
import learnmath.mathml.*;

class learnmath.mathml.edit.operators.AccentOperator implements Operator{

	var _operator:Number;

	public function AccentOperator(operator:Number){
		_operator = operator;
	}
	
	public function addOperatorToText(xml:XML, node:XMLNode, leftString:String):XMLNode{
		// this need to be a mtext node
		if(node.nodeName=="mtext"){
			var parentOfMtext = node.parentNode;
			OperatorManager.splitTextNode(xml, node, leftString);
			return addInSign(xml, node, getSign(_operator), getParentType(_operator));
		}
	}
	
	
	public function addInSign(xml:XML, node:XMLNode, intSign:String, type:String):XMLNode{
		// this need to be a mtext node
		if(type=="mover" | type=="msup" | type=="munder"){
			var munder:XMLNode = xml.createElement(type);
			var o:XMLNode = xml.createElement("mtext");
			var tNode1:XMLNode = xml.createTextNode("...");
			o.appendChild(tNode1);
			munder.appendChild(o);
			
			var mtext2:XMLNode = xml.createElement("mo");
			var tNode2:XMLNode = xml.createTextNode(intSign);
			mtext2.appendChild(tNode2);
			munder.appendChild(mtext2);
			
			OperatorManager.insertSiblingNode(xml, node, munder);
			OperatorManager.insertEndNode(xml, munder);
			
			return tNode1;
		}
	}

	public function replaceMRow(xml:XML, node:XMLNode):XMLNode{
		return null;
	}

	public function replaceMOver(xml:XML, node:XMLNode):XMLNode{
		if(getParentType(_operator)=="mover"){
			var mtext2:XMLNode = xml.createElement("mo");
			var tNode2:XMLNode = xml.createTextNode(getSign(_operator));
			mtext2.appendChild(tNode2);
			
			node.childNodes[1].removeNode();
			node.appendChild(mtext2);
			return node;
		}
		return null;
	}	
	public function replaceMUnder(xml:XML, node:XMLNode):XMLNode{
		if(getParentType(_operator)=="munder"){
			var mtext2:XMLNode = xml.createElement("mo");
			var tNode2:XMLNode = xml.createTextNode(getSign(_operator));
			mtext2.appendChild(tNode2);
			
			node.childNodes[1].removeNode();
			node.appendChild(mtext2);
			return node;
		}
		return null;
	}	
	public function replaceMSup(xml:XML, node:XMLNode):XMLNode{
		if(getParentType(_operator)=="msup"){
			var mtext2:XMLNode = xml.createElement("mo");
			var tNode2:XMLNode = xml.createTextNode(getSign(_operator));
			mtext2.appendChild(tNode2);
			
			node.childNodes[1].removeNode();
			node.appendChild(mtext2);
			return node;
		}
		return null;
	}
	
	
	private function getSign(_operator:Number):String{
		if(_operator==Constant.ACC_01){
			return "&prime;";
		}else if(_operator==Constant.ACC_02){
			return "&Prime;";
		}else if(_operator==Constant.ACC_03){
			return "&tprime;";
		}else if(_operator==Constant.ACC_04){
			return "&dot;";
		}else if(_operator==Constant.ACC_05){
			return "&ddot;";
		}else if(_operator==Constant.ACC_06){
			return "&tdot;";
		}else if(_operator==Constant.ACC_07){
			return "&OverBar;";
		}else if(_operator==Constant.ACC_08){
			return "&hat;";
		}else if(_operator==Constant.ACC_09){
			return "&tilde;";
		}else if(_operator==Constant.ACC_10){
			return "&rarr;";
		}else if(_operator==Constant.ACC_11){
			return "&larr;";
		}else if(_operator==Constant.ACC_12){
			return "&harr;";
		}else if(_operator==Constant.ACC_13){
			return "&rharu;";
		}else if(_operator==Constant.ACC_14){
			return "&lharu;";
		}else if(_operator==Constant.ACC_15){
			return "&frown;";
		}else if(_operator==Constant.ACC_16){
			return "&smile;";
		}else if(_operator==Constant.ACC_17){
			return "&OverBrace;";
		}else if(_operator==Constant.ACC_18){
			return "&OverBracket;";
		}else if(_operator==Constant.ACC_30){
			return "&UnderBar;";
		}else if(_operator==Constant.ACC_32){
			return "&rarr;";
		}else if(_operator==Constant.ACC_33){
			return "&larr;";
		}else if(_operator==Constant.ACC_34){
			return "&harr;";
		}else if(_operator==Constant.ACC_35){
			return "&UnderParenthesis;";
		}else if(_operator==Constant.ACC_36){
			return "&UnderBrace;";
		}else if(_operator==Constant.ACC_37){
			return "&UnderBracket;";
		}
	}

	private function getParentType(_operator:Number):String{
		if(_operator>=Constant.ACC_01 & _operator<=Constant.ACC_03){
			return "msup";
		}else if(_operator>=Constant.ACC_04 & _operator<=Constant.ACC_18){
			return "mover";
		}else if(_operator>=Constant.ACC_30 & _operator<=Constant.ACC_37){
			return "munder";
		}
	}
}