package tools.mouse
{
import flash.events.MouseEvent;

import robotlegs.bender.extensions.contextView.ContextView;

public class RelativeDragController extends DragController
{
    public function RelativeDragController( dispatcher:DragControllerClient, view:ContextView )
    {
        super( dispatcher, view );
    }
    private var _previousPoint:Number;
    private var _previousMultiplier:Number;

    override protected function removeAllListeners():void
    {
        _display.removeEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
        removeDownListeners();
    }

    private function removeDownListeners():void
    {
        _display.removeEventListener( MouseEvent.MOUSE_UP, onMouseUp );
        _display.removeEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );
    }

    override protected function onMouseDown( event:MouseEvent ):void
    {
        _previousPoint = _display.mouseX / (_display.width * 0.5);
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

        const currentPoint:Number = _display.mouseX / (_display.width * 0.5);
        multiplier = Math.max( 0, Math.min( 1, _previousMultiplier + (currentPoint - _previousPoint) ) );

    }
}
}
