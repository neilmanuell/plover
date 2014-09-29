package plover.controller.cmds.state
{
import flash.events.KeyboardEvent;

import plover.controller.events.ActionEvent;

import statemachine.flow.api.EventFlowMap;

public class RemoveInputControl
{
    [Inject]
    public var flow:EventFlowMap;

    public function execute():void
    {
        flow.remove( ActionEvent.EXECUTE );
        flow.remove( KeyboardEvent.KEY_UP );
    }
}
}
