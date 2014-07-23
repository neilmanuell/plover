package plover.view
{
import mx.containers.ViewStack;

import plover.controller.events.ViewEvent;

import robotlegs.bender.bundles.mvcs.Mediator;

public class ViewStackMediator extends Mediator
{

    [Inject]
    public var view:ViewStack;


    override public function initialize():void
    {
        addContextListener( ViewEvent.ADD, onViewAdd );


    }

    private function onViewAdd( event:ViewEvent ):void
    {
        view.addItemAt( event.view, event.screen.index );
    }


}
}
