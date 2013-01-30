/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.edit.operators.*;
import learnmath.mathml.*;

class learnmath.mathml.edit.operators.IntegralOperator implements Operator{

	var _operator:Number;

	public function IntegralOperator(operator:Number){
		_operator = operator;
	}
	
	public function addOperatorToText(xml:XML, node:XMLNode, leftString:String):XMLNode{
		// this need to be a mtext node
		if(node.nodeName=="mtext"){
			var parentOfMtext = node.parentNode;

			OperatorManager.splitTextNode(xml, node, leftString);
			
			if(_operator==Constant.INT_01){
				return addInSign(xml, node, "&int;", "mo");
			}else if(_operator==Constant.INT_02){
				return addInSign(xml, node, "&int;", "munderover");
			}else if(_operator==Constant.INT_03){
				return addInSign(xml, node, "&int;", "msubsup");
			}else if(_operator==Constant.INT_04){
				return addInSign(xml, node, "&int;", "munder");
			}else if(_operator==Constant.INT_05){
				return addInSign(xml, node, "&int;", "msub");
			}else if(_operator==Constant.INT_06){
				return addInSign(xml, node, "&Int;", "mo");
			}else if(_operator==Constant.INT_07){
				return addInSign(xml, node, "&Int;", "munder");
			}else if(_operator==Constant.INT_08){
				return addInSign(xml, node, "&Int;", "msub");
			}else if(_operator==Constant.INT_09){
				return addInSign(xml, node, "&tint;", "mo");
			}else if(_operator==Constant.INT_10){
				return addInSign(xml, node, "&tint;", "munder");
			}else if(_operator==Constant.INT_11){
				return addInSign(xml, node, "&tint;", "msub");
			}else if(_operator==Constant.INT_12){
				return addInSign(xml, node, "&oint;", "mo");
			}else if(_operator==Constant.INT_13){
				return addInSign(xml, node, "&oint;", "munder");
			}else if(_operator==Constant.INT_14){
				return addInSign(xml, node, "&oint;", "msub");
			}else if(_operator==Constant.INT_15){
				return addInSign(xml, node, "&Conint;", "mo");
			}else if(_operator==Constant.INT_16){
				return addInSign(xml, node, "&Conint;", "munder");
			}else if(_operator==Constant.INT_17){
				return addInSign(xml, node, "&Conint;", "msub");
			}else if(_operator==Constant.INT_18){
				return addInSign(xml, node, "&Cconint;", "mo");
			}else if(_operator==Constant.INT_19){
				return addInSign(xml, node, "&Cconint;", "munder");
			}else if(_operator==Constant.INT_20){
				return addInSign(xml, node, "&Cconint;", "msub");
			}else if(_operator==Constant.INT_21){
				return addInSign(xml, node, "&cwconint;", "mo");
			}else if(_operator==Constant.INT_22){
				return addInSign(xml, node, "&cwconint;", "munderover");
			}else if(_operator==Constant.INT_23){
				return addInSign(xml, node, "&cwconint;", "msubsup");
			}else if(_operator==Constant.INT_24){
				return addInSign(xml, node, "&awconint;", "mo");
			}else if(_operator==Constant.INT_25){
				return addInSign(xml, node, "&awconint;", "munderover");
			}else if(_operator==Constant.INT_26){
				return addInSign(xml, node, "&awconint;", "msubsup");
			}else if(_operator==Constant.INT_27){
				return addInSign(xml, node, "&cwint;", "mo");
			}else if(_operator==Constant.INT_28){
				return addInSign(xml, node, "&cwint;", "munderover");
			}else if(_operator==Constant.INT_29){
				return addInSign(xml, node, "&cwint;", "msubsup");
			}else if(_operator==Constant.INT_30){
				return addInSign(xml, node, "&awint;", "mo");
			}else if(_operator==Constant.INT_31){
				return addInSign(xml, node, "&awint;", "munderover");
			}else if(_operator==Constant.INT_32){
				return addInSign(xml, node, "&awint;", "msubsup");
			}else if(_operator==Constant.INT_33){
				return addInSign(xml, node, "&fpartint;", "mo");
			}else if(_operator==Constant.INT_34){
				return addInSign(xml, node, "&fpartint;", "munderover");
			}else if(_operator==Constant.INT_35){
				return addInSign(xml, node, "&fpartint;", "msubsup");
			}

			
		}
	}
	
	
	public function addInSign(xml:XML, node:XMLNode, intSign:String, type:String):XMLNode{
		// this need to be a mtext node
		if(type=="mo"){
			var mo:XMLNode = xml.createElement("mo");
			var tNode2:XMLNode = xml.createTextNode(intSign);
			mo.appendChild(tNode2);
			OperatorManager.insertSiblingNode(xml, node, mo);
			var newnode = OperatorManager.insertEndNode(xml, mo);
			
			return newnode;
		}else if(type=="munder"){
			var munder:XMLNode = xml.createElement("munder");
			var o:XMLNode = xml.createElement("mo");
			var tNode1:XMLNode = xml.createTextNode(intSign);
			o.appendChild(tNode1);
			munder.appendChild(o);
			
			var mtext2:XMLNode = xml.createElement("mtext");
			var tNode2:XMLNode = xml.createTextNode("...");
			mtext2.appendChild(tNode2);
			munder.appendChild(mtext2);
			
			OperatorManager.insertSiblingNode(xml, node, munder);
			var newnode = OperatorManager.insertEndNode(xml, munder);
			
			return newnode;
			
		}else if(type=="munderover"){
			var munderover:XMLNode = xml.createElement("munderover");
			var o:XMLNode = xml.createElement("mo");
			var tNode1:XMLNode = xml.createTextNode(intSign);
			o.appendChild(tNode1);
			munderover.appendChild(o);
			
			var mtext2:XMLNode = xml.createElement("mtext");
			var tNode2:XMLNode = xml.createTextNode("...");
			mtext2.appendChild(tNode2);
			munderover.appendChild(mtext2);
			
			var mtext3:XMLNode = xml.createElement("mtext");
			var tNode3:XMLNode = xml.createTextNode("...");
			mtext3.appendChild(tNode3);
			munderover.appendChild(mtext3);
			
			OperatorManager.insertSiblingNode(xml, node, munderover);
			var newnode = OperatorManager.insertEndNode(xml, munderover);
			
			return newnode;
		}else if(type=="msub"){
			var munder:XMLNode = xml.createElement("msub");
			var o:XMLNode = xml.createElement("mo");
			var tNode1:XMLNode = xml.createTextNode(intSign);
			o.appendChild(tNode1);
			munder.appendChild(o);
			
			var mtext2:XMLNode = xml.createElement("mtext");
			var tNode2:XMLNode = xml.createTextNode("...");
			mtext2.appendChild(tNode2);
			munder.appendChild(mtext2);
			
			OperatorManager.insertSiblingNode(xml, node, munder);
			var newnode = OperatorManager.insertEndNode(xml, munder);
			
			return newnode;
			
		}else if(type=="msubsup"){
			var munderover:XMLNode = xml.createElement("msubsup");
			var o:XMLNode = xml.createElement("mo");
			var tNode1:XMLNode = xml.createTextNode(intSign);
			o.appendChild(tNode1);
			munderover.appendChild(o);
			
			var mtext2:XMLNode = xml.createElement("mtext");
			var tNode2:XMLNode = xml.createTextNode("...");
			mtext2.appendChild(tNode2);
			munderover.appendChild(mtext2);
			
			var mtext3:XMLNode = xml.createElement("mtext");
			var tNode3:XMLNode = xml.createTextNode("...");
			mtext3.appendChild(tNode3);
			munderover.appendChild(mtext3);
			
			OperatorManager.insertSiblingNode(xml, node, munderover);
			var newnode = OperatorManager.insertEndNode(xml, munderover);
			
			return newnode;
		}
	}

	public function replaceMRow(xml:XML, node:XMLNode):XMLNode{
		return null;
	}

	public function replaceMOver(xml:XML, node:XMLNode):XMLNode{return null;}	
	public function replaceMUnder(xml:XML, node:XMLNode):XMLNode{return null;}	
	public function replaceMSup(xml:XML, node:XMLNode):XMLNode{return null;}

}