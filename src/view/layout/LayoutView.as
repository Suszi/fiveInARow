package view.layout
{
	import constant.CApplicationState;
	import event.LayoutViewEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import view.screen.EndScreenView;
	import view.screen.GameScreenView;
	import view.screen.StartScreenView;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class LayoutView extends Sprite
	{
		private var _inited:Boolean = false;
		
		private var _startScreenView:StartScreenView;
		private var _gameScreenView:GameScreenView;
		private var _endScreenView:EndScreenView;
		
		public function LayoutView()
		{
			this.addEventListener( Event.RESIZE, this.drawContent, false, 0, true );
		}
		
		/**
		 * Initialization method
		 */
		public function initialize():void
		{
			if ( this._inited )
			{
				throw Error( "Already inited!" );
			}
			
			this.createStartScreenView();
			this.createGameScreenView();
			this.createEndScreenView();
			
			this._inited = true;
			
			this.dispatchEvent( new LayoutViewEvent( LayoutViewEvent.READY ) );
		}
		
		/**
		 * Drawing method
		 * @param	e	:	Event
		 */
		private function drawContent( e:Event ):void
		{
			if ( this._startScreenView )
			{
				this._startScreenView.draw();
			}
			
			if ( this._gameScreenView )
			{
				this._gameScreenView.draw();
			}
			
			if ( this._endScreenView )
			{
				this._endScreenView.draw();
			}
		}
		
		/**
		 * Start screen view creation method
		 */
		private function createStartScreenView():void
		{
			this._startScreenView = new StartScreenView();
			this.addChild( this._startScreenView );
		}
		
		/**
		 * Game screen view creation method
		 */
		private function createGameScreenView():void
		{
			this._gameScreenView = new GameScreenView();
			this.addChild( this._gameScreenView );
		}
		
		/**
		 * End screen view creation method
		 */
		private function createEndScreenView():void
		{
			this._endScreenView = new EndScreenView();
			this.addChild( this._endScreenView );
		}
		
		/**
		 * State setting method
		 */
		public function setState( newState:String ):void
		{
			if ( !this._inited )
			{
				throw Error( "Application must be inited first!" );
			}
			
			switch ( newState )
			{
				case CApplicationState.START_SCREEN: 
					this._startScreenView.show();
					this._gameScreenView.hide();
					this._endScreenView.hide();
					break;
				case CApplicationState.GAME_SCREEN: 
					this._startScreenView.hide();
					this._gameScreenView.show();
					this._endScreenView.hide();
					break;
				case CApplicationState.END_SCREEN: 
					this._startScreenView.hide();
					this._gameScreenView.hide();
					this._endScreenView.show();
					break;
			}
		}
	}

}