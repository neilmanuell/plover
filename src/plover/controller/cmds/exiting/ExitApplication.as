package plover.controller.cmds.exiting
{
import flash.events.IEventDispatcher;

import plover.controller.events.ExitApplicationEvent;

public class ExitApplication
{

    [Inject]
    public var dispatcher:IEventDispatcher;

    public function execute():void
    {
        dispatcher.dispatchEvent( new ExitApplicationEvent() );
    }
}
}
