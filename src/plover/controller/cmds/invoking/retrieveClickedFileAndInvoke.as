package plover.controller.cmds.invoking
{
import flash.events.IEventDispatcher;

import plover.controller.events.ActionEvent;
import plover.controller.state.StateConstant;
import plover.model.settings.RecentlyOpenedList;

import tools.statemachine.StateEvent;

public class RetrieveClickedFileAndInvoke
{
    [Inject]
    public var list:RecentlyOpenedList;

    [Inject]
    public var event:ActionEvent;

    [Inject]
    public var dispatcher:IEventDispatcher;

    public function execute():void
    {
        const stateEvent:StateEvent = new StateEvent( StateEvent.ACTION, StateConstant.INVOKE, list.getFileAt( event.index ) );
        dispatcher.dispatchEvent( stateEvent );
    }
}
}
