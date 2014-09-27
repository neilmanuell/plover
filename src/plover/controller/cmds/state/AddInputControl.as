package plover.controller.cmds.state
{
import flash.events.IEventDispatcher;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import plover.controller.cmds.changeStateTo;
import plover.controller.constants.ButtonNames;
import plover.controller.events.ButtonClickEvent;
import plover.controller.guards.buttonNameIs;
import plover.controller.guards.keyIs;
import plover.controller.state.StateConstant;

import statemachine.flow.api.EventFlowMap;

public class AddInputControl
{
    [Inject]
    public var flow:EventFlowMap;

    [Inject]
    public var dispatcher:IEventDispatcher;

    public function execute():void
    {
        flow
                .on( ButtonClickEvent.CLICK, ButtonClickEvent )
                .always.execute( changeStateTo( StateConstant.OPEN, dispatcher ) )
                .butOnlyIf( buttonNameIs( ButtonNames.IMPORT_IMAGES ) );

        flow
                .on( KeyboardEvent.KEY_UP, KeyboardEvent )
                .always.execute( changeStateTo( StateConstant.OPEN, dispatcher ) )
                .butOnlyIf( keyIs( Keyboard.I, true ) );

        flow
                .on( ButtonClickEvent.CLICK, ButtonClickEvent )
                .always.execute( changeStateTo( StateConstant.QUIT, dispatcher ) )
                .butOnlyIf( buttonNameIs( ButtonNames.EXIT_APP ) );

        flow
                .on( ButtonClickEvent.CLICK, ButtonClickEvent )
                .always.execute( changeStateTo( StateConstant.SAVE, dispatcher ) )
                .butOnlyIf( buttonNameIs( ButtonNames.SAVE ) )
        ;


    }
}
}
