package plover.controller.cmds
{
import flash.events.IEventDispatcher;

import plover.service.file.BrowseFileService;
import plover.service.file.BrowseResults;

import robotlegs.bender.framework.api.IInjector;

import tools.statemachine.StateEvent;

public function onBrowseCompleteChangeStateTo( action:String, injector:IInjector ):Function
{
    return function ( event:StateEvent ):void
    {
        const service:BrowseFileService = injector.getInstance( BrowseFileService );

        service.browseComplete.addOnce( function ( result:BrowseResults ):void
                {
                    const dispatcher:IEventDispatcher = injector.getInstance( IEventDispatcher );
                    dispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, action ) );
                }
        );
    }
}

}
