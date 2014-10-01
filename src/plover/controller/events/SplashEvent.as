package plover.controller.events
{
import flash.events.Event;

public class SplashEvent extends Event
{
    public static const REMOVE:String = "SplashEvent.REMOVE";
    private var _index:int;

    public function SplashEvent(  )
    {
        super( REMOVE );
    }


    override public function clone():Event
    {
        return new SplashEvent(  );
    }

}
}
