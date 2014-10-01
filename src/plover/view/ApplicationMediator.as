package plover.view
{
import flash.desktop.ClipboardFormats;
import flash.desktop.NativeDragManager;
import flash.events.NativeDragEvent;

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
        addViewListener( NativeDragEvent.NATIVE_DRAG_ENTER, onDragEnter );
        addViewListener( NativeDragEvent.NATIVE_DRAG_DROP, onDragDrop );
        addViewListener( FlexEvent.APPLICATION_COMPLETE, onComplete );

    }



    private function onDragDrop( event:NativeDragEvent ):void
    {
        const dropfiles:Array = event.clipboard.getData( ClipboardFormats.FILE_LIST_FORMAT ) as Array;
        if ( dropfiles == null )return;
        dispatch( new StateEvent( StateEvent.ACTION, StateConstant.INVOKE, dropfiles[0] ) )
    }

    private function onDragEnter( event:NativeDragEvent ):void
    {
        NativeDragManager.acceptDragDrop( view );
    }



    private function onComplete( event:FlexEvent ):void
    {
        dispatch( new StateEvent( StateEvent.ACTION, StateConstant.NEXT ) )
    }


}
}
