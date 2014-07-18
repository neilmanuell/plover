package tools.mouse
{
import flash.events.MouseEvent;

import robotlegs.bender.extensions.contextView.ContextView;

public class RelativeDragController extends DragController
{
    private var _previousPoint:Number;
    private var _previousMultiplier:Number;
    public function RelativeDragController( dispatcher:DragControllerClient, view:ContextView )
    {
        super( dispatcher, view );
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
        _previousPoint = _display.mouseX / _display.width;
        _previousMultiplier = multiplier;
        _display.addEventListener( MouseEvent.MOUSE_UP, onMouseUp );
        _display.addEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );
    }

    override protected function onMouseUp( event:MouseEvent ):void
    {
        removeDownListeners();
    }

    override protected function onMouseMove( event:MouseEvent ):void
    {

        const currentPoint:Number = _display.mouseX / _display.width ;
        multiplier =  _previousMultiplier+ (currentPoint - _previousPoint);

    }
}
}
