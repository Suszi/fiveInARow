package
{
	import config.CommandConfig;
	import config.MediatorConfig;
	import config.SingletonConfig;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	import view.layout.LayoutView;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class Main extends Sprite
	{
		private var _context:IContext;
		private var _contextView:ContextView;
		private var _layout:LayoutView;
		
		/**
		 * Main constructor
		 */
		public function Main()
		{
			if ( this.stage )
			{
				this.init();
			}
			else
			{
				this.addEventListener( Event.ADDED_TO_STAGE, this.init );
			}
		}
		
		/**
		 * Initialization method
		 * @param	e	:	Event	-	null
		 */
		private function init( e:Event = null ):void
		{
			this.removeEventListener( Event.ADDED_TO_STAGE, this.init );
			
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.stage.align = StageAlign.TOP_LEFT;
			
			this.createContext();
		}
		
		/**
		 * Context creation method
		 */
		private function createContext():void
		{
			this._contextView = new ContextView( this );
			this._context = new Context()
							.install( MVCSBundle )
							.configure( CommandConfig, MediatorConfig, SingletonConfig )
							.configure( this._contextView );
			this.createLayout();
		}
		
		/**
		 * Layout creation method
		 */
		private function createLayout():void
		{
			this._layout = new LayoutView();
			this._contextView.view.addChild( this._layout );
			this._layout.initialize();
		}
	}
}