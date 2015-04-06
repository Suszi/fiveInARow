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
	public class StartScreenMediator extends Mediator
	{
		[Inject]
		public var startScreenView:StartScreenView;
		
		[Inject]
		public var applicationModel:ApplicationModel;
		
		/**
		 * Initialization method
		 */
		override public function initialize():void
		{
			this.addViewListener( ApplicationEvent.START_GAME, this.dispatch, ApplicationEvent );
			this.addContextListener( ApplicationStateEvent.CHANGED, this.setViewVisibilityHandler );
		}
		
		/**
		 *
		 */
		override public function destroy():void
		{
			this.removeViewListener( ApplicationEvent.START_GAME, this.dispatch, ApplicationEvent );
			this.removeContextListener( ApplicationStateEvent.CHANGED, this.setViewVisibilityHandler );
		}
		
		/**
		 * Visibility setting handler
		 * @param	e	:	ApplicationStateEvent
		 */
		public function setViewVisibilityHandler( e:ApplicationStateEvent ):void
		{
			this.startScreenView.setVisibility( this.applicationModel.applicationState );
		}
	}
}