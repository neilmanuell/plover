package plover.controller.events
{
import flash.events.Event;

public class ChangeDragControlEvent extends Event
{
    public static const CHANGE:String = "ChangeDragControlEvent.CHANGE";
    private var _id:String;

    public function ChangeDragControlEvent( id:String )
    {
        super( CHANGE );
        _id = id;
    }

    override public function clone():Event
    {
        return new ButtonClickEvent( _id );
    }

    public function get id():String
    {
        return _id;
    }
}
}
