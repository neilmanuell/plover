package tools.keyboard
{
import flash.events.IEventDispatcher;
import flash.events.KeyboardEvent;

import robotlegs.bender.extensions.contextView.ContextView;

public class KeyboardRouter
{
    public function KeyboardRouter( dispatcher:IEventDispatcher, view:ContextView )
    {
        _dispatcher = dispatcher;
        contextView = view;
    }

    private var _dispatcher:IEventDispatcher;
    private var _stage:IEventDispatcher;


    public function set contextView( value:ContextView ):void
    {
        _stage = value.view.stage;
        _stage.addEventListener( KeyboardEvent.KEY_DOWN, redispatch );
        _stage.addEventListener( KeyboardEvent.KEY_UP, redispatch );
    }

    private function redispatch( event:KeyboardEvent ):void
    {
        _dispatcher.dispatchEvent( event );
    }


}
}
