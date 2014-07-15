package tools.mouse
{
import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.events.MouseEvent;

import robotlegs.bender.extensions.contextView.ContextView;

public class DragController
{
    public function DragController( dispatcher:IEventDispatcher, view:ContextView )
    {
        _dispatcher = dispatcher;
        client = view.view.stage;
    }

    private var _dispatcher:IEventDispatcher;
    protected var client:DisplayObject;

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
            client.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown );
        }

        else
        {
            removeAllListeners();
        }
    }

    public function destroy():void
    {
        enabled = false;
        client = null;
        _dispatcher = null;
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

    protected function onEnterFrame( event:Event ):void
    {

    }

    protected function set multiplier( value:Number ):void
    {
        _dispatcher.dispatchEvent( new MouseDragEvent( value ) )
    }
}
}
