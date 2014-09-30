package tools.mouse
{
import com.greensock.TweenLite;
import com.greensock.easing.Sine;

import flash.events.MouseEvent;

import robotlegs.bender.extensions.contextView.ContextView;

public class RelativeTweenedDragController extends DragController
{
    public function RelativeTweenedDragController( dispatcher:DragControllerClient, view:ContextView )
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
        const target:Number = Math.max( 0, Math.min( 1, _previousMultiplier + (currentPoint - _previousPoint) ) );
        TweenLite.to( this, 3, {multiplier: target, ease: Sine.easeOut } );

    }


}
}
