package guard
{
	import constant.CPlayer;
	import model.ApplicationModel;
	import robotlegs.bender.framework.api.IGuard;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class ActualPlayerIsBlueGuard implements IGuard
	{
		[Inject]
		public var applicationModel:ApplicationModel;
		
		public function approve():Boolean
		{
			return this.applicationModel.actualPlayer == CPlayer.BLUE;
		}
	
	}

}