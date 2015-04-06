package view.screen
{
	import event.ApplicationEvent;
	import event.ApplicationStateEvent;
	import event.GameScreenEvent;
	import event.LayoutViewEvent;
	import model.ApplicationModel;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class GameScreenMediator extends Mediator
	{
		[Inject]
		public var gameScreenView:GameScreenView;
		
		[Inject]
		public var applicationModel:ApplicationModel;
		
		/**
		 * Initialization method
		 */
		override public function initialize():void
		{
			this.addContextListener( LayoutViewEvent.READY, this.layoutReadyHandler );
			this.addContextListener( ApplicationStateEvent.CHANGED, this.setViewVisibilityHandler );
			this.addViewListener( GameScreenEvent.SELECT, this.placeMarker );
			this.addViewListener( GameScreenEvent.SELECT, this.dispatch, GameScreenEvent );
			this.addContextListener( ApplicationEvent.PLAYER_CHANGED, this.setActualPlayerOnTextField );
			this.addContextListener( ApplicationEvent.RESET_MARKERS, this.resetMarkersHandler );
		}
		
		/**
		 *
		 */
		override public function destroy():void
		{
			this.removeContextListener( LayoutViewEvent.READY, this.layoutReadyHandler );
			this.removeContextListener( ApplicationStateEvent.CHANGED, this.setViewVisibilityHandler );
			this.removeViewListener( GameScreenEvent.SELECT, this.placeMarker );
			this.removeViewListener( GameScreenEvent.SELECT, this.dispatch, GameScreenEvent );
			this.removeContextListener( ApplicationEvent.PLAYER_CHANGED, this.setActualPlayerOnTextField );
			this.removeContextListener( ApplicationEvent.RESET_MARKERS, this.resetMarkersHandler );
		}
		
		/**
		 * Grid creation handler
		 * @param	e	:	LayoutViewEvent
		 */
		private function layoutReadyHandler( e:LayoutViewEvent ):void
		{
			this.gameScreenView.backgroundVO = this.applicationModel.backgroundVO;
		}
		
		/**
		 * Visibility setting handler
		 * @param	e	:	ApplicationStateEvent
		 */
		private function setViewVisibilityHandler( e:ApplicationStateEvent ):void
		{
			this.gameScreenView.setVisibility( this.applicationModel.applicationState );
		}
		
		/**
		 * Marker placing handler
		 * @param	e	:	GameScreenEvent
		 */
		private function placeMarker( e:GameScreenEvent ):void
		{
			this.gameScreenView.placeMarker( this.applicationModel.actualPlayer, e.row, e.column );
		}
		
		/**
		 * Actual player changing handler
		 * @param	e	:	ApplicationEvent
		 */
		private function setActualPlayerOnTextField( e:ApplicationEvent ):void
		{
			this.gameScreenView.setActualPlayerOnTextFIeld( this.applicationModel.actualPlayer );
		}
		
		private function resetMarkersHandler( e:ApplicationEvent ):void
		{
			this.gameScreenView.resetMarkers();
		}
	}

}