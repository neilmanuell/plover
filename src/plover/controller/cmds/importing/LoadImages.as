package plover.controller.cmds.importing
{
import plover.service.image.ImportEvent;

import tools.loaderservice.api.LoaderService;

public class LoadImages
{

    [Inject]
    public var service:LoaderService;

    [Inject]
    public var event:ImportEvent;

    public function execute():void
    {
        service.load( event.urls );
    }
}
}
