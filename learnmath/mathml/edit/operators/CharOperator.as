/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.edit.operators.*;
import learnmath.mathml.*;

class learnmath.mathml.edit.operators.CharOperator{

	public function CharOperator(){
	}
	
	
	public static function getChar(_operator:Number):String{
		if(_operator==Constant.BCHAR_01){
			return converToChar("0x0391");
		}else if(_operator==Constant.BCHAR_02){
			return converToChar("0x0392");
		}else if(_operator==Constant.BCHAR_03){
			return converToChar("0x0393");
		}else if(_operator==Constant.BCHAR_04){
			return converToChar("0x0394");
		}else if(_operator==Constant.BCHAR_05){
			return converToChar("0x0395");
		}else if(_operator==Constant.BCHAR_06){
			return converToChar("0x0396");
		}else if(_operator==Constant.BCHAR_07){
			return converToChar("0x0397");
		}else if(_operator==Constant.BCHAR_08){
			return converToChar("0x0398");
		}else if(_operator==Constant.BCHAR_09){
			return converToChar("0x0399");
		}else if(_operator==Constant.BCHAR_10){
			return converToChar("0x039a");
		}else if(_operator==Constant.BCHAR_11){
			return converToChar("0x039b");
		}else if(_operator==Constant.BCHAR_12){
			return converToChar("0x039c");
		}else if(_operator==Constant.BCHAR_13){
			return converToChar("0x039d");
		}else if(_operator==Constant.BCHAR_14){
			return converToChar("0x039e");
		}else if(_operator==Constant.BCHAR_15){
			return converToChar("0x039f");
		}else if(_operator==Constant.BCHAR_16){
			return converToChar("0x03a0");
		}else if(_operator==Constant.BCHAR_17){
			return converToChar("0x03a1");
		}else if(_operator==Constant.BCHAR_18){
			return converToChar("0x03a3");
		}else if(_operator==Constant.BCHAR_19){
			return converToChar("0x03a4");
		}else if(_operator==Constant.BCHAR_20){
			return converToChar("0x03a5");
		}else if(_operator==Constant.BCHAR_21){
			return converToChar("0x03a6");
		}else if(_operator==Constant.BCHAR_22){
			return converToChar("0x03a7");
		}else if(_operator==Constant.BCHAR_23){
			return converToChar("0x03a8");
		}else if(_operator==Constant.BCHAR_24){
			return converToChar("0x03a9");
		}else if(_operator==Constant.BCHAR_25){
			return converToChar("0x2202");
		}else if(_operator==Constant.BCHAR_26){
			return converToChar("0x2190");	
		}else if(_operator==Constant.BCHAR_27){
			return converToChar("0x21D0");	
		}else if(_operator==Constant.BCHAR_28){
			return converToChar("0x2192");	
		}else if(_operator==Constant.BCHAR_29){
			return converToChar("0x2191");	
		}else if(_operator==Constant.BCHAR_30){
			return converToChar("0x2193");	
		}else if(_operator==Constant.BCHAR_31){
			return converToChar("0x21D2");	
		}else if(_operator==Constant.BCHAR_32){
			return converToChar("0x2195");	
		}else if(_operator==Constant.BCHAR_33){
			return converToChar("0x2194");	
		}else if(_operator==Constant.BCHAR_34){
			return converToChar("0x21D4");																	
		}else if(_operator==Constant.LCHAR_01){
			return converToChar("0x03b1");
		}else if(_operator==Constant.LCHAR_02){
			return converToChar("0x03b2");
		}else if(_operator==Constant.LCHAR_03){
			return converToChar("0x03b3");
		}else if(_operator==Constant.LCHAR_04){
			return converToChar("0x03b4");
		}else if(_operator==Constant.LCHAR_05){
			return converToChar("0x03b5");
		}else if(_operator==Constant.LCHAR_06){
			return converToChar("0x03b6");
		}else if(_operator==Constant.LCHAR_07){
			return converToChar("0x03b7");
		}else if(_operator==Constant.LCHAR_08){
			return converToChar("0x03b8");
		}else if(_operator==Constant.LCHAR_09){
			return converToChar("0x03b9");
		}else if(_operator==Constant.LCHAR_10){
			return converToChar("0x03ba");
		}else if(_operator==Constant.LCHAR_11){
			return converToChar("0x03bb");
		}else if(_operator==Constant.LCHAR_12){
			return converToChar("0x03bc");
		}else if(_operator==Constant.LCHAR_13){
			return converToChar("0x03bd");
		}else if(_operator==Constant.LCHAR_14){
			return converToChar("0x03be");
		}else if(_operator==Constant.LCHAR_15){
			return converToChar("0x03bf");
		}else if(_operator==Constant.LCHAR_16){
			return converToChar("0x03c0");
		}else if(_operator==Constant.LCHAR_17){
			return converToChar("0x03c1");
		}else if(_operator==Constant.LCHAR_18){
			return converToChar("0x03c2");
		}else if(_operator==Constant.LCHAR_19){
			return converToChar("0x03c3");
		}else if(_operator==Constant.LCHAR_20){
			return converToChar("0x03c4");
		}else if(_operator==Constant.LCHAR_21){
			return converToChar("0x03c5");
		}else if(_operator==Constant.LCHAR_22){
			return converToChar("0x03c6");
		}else if(_operator==Constant.LCHAR_23){
			return converToChar("0x03c7");
		}else if(_operator==Constant.LCHAR_24){
			return converToChar("0x03c8");
		}else if(_operator==Constant.LCHAR_25){
			return converToChar("0x03c9");
		}else if(_operator==Constant.LCHAR_26){
			return converToChar("0x2205");
		}else if(_operator==Constant.LCHAR_27){
			return converToChar("0x221E");
		}else if(_operator==Constant.LCHAR_28){
			return converToChar("0x22A5");
		}else if(_operator==Constant.LCHAR_29){
			return converToChar("0x2225");
		}else if(_operator==Constant.LCHAR_30){
			return converToChar("0x2226");
		}else if(_operator==Constant.LCHAR_31){
			return converToChar("0x2200");
		}else if(_operator==Constant.LCHAR_32){
			return converToChar("0x2220");
		}else if(_operator==Constant.LCHAR_33){
			return converToChar("0x0192");
		}else if(_operator==Constant.LCHAR_34){
			return converToChar("0x2207");			
		}else if(_operator==Constant.SCHAR_50){
			return converToChar("0x2282");
		}else if(_operator==Constant.SCHAR_51){
			return converToChar("0x2286");
		}else if(_operator==Constant.SCHAR_52){
			return converToChar("0x2284");
		}else if(_operator==Constant.SCHAR_53){
			return converToChar("0x2283");
		}else if(_operator==Constant.SCHAR_54){
			return converToChar("0x2287");
		}else if(_operator==Constant.SCHAR_55){
			return converToChar("0x2208");
		}else if(_operator==Constant.SCHAR_56){
			return converToChar("0x2209");
		}else if(_operator==Constant.SCHAR_57){
			return converToChar("0x221E");
		}else if(_operator==Constant.SCHAR_58){
			return converToChar("0x22A5");
		}else if(_operator==Constant.SCHAR_59){
			return converToChar("0x2225");
		}else if(_operator==Constant.SCHAR_60){
			return converToChar("0x2226");
		}else if(_operator==Constant.SCHAR_61){
			return converToChar("0x2200");									
		}
	}
	

	public static function converToChar(number:String):String{
		var letter1:Number = Number(new Number(number).toString(10));
		return String.fromCharCode( letter1 );
	}
}