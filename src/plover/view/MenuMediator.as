package plover.view
{
import mx.controls.FlexNativeMenu;
import mx.events.FlexNativeMenuEvent;

import plover.controller.events.ActionEvent;
import plover.view.components.menu.MENU_DATA;

import robotlegs.bender.bundles.mvcs.Mediator;

public class MenuMediator extends Mediator
{
    [Inject]
    public var view:FlexNativeMenu;

    override public function initialize():void
    {
        addViewListener( FlexNativeMenuEvent.ITEM_CLICK, onMenuItemClick );
        view.dataProvider = MENU_DATA;
    }

    private function onMenuItemClick( event:FlexNativeMenuEvent ):void
    {
        dispatch( new ActionEvent( event.index, event.item.@id, event.nativeMenu ) );
    }




}
}
