package controller 
{
	import constant.CPlayer;
	import model.ApplicationModel;
	import robotlegs.bender.bundles.mvcs.Command;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class SwitchPlayerCommand extends Command 
	{
		[Inject]
		public var applicationModel:ApplicationModel;
		
		override public function execute():void
		{
			if ( this.applicationModel.actualPlayer == CPlayer.BLUE )
			{
				this.applicationModel.actualPlayer = CPlayer.GREEN;
			}
			else
			{
				this.applicationModel.actualPlayer = CPlayer.BLUE;
			}
		}
	}

}