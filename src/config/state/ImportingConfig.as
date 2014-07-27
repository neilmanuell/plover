package config.state
{
import flash.events.IEventDispatcher;

import plover.controller.cmds.EnableDrag;
import plover.controller.cmds.importing.FlushImageModel;
import plover.controller.cmds.importing.HandleItemLoadComplete;
import plover.controller.cmds.importing.HandleLoadProgress;
import plover.controller.cmds.importing.LoadImages;
import plover.controller.cmds.importing.ResetSlideSelectedIndex;
import plover.controller.cmds.importing.RetrieveImageFiles;
import plover.controller.cmds.onLoadQueueCompleteChangeStateTo;
import plover.controller.cmds.state.RemoveAllLoaderServiceListeners;
import plover.controller.cmds.thenChangeStateTo;
import plover.controller.guards.ListFileDoesNotExist;
import plover.controller.state.StateConstant;

import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import statemachine.flow.api.EventFlowMap;

import tools.statemachine.StateEvent;

public class ImportingConfig implements IConfig
{

    [Inject]
    public var flow:EventFlowMap;

    [Inject]
    public var dispatcher:IEventDispatcher;

    [Inject]
    public var injector:IInjector;


    public function configure():void
    {

        flow
                .on( StateConstant.START_IMPORTING, StateEvent )
                .always.execute( RetrieveImageFiles ).butOnlyIf( ListFileDoesNotExist )
                .and.always.execute( onLoadQueueCompleteChangeStateTo( StateConstant.POST_IMPORT, injector ) )
                .and.always.execute( FlushImageModel, EnableDrag, HandleItemLoadComplete, HandleLoadProgress, LoadImages );

        flow
                .on( StateConstant.TEARDOWN_IMPORTING, StateEvent )
                .always.execute( ResetSlideSelectedIndex, RemoveAllLoaderServiceListeners );

        flow
                .on( StateConstant.START_POST_IMPORTING, StateEvent )
                .either.execute( thenChangeStateTo( StateConstant.SAVE, dispatcher ) ).butOnlyIf( ListFileDoesNotExist )
                .or.execute( thenChangeStateTo( StateConstant.IDLE, dispatcher ) );


    }


}
}