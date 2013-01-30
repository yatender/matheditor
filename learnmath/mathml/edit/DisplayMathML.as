
class learnmath.mathml.edit.DisplayMathML{
	
	var listOfXml:Array;
	var line:Number = 0;
	
	
	
	public function DisplayMathML(_listOfXml:Array){
		listOfXml = _listOfXml;
	}
	
	public function getText():String{
		//var s = "<span style=\'display:none;\'>";
		var s="";
		for(var i=0; i<listOfXml.length; i++){
			var _xmlML = listOfXml[i];
			s = s + addChildren(_xmlML.childNodes, 0);
		}
		//s=s+"</span>";
		return s;
	}

	public function getLine():Number{
		line = 0;
		for(var i=0; i<listOfXml.length; i++){
			var _xmlML = listOfXml[i];
			var found = countLineChildren(_xmlML.childNodes);
			if(found){break;}
		}
		return line+1;
	}

	
	function countLineChildren(children:Array):Boolean{
		if(children==null){
			return false;
		}
		
		for(var i=0; i<children.length; i++){
			if(children[i].attributes["selected"]){
				return true;
			}

			if(children[i].nodeName!=null){
				line = line + 1;
				var r = countLineChildren(children[i].childNodes);
				if(r) return true;
				line = line + 1;
			}else{
				line = line + 1;
			}
		}
		return false;
	}
	
	
	function addChildren(children:Array, tabs:Number):String{
		if(children==null){
			return "";
		}
		
		var classTag = "n";
		var s = "";
		for(var i=0; i<children.length; i++){
			if(children[i].attributes["selected"]){
				classTag = "s";
			}else{
				classTag = "n";
			}
			if(children[i].nodeName!=null){
				if(children[i].nodeName=="mo" | children[i].nodeName=="mtext"){
					s = s + insertTabs(tabs) + "<"+ children[i].nodeName;
					s = s + insertAttributes(children[i]);
					s = s + ">";
					s = s + addChildren(children[i].childNodes, tabs+1);
					s = s + "</"+ children[i].nodeName + ">";
				}else{
					s = s + insertTabs(tabs) + "<"+ children[i].nodeName;
					s = s + insertAttributes(children[i]);
					s = s + ">";
					s = s + addChildren(children[i].childNodes, tabs+1);
					s = s + insertTabs(tabs) + "</"+ children[i].nodeName + ">";
				}
			}else{
				if(children[i].parentNode.nodeName=="mo" | children[i].parentNode.nodeName=="mtext"){
					s = s + "" + formatToHtml(children[i].nodeValue) + "";
				}else{
					s = s + insertTabs(tabs+1) + "" + formatToHtml(children[i].nodeValue) + "";
				}
			}
		}
		return s;
	}
	
	function insertAttributes(node:XMLNode):String{
		var s = " ";
		var i:String;
		for (i in node.attributes) {
			if(i=="box") continue;
			if(i=="manager") continue;
			if(i=="selected") continue;
			if(i=="over") continue;
			if(node.attributes[i]==null) continue;
			
			s = s + i+ "='" + node.attributes[i] + "' ";
		}
		if(s.length==1){
			return "";
		}
		return s;
	}
	
	function formatToHtml(text:String):String{
		var newText ="";
		for(var i=0; i<text.length; i++){
			var c = text.charAt(i);
			if(c=="<"){
				newText = newText + "<";
			}else if(c==">"){
				newText = newText + ">";
			}else{
				newText = newText + c;
			}
		}
		return newText;
	}
	
	function insertTabs(tabs:Number):String{
		var s = "";
		for(var i=0; i<tabs; i++){
			s = s+ "    ";
		}
		return s;
	}
}