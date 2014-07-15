package plover.controller.events
{
import flash.events.Event;

public class ExitApplicationEvent extends Event
{
    public static const EXIT:String = "ExitApplicationEvent.EXIT";

    public function ExitApplicationEvent(  )
    {
        super( EXIT );
    }

    override public function clone():Event
    {
        return new ExitApplicationEvent(  );
    }


}
}
