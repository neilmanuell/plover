package plover.controller.cmds.importing
{
import plover.model.files.FileModel;

import tools.loaderservice.api.LoaderService;

public class LoadImages
{

    [Inject]
    public var service:LoaderService;

    [Inject]
    public var model:FileModel;

    public function execute():void
    {
        service.load( model.imageURLs );
    }
}
}
