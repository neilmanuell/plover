package tools.mouse
{
import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.events.MouseEvent;

import robotlegs.bender.extensions.contextView.ContextView;

public class AbsoluteDragController extends DragController
{
    public function AbsoluteDragController( dispatcher:IEventDispatcher, view:ContextView )
    {
        super( dispatcher, view );
    }

    private function removeDownListeners():void
    {
        client.removeEventListener( MouseEvent.MOUSE_UP, onMouseUp );
        client.removeEventListener( Event.ENTER_FRAME, onEnterFrame );
    }

    override protected function removeAllListeners():void
    {
        client.removeEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
        removeDownListeners();
    }

    override protected function onMouseDown( event:MouseEvent ):void
    {
        client.addEventListener( MouseEvent.MOUSE_UP, onMouseUp );
        client.addEventListener( Event.ENTER_FRAME, onEnterFrame );
    }

    override protected function onMouseUp( event:MouseEvent ):void
    {
        removeDownListeners();
    }

    override protected function onEnterFrame( event:Event ):void
    {

        multiplier = client.mouseX / client.width;

    }
}
}
