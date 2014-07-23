package config
{
import plover.service.file.BrowseImageFileService;
import plover.service.file.BrowseFileService;
import plover.service.file.ImageFileService;
import plover.service.file.DataFileOutService;

import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

public class ServiceConfig implements IConfig
{

    [Inject]
    public var injector:IInjector;


    public function configure():void
    {
        injector.map( BrowseFileService ).toSingleton( BrowseImageFileService );
        injector.map( ImageFileService );
        injector.map( DataFileOutService );
    }
}
}
