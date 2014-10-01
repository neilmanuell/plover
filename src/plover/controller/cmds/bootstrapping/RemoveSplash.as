package plover.controller.cmds.bootstrapping
{
import flash.events.IEventDispatcher;

import plover.controller.events.SplashEvent;

public class RemoveSplash
{
    [Inject]
    public var dispatcher:IEventDispatcher;

    public function execute():void
    {
        dispatcher.dispatchEvent( new SplashEvent() );
    }
}
}
