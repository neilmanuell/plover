package tools.mouse
{
import flash.events.Event;

public class MouseDragEvent extends Event
{
    public static const DRAG:String = "MouseDragEvent.DRAG";

    public function MouseDragEvent( multiplier:Number )
    {
        super( DRAG );
        _multiplier = multiplier;
    }

    private var _multiplier:Number;

    public function get multiplier():Number
    {
        return _multiplier;
    }

    override public function clone():Event
    {
        return new MouseDragEvent( _multiplier )
    }
}
}
