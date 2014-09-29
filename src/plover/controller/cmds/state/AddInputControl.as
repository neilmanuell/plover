package plover.controller.cmds.state
{
import flash.events.IEventDispatcher;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import plover.controller.cmds.ChangeDragControl;
import plover.controller.cmds.ToggleDragControlMenuGroup;

import plover.controller.cmds.changeStateTo;
import plover.controller.constants.ActionNames;
import plover.controller.events.ActionEvent;
import plover.controller.guards.actionNameIs;
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
                .on( ActionEvent.EXECUTE, ActionEvent )
                .always.execute( changeStateTo( StateConstant.OPEN, dispatcher ) )
                .butOnlyIf( actionNameIs( ActionNames.IMPORT_IMAGES ) );


        flow
                .on( ActionEvent.EXECUTE, ActionEvent )
                .always.execute( changeStateTo( StateConstant.QUIT, dispatcher ) )
                .butOnlyIf( actionNameIs( ActionNames.EXIT_APP ) );

        flow
                .on( ActionEvent.EXECUTE, ActionEvent )
                .always.execute( changeStateTo( StateConstant.SAVE, dispatcher ) )
                .butOnlyIf( actionNameIs( ActionNames.SAVE ) );

        flow
                .on( ActionEvent.EXECUTE, ActionEvent )
                .always.execute( changeStateTo( StateConstant.CLOSE, dispatcher ) )
                .butOnlyIf( actionNameIs( ActionNames.CLOSE ) );

        flow
                .on( ActionEvent.EXECUTE, ActionEvent )
                .always.execute( changeStateTo( StateConstant.EDIT_SETTINGS, dispatcher ) )
                .butOnlyIf( actionNameIs( ActionNames.EDIT_SETTINGS ) );


        flow
                .on( ActionEvent.EXECUTE, ActionEvent )
                .always.execute( ChangeDragControl, ToggleDragControlMenuGroup )
                .butOnlyIf( actionNameIs( ActionNames.ABSOLUTE_DRAG_CONTROL ) );

        flow
                .on( ActionEvent.EXECUTE, ActionEvent )
                .always.execute( ChangeDragControl, ToggleDragControlMenuGroup )
                .butOnlyIf( actionNameIs( ActionNames.DELAYED_DRAG_CONTROL ) );

        flow
                .on( ActionEvent.EXECUTE, ActionEvent )
                .always.execute( ChangeDragControl, ToggleDragControlMenuGroup )
                .butOnlyIf( actionNameIs( ActionNames.RELATIVE_DRAG_CONTROL ) );


    }
}
}
