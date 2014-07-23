package plover.controller.cmds.acquiring
{
import flash.events.IEventDispatcher;

import plover.controller.state.StateConstant;

import tools.loaderservice.api.LoaderService;
import tools.statemachine.StateEvent;

public class HandleListAcquired
{

    [Inject]
    public var loader:LoaderService;

    [Inject]
    public var dispatcher:IEventDispatcher;



    public function execute():void
    {

        loader.on.queueComplete.addOnce( function ():void
        {
              dispatcher.dispatchEvent(new StateEvent(StateEvent.ACTION, StateConstant.IMPORT))
        } );

    }
}
}
