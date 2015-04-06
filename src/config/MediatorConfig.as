package config
{
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import view.layout.LayoutMediator;
	import view.layout.LayoutView;
	import view.screen.EndScreenMediator;
	import view.screen.EndScreenView;
	import view.screen.GameScreenMediator;
	import view.screen.GameScreenView;
	import view.screen.StartScreenMediator;
	import view.screen.StartScreenView;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class MediatorConfig implements IConfig
	{
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var contextView:ContextView;
		
		public function configure():void
		{
			mediatorMap.map( LayoutView ).toMediator( LayoutMediator );
			mediatorMap.map( StartScreenView ).toMediator( StartScreenMediator );
			mediatorMap.map( GameScreenView ).toMediator( GameScreenMediator );
			mediatorMap.map( EndScreenView ).toMediator( EndScreenMediator );
		}
	
	}

}