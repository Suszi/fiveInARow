package controller
{
	import event.GameScreenEvent;
	import model.ApplicationModel;
	import robotlegs.bender.bundles.mvcs.Command;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class SaveMarkerPositionCommand extends Command
	{
		[Inject]
		public var event:GameScreenEvent;
		
		[Inject]
		public var applicationModel:ApplicationModel;
		
		override public function execute():void
		{
			this.applicationModel.saveMarkerPosition( (event as GameScreenEvent).row, (event as GameScreenEvent).column );
		}
	}

}