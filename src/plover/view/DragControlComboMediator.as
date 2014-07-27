package plover.view
{
import flash.events.Event;

import plover.controller.events.ChangeDragControlEvent;
import plover.view.components.DragControlCombo;

import robotlegs.bender.bundles.mvcs.Mediator;

public class DragControlComboMediator extends Mediator
{

    [Inject]
    public var view:DragControlCombo;

    override public function initialize():void
    {
        addViewListener( Event.CHANGE, onChange )  ;
        dispatchChange();
    }

    private function onChange( event:Event ):void
    {
        dispatchChange()     ;
    }

    private function dispatchChange(  ):void
    {
        dispatch(new ChangeDragControlEvent(view.selectedItem.name))
    }
}
}
