package plover.controller.cmds.opening
{
import plover.model.files.ImportFileModel;

import tools.loaderservice.api.JSONProvider;
import tools.loaderservice.api.LoaderService;

public class AcquireList
{

    [Inject]
    public var loader:LoaderService;

    [Inject]
    public var provider:JSONProvider;

    [Inject]
    public var model:ImportFileModel;

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
