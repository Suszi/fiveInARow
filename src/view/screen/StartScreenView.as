package view.screen
{
	import constant.CApplicationState;
	import event.ApplicationEvent;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import interfaces.IScreenView;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class StartScreenView extends Sprite implements IScreenView
	{
		public static const MARGIN:int = 10;
		
		private var _titleText:TextField;
		private var _startGameButton:SimpleButton;
		
		public function StartScreenView()
		{
			this.createTitle();
			
			this.createStartButton();
			
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
		 * Hiding method
		 */
		public function hide():void
		{
			this.visible = false;
		}
		
		/**
		 * Visibility setting method
		 * @param	newState	:	String
		 */
		public function setVisibility( newState:String ):void
		{
			if ( newState == CApplicationState.START_SCREEN )
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
			if ( this._titleText )
			{
				this._titleText.x = ( this.width - this._titleText.width ) * 0.5;
				this._titleText.y = StartScreenView.MARGIN;
			}
			
			if ( this._startGameButton )
			{
				this._startGameButton.x = ( this._titleText.width - this._startGameButton.width ) * 0.5;
				this._startGameButton.y = this._titleText.y + this._titleText.height + StartScreenView.MARGIN;
			}
		}
		
		/**
		 * Title creation method
		 */
		private function createTitle():void
		{
			this._titleText = new TextField();
			this._titleText.autoSize = TextFieldAutoSize.CENTER;
			this._titleText.multiline = false;
			this._titleText.selectable = false;
			this._titleText.text = "Five In A Row";
			this._titleText.defaultTextFormat = new TextFormat( "Arial", 14, 0xffffff, true );
			this.addChild( this._titleText );
		}
		
		/**
		 * Start button creation method
		 */
		private function createStartButton():void
		{
			var labelTextFormat:TextFormat = new TextFormat( "Arial", 12, 0xFFFFFF, true );
			
			var upState:TextField = new TextField();
			upState.background = true;
			upState.backgroundColor = 0x00FF00;
			upState.text = "START";
			upState.defaultTextFormat = labelTextFormat;
			upState.multiline = false;
			upState.wordWrap = false;
			upState.autoSize = TextFieldAutoSize.CENTER;
			
			var overState:TextField = new TextField();
			overState.background = true;
			overState.backgroundColor = 0x70FF70;
			overState.text = "START";
			overState.defaultTextFormat = labelTextFormat;
			overState.multiline = false;
			overState.wordWrap = false;
			overState.autoSize = TextFieldAutoSize.CENTER;
			
			var downState:TextField = new TextField();
			downState.background = true;
			downState.backgroundColor = 0x008800;
			downState.text = "START";
			downState.defaultTextFormat = labelTextFormat;
			downState.multiline = false;
			downState.wordWrap = false;
			downState.autoSize = TextFieldAutoSize.CENTER;
			
			this._startGameButton = new SimpleButton( upState, overState, downState, upState );
			this._startGameButton.addEventListener( MouseEvent.CLICK, this.mouseEventClickHandler, false, 0, true );
			this.addChild( this._startGameButton );
		}
		
		/**
		 * Mouse event handler
		 * @param	e	:	MouseEvent
		 */
		private function mouseEventClickHandler( e:MouseEvent ):void
		{
			this.dispatchEvent( new ApplicationEvent( ApplicationEvent.START_GAME ) );
		}
	}
}