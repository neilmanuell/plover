package plover.controller.events
{
import flash.events.Event;

public class ButtonClickEvent extends Event
{
    public static const CLICK:String = "ButtonClickEvent.CLICK";
    private var _name:String;

    public function ButtonClickEvent( name:String )
    {
        super( CLICK );
        _name = name;
    }

    override public function clone():Event
    {
        return new ButtonClickEvent( _name );
    }

    public function get name():String
    {
        return _name;
    }
}
}
