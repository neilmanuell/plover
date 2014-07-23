package plover.controller.cmds.state
{
import flash.events.IEventDispatcher;

import plover.controller.cmds.EnableDrag;

import plover.controller.cmds.importing.FlushImageModel;

import plover.controller.cmds.importing.HandleItemLoadComplete;
import plover.controller.cmds.importing.HandleLoadProgress;
import plover.controller.cmds.importing.HandleQueueComplete;
import plover.controller.cmds.importing.LoadImages;
import plover.service.image.ImportEvent;

import statemachine.flow.api.EventFlowMap;

public class SetupOpening
{
    [Inject]
    public var flow:EventFlowMap;

    [Inject]
    public var dispatcher:IEventDispatcher;

    public function execute():void
    {
       /* flow
                .on( ImportEvent.LOAD_REQUEST, ImportEvent )
                .all.execute( FlushImageModel, EnableDrag,  HandleQueueComplete, HandleItemLoadComplete, HandleLoadProgress, LoadImages );*/

        trace("")


    }
}
}
