package plover.controller.cmds.importing
{
import flash.events.IEventDispatcher;

import plover.controller.state.StateConstant;

import plover.model.slides.SlideCarriage;

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


    public function execute():void
    {
        service.on.queueComplete.addOnce( function ():void
        {
            model.selectedIndex = 0;
            dispatcher.dispatchEvent(new StateEvent(StateEvent.ACTION, StateConstant.IDLE))
        } );
    }
}
}
