package view.screen
{
	import event.ApplicationEvent;
	import event.ApplicationStateEvent;
	import model.ApplicationModel;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class EndScreenMediator extends Mediator
	{
		[Inject]
		public var endScreenView:EndScreenView;
		
		[Inject]
		public var applicationModel:ApplicationModel;
		
		/**
		 * Initialization method
		 */
		override public function initialize():void
		{
			this.addContextListener( ApplicationStateEvent.CHANGED, this.applicationStateChangedHandler );
			this.addViewListener( ApplicationEvent.RESTART_GAME, this.dispatch, ApplicationEvent );
		}
		
		/**
		 *
		 */
		override public function destroy():void
		{
			this.removeContextListener( ApplicationStateEvent.CHANGED, this.applicationStateChangedHandler );
			this.removeViewListener( ApplicationEvent.RESTART_GAME, this.dispatch, ApplicationEvent );
		}
		
		/**
		 * Sets the view visibility and sets the actual player on it
		 * @param	e	:	ApplicationStateEvent
		 */
		public function applicationStateChangedHandler( e:ApplicationStateEvent ):void
		{
			this.endScreenView.setVisibility( this.applicationModel.applicationState );
			this.endScreenView.setWinnerPlayerTextField( this.applicationModel.actualPlayer );
		}
	}

}