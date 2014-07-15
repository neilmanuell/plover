package config
{
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import tools.keyboard.*;

public class KeyboardRouterConfig implements IConfig
{

    [Inject]
    public var injector:IInjector;

    public function configure():void
    {
        injector.map( KeyboardRouter ).toSingleton( KeyboardRouter );
        injector.getInstance( KeyboardRouter );
    }
}
}
