package plover.controller.cmds.state
{
import flash.events.IEventDispatcher;

import plover.controller.cmds.changeStateTo;
import plover.controller.constants.ButtonNames;
import plover.controller.events.ButtonClickEvent;
import plover.controller.guards.onlyIfButtonNameIs;
import plover.controller.state.StateConstants;

import statemachine.flow.api.EventFlowMap;

public class SetupIdling
{
    [Inject]
    public var flow:EventFlowMap;

    [Inject]
    public var dispatcher:IEventDispatcher;

    public function execute():void
    {
        flow
                .on( ButtonClickEvent.CLICK, ButtonClickEvent )
                .all.onApproval( onlyIfButtonNameIs( ButtonNames.IMPORT_IMAGES ) )
                .execute( changeStateTo( StateConstants.IMPORT, dispatcher ) );

        flow
                .on( ButtonClickEvent.CLICK, ButtonClickEvent )
                .all.onApproval( onlyIfButtonNameIs( ButtonNames.EXIT_APP ) )
                .execute( changeStateTo( StateConstants.EXIT_APPLICATION, dispatcher ) );
    }
}
}
