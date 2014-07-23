package tools.mouse
{
import flash.events.Event;
import flash.events.MouseEvent;

import robotlegs.bender.extensions.contextView.ContextView;

public class RelativeDelayDragController extends DragController
{
    private var _previousPoint:Number;
    private var _previousMultiplier:Number;
    private var _targetDifference:Number;
    private var _currentDifference:Number;

    public function RelativeDelayDragController( dispatcher:DragControllerClient, view:ContextView )
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
        _display.removeEventListener( Event.ENTER_FRAME, onEnterFrame );
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

        const currentPoint:Number = _display.mouseX / _display.width;
        _targetDifference = (currentPoint - _previousPoint);
        _currentDifference = _targetDifference;

        addEnterFrame();

    }

    private function addEnterFrame():void
    {
        if ( _display.hasEventListener( Event.ENTER_FRAME ) )return;
        _display.addEventListener( Event.ENTER_FRAME, onEnterFrame );
    }

    override protected function onEnterFrame( event:Event ):void
    {

        _currentDifference *=  0.5;
        multiplier = _previousMultiplier + (_targetDifference - _currentDifference);

        if ( multiplier == _previousMultiplier + _targetDifference )
        {
            _display.removeEventListener( Event.ENTER_FRAME, onEnterFrame );
        }

        trace( multiplier )

    }
}
}
