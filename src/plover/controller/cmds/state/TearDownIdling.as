package plover.controller.cmds.state
{
import plover.controller.events.ButtonClickEvent;

import statemachine.flow.api.EventFlowMap;

public class TearDownIdling
{
    [Inject]
    public var flow:EventFlowMap;

    public function execute():void
    {
        flow.remove( ButtonClickEvent.CLICK );
    }
}
}
