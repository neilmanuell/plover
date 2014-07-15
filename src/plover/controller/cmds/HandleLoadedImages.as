package plover.controller.cmds
{
import flash.events.IEventDispatcher;

import plover.service.image.LoadImageEvent;

import tools.loaderservice.api.LoaderService;

public class HandleLoadedImages
{
    [Inject]
    public var dispatcher:IEventDispatcher;

    [Inject]
    public var service:LoaderService;

    [Inject]
    public var event:LoadImageEvent;

    public function execute():void
    {
        service.queueComplete.addOnce( function ():void
        {
            dispatcher.dispatchEvent( new LoadImageEvent(LoadImageEvent.LOAD_COMPLETE, event.files) );
        } );

    }
}
}
