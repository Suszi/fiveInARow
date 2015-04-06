package config
{
	import controller.FinishGameCommand;
	import controller.InitBackgroundParamsCommand;
	import controller.ResetActualPlayerCommand;
	import controller.ResetMarkerPositionsCommand;
	import controller.SaveMarkerPositionCommand;
	import controller.ShowGameScreenCommand;
	import controller.ShowStartScreenCommand;
	import controller.SwitchPlayerCommand;
	import event.ApplicationEvent;
	import event.GameScreenEvent;
	import event.LayoutViewEvent;
	import guard.HasFiveInARowGuard;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class CommandConfig implements IConfig
	{
		[Inject]
		public var commandMap:IEventCommandMap;
		
		public function configure():void
		{
			this.commandMap.map( LayoutViewEvent.READY ).toCommand( ShowStartScreenCommand );
			this.commandMap.map( LayoutViewEvent.READY ).toCommand( InitBackgroundParamsCommand );
			
			this.commandMap.map( ApplicationEvent.START_GAME ).toCommand( ShowGameScreenCommand );
			this.commandMap.map( ApplicationEvent.START_GAME ).toCommand( ResetActualPlayerCommand );
			this.commandMap.map( ApplicationEvent.START_GAME ).toCommand( ResetMarkerPositionsCommand );
			
			this.commandMap.map( GameScreenEvent.SELECT, GameScreenEvent ).toCommand( SaveMarkerPositionCommand );
			this.commandMap.map( GameScreenEvent.SELECT ).toCommand( SwitchPlayerCommand );
			this.commandMap.map( ApplicationEvent.MARKER_POSITION_SAVED ).toCommand( FinishGameCommand ).withGuards( HasFiveInARowGuard );
			
			this.commandMap.map( ApplicationEvent.RESTART_GAME ).toCommand( ShowGameScreenCommand );
			this.commandMap.map( ApplicationEvent.RESTART_GAME ).toCommand( ResetActualPlayerCommand );
			this.commandMap.map( ApplicationEvent.RESTART_GAME ).toCommand( ResetMarkerPositionsCommand );
		}
	
	}

}