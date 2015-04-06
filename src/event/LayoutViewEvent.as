package event
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class LayoutViewEvent extends Event
	{
		public static const READY:String = "LayoutViewEvent.ready";
		
		public function LayoutViewEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			super( type, bubbles, cancelable );
		
		}
		
		public override function clone():Event
		{
			return new LayoutViewEvent( type, bubbles, cancelable );
		}
		
		public override function toString():String
		{
			return formatToString( "LayoutViewEvent", "type", "bubbles", "cancelable", "eventPhase" );
		}
	
	}

}