class learnmath.mathml.Menu{

	static var lastMenu = -1;
	
	public static function init(){
		if(lastMenu<0){
			showMenu(1);
		}
	}
	
	public static function showMenu(showButton:Number){
		if(showButton==lastMenu) return;
		
		if(lastMenu>0){
			displayMenu(lastMenu)
		}
		displayMenu(showButton);
		lastMenu = showButton;
	}
	
	public static function displayMenu(showButton:Number){
		_root.fenceGroupMovieInst._visible=false;
		_root.fracGroupMovieInst._visible=false;
		_root.expGroupMovieInst._visible=false;
		_root.sumGroupMovieInst._visible=false;
		_root.integralGroupMovieInst._visible=false;
		_root.int2GroupMovieInst._visible=false;
		_root.accentGroupMovieInst._visible=false;
		_root.signGroupMovieInst._visible=false;
		_root.eqGroupMovieInst._visible=false;
		_root.matrixGroupInst._visible=false;
		_root.setmatrixMovieInst._visible = false;
		_root.bigCharMovieInst._visible = false;
		_root.littleCharMovieInst._visible = false;
		
		if(showButton==1){
			_root.fenceGroupMovieInst._visible=true;
			_root.fenceGroupMovieInst.play();
		}else if(showButton==2){
			_root.fracGroupMovieInst._visible=true;
			_root.fracGroupMovieInst.play();
		}else if(showButton==3){
			_root.expGroupMovieInst._visible=true;
			_root.expGroupMovieInst.play();
		}else if(showButton==4){
			_root.sumGroupMovieInst._visible=true;
			_root.sumGroupMovieInst.play();
		}else if(showButton==5){
			_root.integralGroupMovieInst._visible=true;
			_root.integralGroupMovieInst.play();
		}else if(showButton==6){
			_root.int2GroupMovieInst._visible=true;
			_root.int2GroupMovieInst.play();
		}else if(showButton==7){
			_root.accentGroupMovieInst._visible=true;
			_root.accentGroupMovieInst.play();
		}else if(showButton==8){
			_root.signGroupMovieInst._visible=true;
			_root.signGroupMovieInst.play();
		}else if(showButton==9){
			_root.eqGroupMovieInst._visible=true;
			_root.eqGroupMovieInst.play();
		}else if(showButton==10){
			_root.matrixGroupInst._visible=true;
			_root.matrixGroupInst.play();
		}else if(showButton==11){
			_root.bigCharMovieInst._visible=true;
			_root.bigCharMovieInst.play();
		}else if(showButton==12){
			_root.littleCharMovieInst._visible=true;
			_root.littleCharMovieInst.play();
		}
	}

}