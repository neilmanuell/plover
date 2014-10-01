package plover.view
{
import flash.display.NativeWindow;

import plover.controller.events.ExitApplicationEvent;

import robotlegs.bender.bundles.mvcs.Mediator;

public class NativeWindowMediator extends Mediator
{
    [Inject]
    public var view:NativeWindow;

    override public function initialize():void
    {
        //view.maximize();
        addContextListener( ExitApplicationEvent.EXIT, onExit )
    }

    private function onExit( event:ExitApplicationEvent ):void
    {
        view.close();
    }


}
}
