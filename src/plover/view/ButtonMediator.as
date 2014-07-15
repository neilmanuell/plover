package plover.view
{
import flash.events.MouseEvent;

import plover.controller.events.ButtonClickEvent;

import robotlegs.bender.bundles.mvcs.Mediator;

import spark.components.Button;

public class ButtonMediator extends Mediator
{

    [Inject]
    public var view:Button;

    override public function initialize():void
    {
        addViewListener( MouseEvent.CLICK, onClick )
    }

    private function onClick( event:MouseEvent ):void
    {
        dispatch( new ButtonClickEvent( view.id ) );
    }
}
}
