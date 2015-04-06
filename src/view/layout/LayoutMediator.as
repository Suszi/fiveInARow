package view.layout
{
	import event.ApplicationStateEvent;
	import event.LayoutViewEvent;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class LayoutMediator extends Mediator
	{
		[Inject]
		public var layoutView:LayoutView;
		
		/**
		 * Initializing method
		 */
		override public function initialize():void
		{
			this.addViewListener( LayoutViewEvent.READY, this.dispatch, LayoutViewEvent );
			this.addContextListener( ApplicationStateEvent.CHANGED, this.changeVisibleScreenOnView );
		}
		
		/**
		 *
		 */
		override public function destroy():void
		{
			this.removeViewListener( LayoutViewEvent.READY, this.dispatch, LayoutViewEvent );
			this.removeContextListener( ApplicationStateEvent.CHANGED, this.changeVisibleScreenOnView );
		}
		
		/**
		 * Visibility changing method
		 * @param	e	:	ApplicationStateEvent
		 */
		private function changeVisibleScreenOnView( e:ApplicationStateEvent ):void
		{
			this.layoutView.setState( e.newState );
		}
	}

}