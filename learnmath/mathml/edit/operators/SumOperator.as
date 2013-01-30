/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.edit.operators.*;
import learnmath.mathml.*;

class learnmath.mathml.edit.operators.SumOperator implements Operator{

	var _operator:Number;

	public function SumOperator(operator:Number){
		_operator = operator;
	}
	
	//<munderover>\n\t\t<mo>&sum;</mo>\n\t\t<mrow>\n\t\t\t<mi>x</mi>\n\t\t\t<mo>=</mo>\n\t\t\t<mn>0</mn>\n\t\t</mrow>\n\t\t<mn>56</mn>\n\t</munderover>\n\t<msup>\n\t\t<mi>x</mi>\n\t\t<mn>2</mn>\n\t</msup>\n\t";

	public function addOperatorToText(xml:XML, node:XMLNode, leftString:String):XMLNode{
		// this need to be a mtext node
		if(node.nodeName=="mtext"){
			var parentOfMtext = node.parentNode;

			OperatorManager.splitTextNode(xml, node, leftString);
			if(_operator==Constant.SUM_01){
				return addInSign(xml, node, "&sum;", "mo");
			}else if(_operator==Constant.SUM_03){
				return addInSign(xml, node, "&sum;", "munderover");
			}else if(_operator==Constant.SUM_04){
				return addInSign(xml, node, "&prod;", "mo");
			}else if(_operator==Constant.SUM_05){
				return addInSign(xml, node, "&prod;", "munderover");
			}else if(_operator==Constant.SUM_06){
				return addInSign(xml, node, "&prod;", "msubsup");
			}else if(_operator==Constant.SUM_07){
				return addInSign(xml, node, "&coprod;", "mo");
			}else if(_operator==Constant.SUM_08){
				return addInSign(xml, node, "&coprod;", "munderover");
			}else if(_operator==Constant.SUM_09){
				return addInSign(xml, node, "&coprod;", "msubsup");
			}else if(_operator==Constant.SUM_10){
				return addInSign(xml, node, "&Intersection;", "mo");
			}else if(_operator==Constant.SUM_11){
				return addInSign(xml, node, "&Intersection;", "munderover");
			}else if(_operator==Constant.SUM_12){
				return addInSign(xml, node, "&Intersection;", "msubsup");
			}else if(_operator==Constant.SUM_13){
				return addInSign(xml, node, "&Union;", "mo");
			}else if(_operator==Constant.SUM_14){
				return addInSign(xml, node, "&Union;", "munderover");
			}else if(_operator==Constant.SUM_15){
				return addInSign(xml, node, "&Union;", "msubsup");			
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