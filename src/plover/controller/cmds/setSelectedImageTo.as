package plover.controller.cmds
{
import flash.events.Event;
import flash.events.IEventDispatcher;

import plover.controller.constants.ScreenInfo;
import plover.controller.events.ViewStackEvent;
import plover.model.slides.SlideCarriage;

import robotlegs.bender.framework.api.IInjector;

public function setSelectedImageTo( index:int, injector:IInjector ):Function
{
    return function ( event:Event ):void
    {
        const slides:SlideCarriage = injector.getInstance(SlideCarriage);
        slides.selectedIndex = index;
    }
}

}
