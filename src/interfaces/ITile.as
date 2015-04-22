package interfaces 
{
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public interface ITile 
	{
		function get background():DisplayObject;
		
		function set background( value:DisplayObject ):void;
	}
}