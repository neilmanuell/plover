package config
{
import plover.service.file.BrowseImageFileService;
import plover.service.file.ImageFileService;

import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

public class ServiceConfig implements IConfig
{

    [Inject]
    public var injector:IInjector;


    public function configure():void
    {
        injector.map( ImageFileService ).toSingleton( BrowseImageFileService );
    }
}
}
