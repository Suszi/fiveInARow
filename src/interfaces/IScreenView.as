package interfaces
{
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public interface IScreenView
	{
		function show():void;
		
		function hide():void;
		
		function setVisibility( newState:String ):void;
		
		function draw():void;
	}
}