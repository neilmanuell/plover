package plover.controller.cmds.state
{
import flash.events.IEventDispatcher;

import plover.controller.cmds.ChangeDragControl;
import plover.controller.cmds.ToggleDragControlMenuGroup;
import plover.controller.cmds.changeStateTo;
import plover.controller.cmds.changeViewStackTo;
import plover.controller.constants.ActionNames;
import plover.controller.constants.ScreenInfo;
import plover.controller.events.ActionEvent;
import plover.controller.guards.actionNameIs;
import plover.controller.guards.actionNameIsAny;
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

                .either.execute( changeStateTo( StateConstant.EDIT_SETTINGS, dispatcher ) )
                .butOnlyIf( actionNameIs( ActionNames.EDIT_SETTINGS ) )

                .or.execute( changeStateTo( StateConstant.OPEN, dispatcher ) )
                .butOnlyIf( actionNameIs( ActionNames.IMPORT_IMAGES ) )

                .or.execute( changeStateTo( StateConstant.CLOSE, dispatcher ) )
                .butOnlyIf( actionNameIs( ActionNames.CLOSE ) )

                .or.execute( changeStateTo( StateConstant.SAVE, dispatcher ) )
                .butOnlyIf( actionNameIs( ActionNames.SAVE ) )

                .or.execute( changeStateTo( StateConstant.QUIT, dispatcher ) )
                .butOnlyIf( actionNameIs( ActionNames.EXIT_APP ) )

                .or.execute( changeViewStackTo( ScreenInfo.DISPLAY, dispatcher ) )
                .butOnlyIf( actionNameIs( ActionNames.VIEW_SLIDES_SHOW ) )

                .or.execute( changeViewStackTo( ScreenInfo.EDIT, dispatcher ) )
                .butOnlyIf( actionNameIs( ActionNames.VIEW_EDITOR ) )

                .or.execute( ChangeDragControl, ToggleDragControlMenuGroup )
                .butOnlyIf( actionNameIsAny( ActionNames.DRAG_CONTROLLERS ) )


    }
}
}
