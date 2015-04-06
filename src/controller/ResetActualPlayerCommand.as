package controller
{
	import constant.CPlayer;
	import model.ApplicationModel;
	import robotlegs.bender.bundles.mvcs.Command;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class ResetActualPlayerCommand extends Command
	{
		[Inject]
		public var applicationModel:ApplicationModel;
		
		override public function execute():void
		{
			this.applicationModel.actualPlayer = CPlayer.BLUE;
		}
	
	}

}