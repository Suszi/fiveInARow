package event
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class ApplicationEvent extends Event
	{
		public static const READY:String = "ApplicationEvent.ready";
		public static const LAYOUT_READY:String = "ApplicationEvent.layoutReady";
		public static const START_GAME:String = "ApplicationEvent.startGame";
		public static const PLAYER_CHANGED:String = "ApplicationEvent.playerChanged";
		public static const MARKER_POSITION_SAVED:String = "ApplicationEvent.markerPositionSaved";
		public static const RESTART_GAME:String = "ApplicationEvent.restartGame";
		public static const RESET_MARKERS:String = "ApplicationEvent.resetMarkers";
		
		public function ApplicationEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			super( type, bubbles, cancelable );
		
		}
		
		public override function clone():Event
		{
			return new ApplicationEvent( type, bubbles, cancelable );
		}
		
		public override function toString():String
		{
			return formatToString( "ApplicationEvent", "type", "bubbles", "cancelable", "eventPhase" );
		}
	
	}

}