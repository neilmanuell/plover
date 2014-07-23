package plover.controller.cmds.bootstrapping
{
import flash.events.IEventDispatcher;

import plover.controller.constants.ScreenInfo;
import plover.controller.events.ViewEvent;
import plover.view.components.Slide;

import spark.components.Group;

public class CreateView
{

    [Inject]
    public var dispatcher:IEventDispatcher;

    public function execute():void
    {
        dispatcher.dispatchEvent( new ViewEvent( ViewEvent.ADD, ScreenInfo.DISPLAY, new Slide() ) );
      //  dispatcher.dispatchEvent( new ViewEvent( ViewEvent.ADD, ScreenInfo.EDIT, new Group() ) );
    }
}
}
