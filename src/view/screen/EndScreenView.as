package view.screen
{
	import constant.CApplicationState;
	import event.ApplicationEvent;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class EndScreenView extends MovieClip
	{
		private var _winnerPlayerText:TextField;
		private var _restartGameButton:SimpleButton;
		
		public function EndScreenView()
		{
			this.createWinnerTextField();
			this.createRestartButton();
			
			this.draw();
		}
		
		/**
		 * Showing method
		 */
		public function show():void
		{
			this.visible = true;
		}
		
		/**
		 * Hidiing method
		 */
		public function hide():void
		{
			this.visible = false;
		}
		
		/**
		 * Visibiliity setting method
		 * @param	newState	:	String
		 */
		public function setVisibility( newState:String ):void
		{
			if ( newState == CApplicationState.END_SCREEN )
			{
				this.show();
			}
			else
			{
				this.hide();
			}
		}
		
		/**
		 * Drawing method
		 */
		public function draw():void
		{
			if ( this._winnerPlayerText )
			{
				this._winnerPlayerText.x = 0;
				this._winnerPlayerText.y = 0;
				
				if ( this._restartGameButton )
				{
					this._restartGameButton.x = 0;
					this._restartGameButton.y = this._winnerPlayerText.y + this._winnerPlayerText.height + 5;
				}
			}
		}
		
		/**
		 * Create winner player text field
		 */
		private function createWinnerTextField():void
		{
			this._winnerPlayerText = new TextField();
			this._winnerPlayerText.autoSize = TextFieldAutoSize.LEFT;
			this._winnerPlayerText.multiline = false;
			this._winnerPlayerText.selectable = false;
			this._winnerPlayerText.text = "The winner is: ";
			this._winnerPlayerText.defaultTextFormat = new TextFormat( "Arial", 14, 0x000000 );
			this.addChild( this._winnerPlayerText );
		}
		
		/**
		 * Sets the winner player text field text
		 * @param	player	:	String
		 */
		public function setWinnerPlayerTextField( player:String ):void
		{
			if ( this._winnerPlayerText )
			{
				this._winnerPlayerText.text = "The winner is: " + player;
			}
		}
		
		/**
		 * Creates the restart button
		 */
		private function createRestartButton():void
		{
			var labelTextFormat:TextFormat = new TextFormat( "Arial", 12, 0xFFFFFF, true );
			
			var upState:TextField = new TextField();
			upState.background = true;
			upState.backgroundColor = 0x00FF00;
			upState.text = "RESTART";
			upState.defaultTextFormat = labelTextFormat;
			upState.multiline = false;
			upState.wordWrap = false;
			upState.autoSize = TextFieldAutoSize.CENTER;
			
			var overState:TextField = new TextField();
			overState.background = true;
			overState.backgroundColor = 0x70FF70;
			overState.text = "RESTART";
			overState.defaultTextFormat = labelTextFormat;
			overState.multiline = false;
			overState.wordWrap = false;
			overState.autoSize = TextFieldAutoSize.CENTER;
			
			var downState:TextField = new TextField();
			downState.background = true;
			downState.backgroundColor = 0x008800;
			downState.text = "RESTART";
			downState.defaultTextFormat = labelTextFormat;
			downState.multiline = false;
			downState.wordWrap = false;
			downState.autoSize = TextFieldAutoSize.CENTER;
			
			this._restartGameButton = new SimpleButton( upState, overState, downState, upState );
			this._restartGameButton.addEventListener( MouseEvent.CLICK, this.mouseEventClickHandler, false, 0, true );
			this.addChild( this._restartGameButton );
		}
		
		/**
		 * Mouse event handler method
		 * @param	e	:	MouseEvent
		 */
		private function mouseEventClickHandler( e:MouseEvent ):void
		{
			this.dispatchEvent( new ApplicationEvent( ApplicationEvent.RESTART_GAME ) );
		}
	}

}