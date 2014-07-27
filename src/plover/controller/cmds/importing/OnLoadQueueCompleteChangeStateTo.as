package plover.controller.cmds.importing
{
import flash.events.IEventDispatcher;

import tools.loaderservice.api.LoaderService;
import tools.statemachine.StateEvent;

public class OnLoadQueueCompleteChangeStateTo
{
    [Inject]
    public var dispatcher:IEventDispatcher;

    [Inject]
    public var service:LoaderService;


    public function OnLoadQueueCompleteChangeStateTo( action:String )
    {
        _action = action;
    }

    private var _action:String;

    public function execute():void
    {
        service.on.queueComplete.addOnce( function ():void
        {
            dispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, _action ) )         ;
        } );
    }
}
}
