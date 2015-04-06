package controller
{
	import constant.CApplicationState;
	import model.ApplicationModel;
	import robotlegs.bender.bundles.mvcs.Command;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class ShowStartScreenCommand extends Command
	{
		[Inject]
		public var applicationModel:ApplicationModel;
		
		override public function execute():void
		{
			this.applicationModel.applicationState = CApplicationState.START_SCREEN;
		}
	
	}
}