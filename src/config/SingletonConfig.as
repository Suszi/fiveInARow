package config
{
	import model.ApplicationModel;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	/**
	 * ...
	 * @author Tamás Schuszter
	 */
	public class SingletonConfig implements IConfig
	{
		[Inject]
		public var injector:IInjector;
		
		public function configure():void
		{
			injector.map( ApplicationModel ).asSingleton();
		}
	
	}

}