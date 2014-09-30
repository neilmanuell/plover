package plover.controller.cmds
{
import flash.events.IEventDispatcher;

import robotlegs.bender.framework.api.IInjector;

import tools.loaderservice.api.LoaderService;
import tools.statemachine.StateEvent;

public function onLoadQueueCompleteChangeStateTo( action:String, injector:IInjector ):Function
{
    return function ( event:StateEvent ):void
    {
        const service:LoaderService = injector.getInstance( LoaderService );
        service.on.queueComplete.addOnce( function ():void
        {
            const dispatcher:IEventDispatcher = injector.getInstance( IEventDispatcher );
            dispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, action ) );
        } );
    }
}

}
