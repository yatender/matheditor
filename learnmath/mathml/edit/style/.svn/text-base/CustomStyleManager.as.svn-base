/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;

class learnmath.mathml.edit.style.CustomStyleManager{
	
	public static function setDefaultForNode(node:XMLNode, style:Style){
			if(node.attributes["fontsize"]==null){
				node.attributes["fontsize"] = style.size;
			}
			if(node.attributes["color"]==null){
				node.attributes["color"] = style.color;
			}
			if(node.attributes["fontfamily"]==null){
				node.attributes["fontfamily"] = style.font;
			}
			if(node.attributes["fontweight"]==null){
				if(style.fontweight!=""){
					node.attributes["fontweight"] = style.fontweight;
				}
			}
			if(node.attributes["fontstyle"]==null){
				if(style.fontstyle!=""){
					node.attributes["fontstyle"] = style.fontstyle;
				}
			}
	}

	public static function changeStyleForNode(node:XMLNode, newStyle:Style){
		if(isStyleChanged(node, newStyle )){
			var nodeStyle = getStyleForCurrentNode(node);
			
			if(newStyle.size!=nodeStyle.size){
				node.attributes["fontsize"] = newStyle.size;
			}
			if(newStyle.color!=nodeStyle.color){
				node.attributes["color"] = newStyle.color;
			}
			if(newStyle.font!=nodeStyle.font){
				node.attributes["fontfamily"] = newStyle.font;
			}
			
			if(newStyle.fontweight!=nodeStyle.fontweight) {
				node.attributes["fontweight"] = newStyle.fontweight;
				
			}
			if(newStyle.fontstyle!=nodeStyle.fontstyle){
				node.attributes["fontstyle"] = newStyle.fontstyle;
			}
			
			if(node.attributes["fontweight"]=="" & nodeStyle.nodeStyle.fontweight==""){
				node.attributes["fontweight"] = null;
			}
			if(node.attributes["fontstyle"]=="" & nodeStyle.nodeStyle.fontstyle==""){
				node.attributes["fontstyle"] = null;
			}
		}
	}

	public static function hasSameStyle(n1:XMLNode, n2:XMLNode):Boolean{
		var s1 = getStyleForCurrentNode(n1);
		var s2 = getStyleForCurrentNode(n2);
		return compare(s1, s2);
	}

	public static function compare(s1:Style, s2:Style):Boolean{
		if(s1.size!=s2.size) return false;
		if(s1.color!=s2.color) return false;
		if(s1.font!=s2.font) return false;
		if(s1.fontweight!=s2.fontweight) return false;
		if(s1.fontstyle!=s2.fontstyle) return false;
		return true;
	}

	public static function getStyleForCurrentNode(node:XMLNode):Style{
		var list = new Array();
		list[list.length] = node;
		
		var parent = node.parentNode;
		while(parent!=null){
			list[list.length] = parent;
			parent = parent.parentNode;
		}
		var s:Style = getRootNodeStyle(list[list.length-1]);
		for(var i=(list.length-1); i>-1; i--){
			s = getNodeStyle(list[i], s);
		}
		return s;
	}

	public static function getNodeStyle(node:XMLNode, defaultStyle:Style):Style{
		var nodeStyle = defaultStyle.getCopy();
		if(node.attributes["color"]!=null){
			nodeStyle.color = node.attributes["color"];
		}
		if(node.attributes["fontweight"]!=null){
			nodeStyle.fontweight = node.attributes["fontweight"];
		}
		if(node.attributes["fontstyle"]!=null){
			nodeStyle.fontstyle = node.attributes["fontstyle"];
		}
		if(node.attributes["fontsize"]!=null){
			nodeStyle.size = int(node.attributes["fontsize"]);
		}
		if(node.attributes["fontfamily"]!=null){
			nodeStyle.font = node.attributes["fontfamily"];
		}
		return nodeStyle;
	}

	public static function getRootNodeStyle(node:XMLNode):Style{
		var nodeStyle = new Style();
		if(node.attributes["color"]!=null){
			nodeStyle.color = node.attributes["color"];
		}
		if(node.attributes["fontweight"]!=null){
			nodeStyle.fontweight = node.attributes["fontweight"];
		}else{
			nodeStyle.fontweight = "";
		}
		if(node.attributes["fontstyle"]!=null){
			nodeStyle.fontstyle = node.attributes["fontstyle"];
		}else{
			nodeStyle.fontstyle = "";
		}
		if(node.attributes["fontsize"]!=null){
			nodeStyle.size = int(node.attributes["fontsize"]);
		}
		if(node.attributes["fontfamily"]!=null){
			nodeStyle.font = node.attributes["fontfamily"];
		}
		return nodeStyle;
	}
	

	public static function copyStyle(source:XMLNode, target:XMLNode){
		if(source.attributes["color"]!=null){
			target.attributes["color"] = source.attributes["color"];
		}
		if(source.attributes["fontweight"]!=null){
			target.attributes["fontweight"] = source.attributes["fontweight"];
		}
		if(source.attributes["fontstyle"]!=null){
			target.attributes["fontstyle"] = source.attributes["fontstyle"];
		}
		if(source.attributes["fontsize"]!=null){
			target.attributes["fontsize"] = source.attributes["fontsize"];
		}
		if(source.attributes["fontfamily"]!=null){
			target.attributes["fontfamily"] = source.attributes["fontfamily"];
		}
	}


	public static function isStyleChanged(node:XMLNode, newStyle:Style):Boolean{
		var nodeStyle = getStyleForCurrentNode(node);
		return !compare(nodeStyle, newStyle);
	}
}