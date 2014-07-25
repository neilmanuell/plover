package plover.controller.cmds.state
{
import flash.events.IEventDispatcher;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import plover.controller.cmds.changeStateTo;
import plover.controller.cmds.importing.FlushImageModel;
import plover.controller.constants.ButtonNames;
import plover.controller.constants.ScreenInfo;
import plover.controller.events.ButtonClickEvent;
import plover.controller.events.ViewStackEvent;
import plover.controller.guards.onlyIfButtonNameIs;
import plover.controller.guards.onlyIfKeyIs;
import plover.controller.state.StateConstant;

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
                .execute( changeStateTo( StateConstant.OPEN, dispatcher ) );

        flow
                .on( KeyboardEvent.KEY_UP, KeyboardEvent )
                .all.onApproval( onlyIfKeyIs( Keyboard.I, true ) )
                .execute( changeStateTo( StateConstant.OPEN, dispatcher ) );

        flow
                .on( ButtonClickEvent.CLICK, ButtonClickEvent )
                .all.onApproval( onlyIfButtonNameIs( ButtonNames.EXIT_APP ) )
                .execute( changeStateTo( StateConstant.EXIT_APPLICATION, dispatcher ) );

        flow
                .on( ButtonClickEvent.CLICK, ButtonClickEvent )
                .all.onApproval( onlyIfButtonNameIs( ButtonNames.SAVE ) )
                .execute( changeStateTo( StateConstant.SAVE, dispatcher )  );


    }
}
}
