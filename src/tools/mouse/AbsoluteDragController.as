package tools.mouse
{
import flash.events.MouseEvent;

import robotlegs.bender.extensions.contextView.ContextView;

public class AbsoluteDragController extends DragController
{
    public function AbsoluteDragController( client:DragControllerClient, view:ContextView )
    {
        super( client, view );
    }

    private function removeDownListeners():void
    {
        _display.removeEventListener( MouseEvent.MOUSE_UP, onMouseUp );
        _display.removeEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );
    }

    override protected function removeAllListeners():void
    {
        _display.removeEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
        removeDownListeners();
    }

    override protected function onMouseDown( event:MouseEvent ):void
    {
        _display.addEventListener( MouseEvent.MOUSE_UP, onMouseUp );
        _display.addEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );
    }

    override protected function onMouseUp( event:MouseEvent ):void
    {
        removeDownListeners();
    }

    override protected function onMouseMove( event:MouseEvent ):void
    {
        trace( _display.mouseX  );
        multiplier = _display.mouseX / _display.width;

    }
}
}
