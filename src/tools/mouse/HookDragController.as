package tools.mouse
{
import flash.events.Event;
import flash.events.MouseEvent;

import plover.utils.maths.getHooksVelocity;

import robotlegs.bender.extensions.contextView.ContextView;

public class HookDragController extends DragController
{

    private var _velocity:Number = 0;
    private var _dest:Number = 0;
    private var _threshold:Number = 0.01;

    public function HookDragController( client:DragControllerClient, view:ContextView )
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
        _display.removeEventListener( Event.ENTER_FRAME, onEnterFrame );
        removeDownListeners();
    }

    override protected function onMouseDown( event:MouseEvent ):void
    {
        _velocity = 0;

        _display.addEventListener( MouseEvent.MOUSE_UP, onMouseUp );
        _display.addEventListener( MouseEvent.MOUSE_MOVE, onMouseMove );

    }


    override protected function onMouseUp( event:MouseEvent ):void
    {
        removeDownListeners();
    }

    override protected function onMouseMove( event:MouseEvent ):void
    {

        _dest =  _display.mouseX / _display.width ;
        _velocity = getHooksVelocity( multiplier, _dest, 2, 0.11, _velocity );
        trace( _velocity ) ;
        if ( !_display.hasEventListener( Event.ENTER_FRAME ) )
        {
            _display.addEventListener( Event.ENTER_FRAME, onEnterFrame );
        }

    }

    override protected function onEnterFrame( event:Event ):void
    {
        multiplier +=  _velocity;
        const end:Boolean = (multiplier > (_dest - _threshold) && multiplier < (_dest + _threshold) && _velocity < _threshold );
        if ( end )
        {
            _display.removeEventListener( Event.ENTER_FRAME, onEnterFrame );
        }
    }
}
}
