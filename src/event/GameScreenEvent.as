package event
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class GameScreenEvent extends Event
	{
		public static const SELECT:String = "GameScreenEvent.select";
		
		private var _row:int;
		private var _column:int;
		
		public function GameScreenEvent( type:String, row:int = -1, column:int = -1, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			super( type, bubbles, cancelable );
			this._row = row;
			this._column = column;
		}
		
		public override function clone():Event
		{
			return new GameScreenEvent( type, this._row, this._column, bubbles, cancelable );
		}
		
		public override function toString():String
		{
			return formatToString( "GameScreenEvent", "type", "row", "colum", "bubbles", "cancelable", "eventPhase" );
		}
		
		public function get row():int
		{
			return _row;
		}
		
		public function get column():int
		{
			return _column;
		}
	
	}

}