package plover.controller.cmds.importing
{
import flash.events.IEventDispatcher;
import flash.events.ProgressEvent;

import tools.loaderservice.api.LoaderService;

public class HandleLoadProgress
{
    [Inject]
    public var dispatcher:IEventDispatcher;

    [Inject]
    public var service:LoaderService;


    public function execute():void
    {
        service.on.queueProgress.add( function ( loaded:Number, total:Number ):void
        {
            dispatcher.dispatchEvent( new ProgressEvent( ProgressEvent.PROGRESS, false, false, loaded, total ) );
        } );

    }
}
}
