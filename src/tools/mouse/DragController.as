package tools.mouse
{
import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.MouseEvent;

import robotlegs.bender.extensions.contextView.ContextView;

public class DragController
{
    public function DragController( client:DragControllerClient, view:ContextView )
    {
        _client = client;
        _display = view.view.stage;
    }

    protected var _display:DisplayObject;
    protected var _choke:Number = -1;
    private var _client:DragControllerClient;

    private var _enabled:Boolean = false;

    public function get enabled():Boolean
    {
        return _enabled;
    }

    public function set enabled( value:Boolean ):void
    {
        if ( value == _enabled )return;
        _enabled = value;

        if ( _enabled )
        {
            _display.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
        }

        else
        {
            removeAllListeners();
        }
    }

    private var _multiplier:Number = 0;

    protected function get multiplier():Number
    {
        return _multiplier;
    }

    protected function set multiplier( value:Number ):void
    {
        if ( value == _multiplier )return;
        _multiplier = value;
        const f:Number = _multiplier * _client.length - 1;
        const fint:int = (_choke == -1) ? f : (f > _choke) ? _choke : f;

        _client.selectedIndex = fint;
        _client.remainder = f - fint;
    }

    public function destroy():void
    {
        enabled = false;
        _client = null;
        _display = null;
    }

    protected function removeAllListeners():void
    {

    }

    protected function onMouseDown( event:MouseEvent ):void
    {

    }

    protected function onMouseUp( event:MouseEvent ):void
    {

    }

    protected function onMouseMove( event:MouseEvent ):void
    {

    }

    protected function onEnterFrame( event:Event ):void
    {

    }
}
}
