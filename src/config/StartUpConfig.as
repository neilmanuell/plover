package config
{
import flash.events.IEventDispatcher;

import robotlegs.bender.framework.api.IConfig;

public class StartUpConfig implements IConfig
{

    [Inject]
    public var dispatcher:IEventDispatcher;


    public function configure():void
    {
      //  dispatcher.dispatchEvent( );
    }
}
}
