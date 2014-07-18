package plover.controller.cmds.importing
{
import flash.events.IEventDispatcher;

import plover.controller.state.StateConstants;

import plover.model.slides.SlideCarriage;

import plover.service.image.ImportEvent;

import tools.loaderservice.api.LoaderService;
import tools.statemachine.StateEvent;

public class HandleQueueComplete
{
    [Inject]
    public var model:SlideCarriage;

    [Inject]
    public var dispatcher:IEventDispatcher;

    [Inject]
    public var service:LoaderService;

    [Inject]
    public var event:ImportEvent;

    public function execute():void
    {
        service.on.queueComplete.addOnce( function ():void
        {
            model.sort()
            model.selectedIndex = 0;
            dispatcher.dispatchEvent(new StateEvent(StateEvent.ACTION, StateConstants.IDLE))
        } );

    }
}
}
