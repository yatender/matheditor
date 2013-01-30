/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.edit.operators.*;
import learnmath.mathml.*;


class learnmath.mathml.edit.operators.OperatorManager{
	
	static public function getOperator(operator:Number):Operator{
		if(operator>=Constant.DIVISION_01 & operator<=Constant.DIVISION_02){
			return new DivisionOperator(operator);
		}else if(operator==Constant.LIMIT_1){
			return new LimitOperator(operator);			
		}else if(operator>=Constant.FENCE_01 & operator<=Constant.FENCE_29){
			return new FenceOperator(operator);
		}else if(operator>=Constant.RADICAL_01 & operator<=Constant.RADICAL_02){
			return new RadicalOperator(operator);
		}else if(operator>=Constant.EXPONENT_01 & operator<=Constant.EXPONENT_06){
			return new ExponentOperator(operator);
		}else if(operator>=Constant.SUM_01 & operator<=Constant.SUM_15){
			return new SumOperator(operator);
		}else if(operator>=Constant.INT_01 & operator<=Constant.INT_35){
			return new IntegralOperator(operator);
		}else if(operator>=Constant.ACC_01 & operator<=Constant.ACC_37){
			return new AccentOperator(operator);
		}else if(operator>=Constant.SIGN_01 & operator<=Constant.SIGN_17){
			return new SignOperator(operator);
		}else if(operator>=Constant.EQ_01 & operator<=Constant.EQ_25){
			return new EqOperator(operator);
		}else if(operator>=Constant.MX_01 & operator<=Constant.MX_09){
			return new MatrixOperator(operator);
		}
		return null; 
	}
	
	static public function callInsertOperatorToText(operator:Number, xml:XML, node:XMLNode, leftString:String):XMLNode{
		var o:Operator = getOperator(operator);
		if(o!=null){
			return o.addOperatorToText(xml, node, leftString);
		}
		return null;
	}

	static public function replaceMRow(operator:Number, xml:XML, node:XMLNode, leftString:String):XMLNode{
		var o:Operator = getOperator(operator);
		if(o!=null){
			return o.replaceMRow(xml, node);
		}
		return null;
	}

	static public function replaceMOver(operator:Number, xml:XML, node:XMLNode, leftString:String):XMLNode{
		var o:Operator = getOperator(operator);
		if(o!=null){return o.replaceMOver(xml, node);}
		return null;
	}

	static public function replaceMUnder(operator:Number, xml:XML, node:XMLNode, leftString:String):XMLNode{
		var o:Operator = getOperator(operator);
		if(o!=null){return o.replaceMUnder(xml, node);}
		return null;
	}

	static public function replaceMSup(operator:Number, xml:XML, node:XMLNode, leftString:String):XMLNode{
		var o:Operator = getOperator(operator);
		if(o!=null){return o.replaceMSup(xml, node);}
		return null;
	}

	public static function splitTextNode(xml:XML, node:XMLNode, leftString:String){
		if(node.nodeName=="mtext"){
			var parentOfMtext = node.parentNode;
			parentOfMtext = insertRowNode(xml, node, parentOfMtext);
			
			
			var text = node.childNodes[0].nodeValue;
			if(!(leftString==null | text.length==leftString.length | leftString.length==0)){
				node.childNodes[0].nodeValue = leftString;
				node.childNodes[0].attributes["manager"] = null;
				
				var mtext2:XMLNode = xml.createElement("mtext");
				var tNode2:XMLNode = xml.createTextNode(text.substring(leftString.length));
				mtext2.appendChild(tNode2);
				insertSiblingNode(xml, node, mtext2);
			}
		}
		
	}

	public static function addNewSiblingTextChild(xml:XML, node:XMLNode):XMLNode{
		if(node.nodeName=="mtext"){
			var parentOfMtext = node.parentNode;
			parentOfMtext = insertRowNode(xml, node, parentOfMtext);
			
			var mtext2:XMLNode = xml.createElement("mtext");
			var tNode2:XMLNode = xml.createTextNode("...");
			mtext2.appendChild(tNode2);
			insertSiblingNode(xml, node, mtext2);
			return tNode2;
		}
		return null;
	}

	public static function insertRowNode(xml:XML, node:XMLNode, parentOfMtext:XMLNode):XMLNode{
		if(parentOfMtext.nodeName=="mrow" | parentOfMtext.nodeName=="mfenced" | parentOfMtext.nodeName=="msqrt"){
			return parentOfMtext;
		}
		var mrow:XMLNode = xml.createElement("mrow");
		parentOfMtext.insertBefore(mrow, node);
		mrow.appendChild(node);
		
		return node.parentNode;
	}

	public static function insertEndNode(xml:XML, node:XMLNode):XMLNode{
		var mtext2:XMLNode = xml.createElement("mtext");
		var tNode2:XMLNode = xml.createTextNode("...");
		mtext2.appendChild(tNode2);
		
		var parentOfMtext = node.parentNode;
		var next:XMLNode = node.nextSibling;
		if(next==null){
			parentOfMtext.appendChild(mtext2);
		}else{
			parentOfMtext.insertBefore(mtext2, next);
		}
		return tNode2;
	}
	

	public static function insertSiblingNode(xml:XML, node:XMLNode, nextNode:XMLNode){
		var parentOfMtext = node.parentNode;
		var next:XMLNode = node.nextSibling;
		if(next!=null){
			parentOfMtext.insertBefore(nextNode, next);
		}else{
			parentOfMtext.appendChild(nextNode);
		}
	}
	
	public static function changeToMRowNode(xml:XML, node:XMLNode):XMLNode{
		var parentOfMtext = node.parentNode;
		var mrow:XMLNode = xml.createElement("mrow");

		if(node.attributes["fontsize"]!=null){
			mrow.attributes["fontsize"] = node.attributes["fontsize"];
		}
		parentOfMtext.insertBefore(mrow, node);

		while(node.hasChildNodes()){
			mrow.appendChild(node.childNodes[0]);
		}

		node.removeNode();
		return mrow;

	}
}