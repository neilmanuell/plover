package plover.controller.cmds.state
{
import flash.events.KeyboardEvent;

import plover.controller.events.ButtonClickEvent;

import statemachine.flow.api.EventFlowMap;

public class RemoveInputControl
{
    [Inject]
    public var flow:EventFlowMap;

    public function execute():void
    {
        flow.remove( ButtonClickEvent.CLICK );
        flow.remove( KeyboardEvent.KEY_UP );
    }
}
}
