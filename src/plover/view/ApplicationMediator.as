package plover.view
{
import mx.events.FlexEvent;
import mx.events.FlexNativeMenuEvent;

import plover.controller.events.ActionEvent;
import plover.controller.state.StateConstant;

import robotlegs.bender.bundles.mvcs.Mediator;

import tools.statemachine.StateEvent;

public class ApplicationMediator extends Mediator
{

    [Inject]
    public var view:Main;


    override public function initialize():void
    {
        addViewListener( FlexEvent.APPLICATION_COMPLETE, onComplete );
        view.menu.addEventListener( FlexNativeMenuEvent.ITEM_CLICK, onMenuItemClick );
    }

    override public function destroy():void
    {
        view.menu.removeEventListener( FlexNativeMenuEvent.ITEM_CLICK, onMenuItemClick );
    }

    private function onMenuItemClick( event:FlexNativeMenuEvent ):void
    {
        dispatch( new ActionEvent( event.item.@id, event.nativeMenu ) );
    }

    private function onComplete( event:FlexEvent ):void
    {
        dispatch( new StateEvent( StateEvent.ACTION, StateConstant.NEXT ) )
    }


}
}
