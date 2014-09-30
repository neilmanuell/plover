package plover.controller.cmds.importing
{
import flash.events.IEventDispatcher;

import plover.controller.events.PloverProgressEvent;

public class DispatchProgressCompete
{
    [Inject]
    public var dispatcher:IEventDispatcher;


    public function execute():void
    {
        dispatcher.dispatchEvent( new PloverProgressEvent( PloverProgressEvent.COMPLETE, 1, 1 ) );
    }
}
}
