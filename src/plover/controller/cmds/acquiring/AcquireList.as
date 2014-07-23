package plover.controller.cmds.acquiring
{
import plover.model.files.FileModel;

import tools.loaderservice.api.JSONProvider;
import tools.loaderservice.api.LoaderService;

public class AcquireList
{

    [Inject]
    public var loader:LoaderService;

    [Inject]
    public var provider:JSONProvider;

    [Inject]
    public var model:FileModel;

    public function execute():void
    {

        const url:String = model.list.url;
        loader.on.queueComplete.addOnce( function ():void
        {
            model.parseList( provider.getJSON( url ) as Array );
        } );
        loader.load( [url] );

    }
}
}
