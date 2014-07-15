package plover.controller.cmds
{
import plover.service.image.LoadImageEvent;

import tools.loaderservice.api.LoaderService;

public class LoadImages
{

    [Inject]
    public var service:LoaderService;

    [Inject]
    public var event:LoadImageEvent;

    public function execute():void
    {
        service.load( event.urls );
    }
}
}
