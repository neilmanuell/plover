package plover.controller.events
{
import flash.events.Event;
import flash.events.ProgressEvent;

public class PloverProgressEvent extends ProgressEvent
{
    public static const LOAD_PROGRESS:String = "PloverProgressEvent.LOAD_PROGRESS";
    public static const MEMORY_ALLOCATION_PROGRESS:String = "PloverProgressEvent.MEMORY_ALLOCATION_PROGRESS";
    public static const COMPLETE:String = "PloverProgressEvent.COMPLETE";


    public function PloverProgressEvent( type:String, bytesLoaded:Number, bytesTotal:Number )
    {

        super( type, false, false, bytesLoaded, bytesTotal );

    }


    override public function clone():Event
    {
        return new PloverProgressEvent(type,  bytesLoaded, bytesTotal );
    }


}
}
