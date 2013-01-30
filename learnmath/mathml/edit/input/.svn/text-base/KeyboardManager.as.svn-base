/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.edit.*

class learnmath.mathml.edit.input.KeyboardManager{

	var selectBox:SelectBox;
	
	public function KeyboardManager(_selectBox:SelectBox){
		selectBox = _selectBox;
	}

	public function processKey(Key):Boolean{
		if(Key.isDown(Key.LEFT)){
			selectBox.goLeft(Key.isDown(Key.SHIFT))
			 return true;
		}else if(Key.isDown(Key.RIGHT)){
			selectBox.goRight(Key.isDown(Key.SHIFT))
			return true;
		}else if(Key.isDown(Key.UP)){
			selectBox.goUp(Key.isDown(Key.SHIFT))
			return true;
		}else if(Key.isDown(Key.DOWN)){
			selectBox.goDown(Key.isDown(Key.SHIFT))
			return true;
		}else if(Key.isDown(Key.HOME)){
			selectBox.goBegin(Key.isDown(Key.SHIFT))
			return true;
		}else if(Key.isDown(Key.END)){
			selectBox.goEnd(Key.isDown(Key.SHIFT))
			return true;
		}else if(Key.isDown(Key.DELETEKEY)){
			selectBox.deleteRight()
			return true;
		}else if(Key.isDown(Key.BACKSPACE)){
			selectBox.deleteLeft()
			return true;
		}else if(Key.isDown(Key.TAB)){
			selectBox.goTab(Key.isDown(Key.SHIFT))
			return true;
		}
		
		if(Key.getAscii()>31 & Key.getAscii()<126){
			selectBox.addCharToCurrentPosition(String.fromCharCode(Key.getAscii()));
			return true;
		}
		return false;
	}

}