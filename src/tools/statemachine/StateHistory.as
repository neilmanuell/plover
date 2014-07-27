package tools.statemachine
{
import flash.events.IEventDispatcher;

public class StateHistory
{
    private const _history:Array = [];
    private var _currentState:String;
    private var _max:int = 10;
    private var _dispatcher:IEventDispatcher;

    public function StateHistory( dispatcher:IEventDispatcher ):void
    {
        _dispatcher = dispatcher;
        _dispatcher.addEventListener( StateEvent.CHANGED, onChanged )
    }

    private function onChanged( event:StateEvent ):void
    {
        push( event.action );
    }

    public function push( state:String ):void
    {
        if ( _currentState != null )
        {
            addItemToHistory();
        }
        trace("CURRENT STATE = " + _currentState);
        _currentState = state;
    }

    public function get currentStateName():String
    {
        return _currentState;
    }

    public function get previousStateName():String
    {
        return _history[0];
    }

    private function addItemToHistory():void
    {
        _history.unshift( _currentState );
        if ( _history.length > _max )
        {
            _history.pop();
        }
    }


}
}
