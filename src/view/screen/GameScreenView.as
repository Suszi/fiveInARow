package view.screen
{
	import constant.CApplicationState;
	import constant.CPlayer;
	import event.GameScreenEvent;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import interfaces.IScreenView;
	import vo.BackgroundVO;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class GameScreenView extends Sprite implements IScreenView
	{
		private var _background:Sprite;
		private var _backgroundVO:BackgroundVO;
		private var _clickableField:SimpleButton;
		private var _markerContainer:Sprite;
		private var _actualPlayerText:TextField;
		
		public function GameScreenView()
		{
		
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
			if ( newState == CApplicationState.GAME_SCREEN )
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
			if ( this._background )
			{
				this._background.y = 99;
			}
		}
		
		/**
		 * Background creation method
		 */
		private function createBackground():void
		{
			this._background = new Sprite();
			this._background.graphics.lineStyle( 1, 0x000000 );
			var columnLength:int = this.backgroundVO.columnNumber;
			var rowLength:int = this.backgroundVO.rowNumber;
			for ( var c:int = 0; c < columnLength + 1; c++ )
			{
				for ( var r:int = 0; r < rowLength + 1; r++ )
				{
					this._background.graphics.moveTo( c * this._backgroundVO.squareParams.width, 0 );
					this._background.graphics.lineTo( c * this._backgroundVO.squareParams.width, this._backgroundVO.squareParams.height * rowLength );
					this._background.graphics.moveTo( 0, r * this._backgroundVO.squareParams.height );
					this._background.graphics.lineTo( this._backgroundVO.squareParams.width * columnLength, r * this._backgroundVO.squareParams.height );
				}
			}
			this._background.graphics.endFill();
			this.addChild( this._background );
			
			this.draw();
			
			this.createClickableField();
			this.createMarkerContainer();
			
			this.createActualPlayerTextFIeld();
		}
		
		/**
		 * Actual player text field creation method
		 */
		private function createActualPlayerTextFIeld():void
		{
			this._actualPlayerText = new TextField();
			this._actualPlayerText.autoSize = TextFieldAutoSize.LEFT;
			this._actualPlayerText.multiline = false;
			this._actualPlayerText.selectable = false;
			this._actualPlayerText.text = "";
			this._actualPlayerText.defaultTextFormat = new TextFormat( "Arial", 14, 0x000000 );
			this.addChild( this._actualPlayerText );
		}
		
		/**
		 * Clickable field creation method
		 */
		private function createClickableField():void
		{
			var invisible:Sprite = new Sprite();
			invisible.graphics.beginFill( 0x000000, 0 );
			invisible.graphics.drawRect( this._background.x, this._background.y, this._background.width, this._background.height );
			invisible.graphics.endFill();
			
			this._clickableField = new SimpleButton( invisible, invisible, invisible, invisible );
			this._clickableField.addEventListener( MouseEvent.CLICK, this.mouseEventClickHandler, false, 0, true );
			this.addChild( this._clickableField );
		}
		
		/**
		 * Marker container creation method
		 */
		private function createMarkerContainer():void
		{
			this._markerContainer = new Sprite();
			this._markerContainer.x = this._background.x;
			this._markerContainer.y = this._background.y;
			this._markerContainer.mouseEnabled = true;
			this.addChild( this._markerContainer );
		}
		
		/**
		 * Mouse event handler method
		 * @param	e	:	MouseEvent
		 */
		private function mouseEventClickHandler( e:MouseEvent ):void
		{
			this.dispatchEvent( new GameScreenEvent( GameScreenEvent.SELECT, this.getRowFromMousePosition(), this.getColumnFromMousePosition() ) );
		}
		
		/**
		 * Calculates the row number from mouse position
		 * @return	int
		 */
		private function getRowFromMousePosition():int
		{
			return Math.ceil( this.mouseX / this._backgroundVO.squareParams.width );
		}
		
		/**
		 * Calculates the column number from mouse position
		 * @return
		 */
		private function getColumnFromMousePosition():int
		{
			return Math.ceil(( this.mouseY - this._background.y ) / this._backgroundVO.squareParams.height );
		}
		
		/**
		 * Returns the backgroundVO
		 */
		public function get backgroundVO():BackgroundVO
		{
			return this._backgroundVO;
		}
		
		public function set backgroundVO( value:BackgroundVO ):void
		{
			this._backgroundVO = value;
			this.createBackground();
		}
		
		/**
		 * Places the corresponding marker to the right place on the field
		 * @param	actualPlayer	:	String
		 * @param	row				:	int
		 * @param	column			:	int
		 */
		public function placeMarker( actualPlayer:String, row:int, column:int ):void
		{
			var marker:Sprite = this.createMarker( actualPlayer == CPlayer.BLUE ? 0x0000FF : 0x00FF00, actualPlayer == CPlayer.BLUE ? true : false );
			marker.x = ( row - 1 ) * this._backgroundVO.squareParams.width;
			marker.y = ( column - 1 ) * this._backgroundVO.squareParams.height;
			this._markerContainer.addChild( marker );
		}
		
		/**
		 * Creates a marker
		 * @param	color		:	Number
		 * @param	isCircle	:	Boolean
		 * @return
		 */
		private function createMarker( color:Number, isCircle:Boolean ):Sprite
		{
			var m:Sprite = new Sprite();
			
			m.graphics.beginFill( color, 0 );
			m.graphics.drawRect( 0, 0, this._backgroundVO.squareParams.width, this._backgroundVO.squareParams.height );
			m.graphics.endFill();
			
			m.graphics.lineStyle( 2, color );
			
			if ( isCircle )
			{
				m.graphics.drawCircle(( this._backgroundVO.squareParams.width * 0.5 ), ( this._backgroundVO.squareParams.height * 0.5 ), ( this._backgroundVO.squareParams.width * 0.5 ) - 2 );
			}
			else
			{
				m.graphics.moveTo( 2, 2 );
				m.graphics.lineTo( this._backgroundVO.squareParams.width - 1, this._backgroundVO.squareParams.height - 1 );
				m.graphics.moveTo( 2, this._backgroundVO.squareParams.height - 1 );
				m.graphics.lineTo( this._backgroundVO.squareParams.width - 1, 2 );
			}
			
			return m;
		}
		
		/**
		 * Sets the actual player text field text
		 * @param	player	:	String
		 */
		public function setActualPlayerOnTextFIeld( player:String ):void
		{
			if ( this._actualPlayerText )
			{
				this._actualPlayerText.text = "Player: " + player;
			}
		}
		
		/**
		 * Removes all marker from the container
		 */
		public function resetMarkers():void
		{
			if ( this._markerContainer )
			{
				while ( this._markerContainer.numChildren > 0 )
				{
					this._markerContainer.removeChildAt( 0 );
				}
			}
		}
	}
}