package event
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class ApplicationStateEvent extends Event
	{
		public static const CHANGED:String = "ApplicationStateEvent.changed";
		
		private var _newState:String;
		
		public function ApplicationStateEvent( type:String, newState:String, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			super( type, bubbles, cancelable );
			this._newState = newState;
		}
		
		public override function clone():Event
		{
			return new ApplicationStateEvent( type, newState, bubbles, cancelable );
		}
		
		public override function toString():String
		{
			return formatToString( "ApplicationStateEvent", "type", "newState", "bubbles", "cancelable", "eventPhase" );
		}
		
		public function get newState():String
		{
			return _newState;
		}
	
	}

}