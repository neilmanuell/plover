package config.state
{
import flash.events.IEventDispatcher;

import plover.controller.cmds.browsing.BrowseForOpenDialogue;
import plover.controller.cmds.browsing.ResetBrowseForOpen;
import plover.controller.cmds.onBrowseCompleteChangeStateTo;
import plover.controller.cmds.sendErrorReport;
import plover.controller.cmds.thenChangeStateTo;
import plover.controller.guards.BrowsingCancelled;
import plover.controller.guards.BrowsingFailed;
import plover.controller.guards.BrowsingResultsNotNull;
import plover.controller.guards.FolderDoesNotContainImages;
import plover.controller.guards.ListFileDoesExist;
import plover.controller.state.StateConstant;
import plover.model.errors.FolderHasNoImagesReport;

import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

import statemachine.flow.api.EventFlowMap;

import tools.statemachine.StateEvent;

public class BrowsingConfig implements IConfig
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
                .on( StateConstant.START_OPENING, StateEvent )
                .always.execute( BrowseForOpenDialogue, onBrowseCompleteChangeStateTo( StateConstant.NEXT, injector ) );

        flow
                .on( StateConstant.TEARDOWN_OPENING_REVIEW, StateEvent )
                .always.execute( ResetBrowseForOpen );

        flow
                .on( StateConstant.START_OPENING_REVIEW, StateEvent )
                .either
                    .execute( thenChangeStateTo( StateConstant.IDLE, dispatcher ) )
                    .butOnlyIf( BrowsingResultsNotNull, BrowsingCancelled )
                .or
                    .execute( thenChangeStateTo( StateConstant.ERROR, dispatcher ) )
                    .butOnlyIf( BrowsingResultsNotNull, BrowsingFailed )
                .or
                    .execute( sendErrorReport( new FolderHasNoImagesReport(), injector ), thenChangeStateTo( StateConstant.ERROR, dispatcher ) )
                    .butOnlyIf( FolderDoesNotContainImages )
                .or
                    .execute( thenChangeStateTo( StateConstant.LOAD_LIST, dispatcher ) )
                    .butOnlyIf( ListFileDoesExist )
                .or
                    .execute( thenChangeStateTo( StateConstant.LOAD_IMAGES, dispatcher ) );

    }

}
}
