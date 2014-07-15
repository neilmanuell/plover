package config
{
import plover.model.slides.SlideCarriage;

import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

public class ModelConfig implements IConfig
{

    [Inject]
    public var injector:IInjector;


    public function configure():void
    {
        injector.map( SlideCarriage ).asSingleton();
    }
}
}
