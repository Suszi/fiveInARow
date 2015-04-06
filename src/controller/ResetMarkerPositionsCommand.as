package controller{
	import model.ApplicationModel;
	import robotlegs.bender.bundles.mvcs.Command;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class ResetMarkerPositionsCommand extends Command
	{
		[Inject]
		public var applicationModel:ApplicationModel
		
		override public function execute():void
		{ 
			this.applicationModel.resetMarkerPositions();
		} 
		
	}
	
}