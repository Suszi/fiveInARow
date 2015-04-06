package model
{
	import base.BaseActor;
	import constant.CBackground;
	import constant.CPlayer;
	import event.ApplicationEvent;
	import event.ApplicationStateEvent;
	import vo.BackgroundVO;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class ApplicationModel extends BaseActor
	{
		private var _applicationState:String;
		private var _actualPlayer:String;
		private var _backgroundVO:BackgroundVO;
		private var _markerPositions:Array;
		private var _markerCounter:int;
		
		/**
		 * Marker position reseting method
		 */
		public function resetMarkerPositions():void
		{
			this._markerPositions = new Array();
			
			for ( var r:int = 0; r < CBackground.ROW_NUMBER; r++ )
			{
				var columnArray:Array = new Array();
				for ( var c:int = 0; c < CBackground.COLUMN_NUMBER; c++ )
				{
					columnArray.push( 0 );
				}
				
				this._markerPositions[ r ] = columnArray;
			}
			
			this.dispatch( new ApplicationEvent( ApplicationEvent.RESET_MARKERS ) );
		}
		
		/**
		 * Marker counter reseting method
		 */
		public function resetMarkerCounter():void
		{
			this._markerCounter = 0;
		}
		
		/**
		 * Marker position saving method
		 * @param	row		:	int
		 * @param	column	:	int
		 */
		public function saveMarkerPosition( row:int, column:int ):void
		{
			if ( !this._markerPositions )
			{
				throw Error( "Need to initialize markerPosition before use!" );
			}
			
			this._markerPositions[ row - 1 ][ column - 1 ] = this.actualPlayer == CPlayer.BLUE ? 1 : 2;
			this._markerCounter++;
			this.dispatch( new ApplicationEvent( ApplicationEvent.MARKER_POSITION_SAVED ) );
		}
		
		/**
		 * @return	String
		 */
		public function get applicationState():String
		{
			return this._applicationState;
		}
		
		/**
		 * @param	value	:	String
		 */
		public function set applicationState( value:String ):void
		{
			this._applicationState = value;
			this.dispatch( new ApplicationStateEvent( ApplicationStateEvent.CHANGED, this._applicationState ) );
		}
		
		/**
		 * @return	String
		 */
		public function get actualPlayer():String
		{
			return this._actualPlayer;
		}
		
		/**
		 * @param	value	:	String
		 */
		public function set actualPlayer( value:String ):void
		{
			this._actualPlayer = value;
			this.dispatch( new ApplicationEvent( ApplicationEvent.PLAYER_CHANGED ) );
		}
		
		/**
		 * @return	BackgroundVO
		 */
		public function get backgroundVO():BackgroundVO
		{
			return this._backgroundVO;
		}
		
		/**
		 * @param	value	:	BackgroundVO
		 */
		public function set backgroundVO( value:BackgroundVO ):void
		{
			this._backgroundVO = value;
		}
		
		/**
		 * @return	Array
		 */
		public function get markerPositions():Array
		{
			return this._markerPositions;
		}
		
		/**
		 * @return	int
		 */
		public function get markerCounter():int
		{
			return this._markerCounter;
		}
	}
}