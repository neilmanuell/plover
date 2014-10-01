package config.state
{
import flash.events.IEventDispatcher;

import plover.controller.cmds.browsing.BrowseForOpenDialogue;
import plover.controller.cmds.invoking.HandleInvokedFile;
import plover.controller.cmds.onBrowseCompleteChangeStateTo;
import plover.controller.cmds.sendErrorReport;
import plover.controller.cmds.thenChangeStateTo;
import plover.controller.guards.BrowsingCancelled;
import plover.controller.guards.BrowsingFailed;
import plover.controller.guards.FolderDoesNotContainImages;
import plover.controller.guards.ListFileDoesExist;
import plover.controller.state.StateConstant;
import plover.model.errors.FolderHasNoImagesReport;

import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import statemachine.flow.api.EventFlowMap;

import tools.statemachine.StateEvent;

public class InvokingConfig implements IConfig
{

    [Inject]
    public var flow:EventFlowMap;

    [Inject]
    public var dispatcher:IEventDispatcher;

    public function configure():void
    {
        flow
                .on( StateConstant.START_INVOKING, StateEvent )
                .always.execute( HandleInvokedFile, thenChangeStateTo( StateConstant.NEXT, dispatcher ) );

    }

}
}
