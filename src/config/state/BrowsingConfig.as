package config.state
{
import flash.events.IEventDispatcher;

import plover.controller.cmds.browsing.BrowseDialogue;
import plover.controller.cmds.onBrowseCompleteChangeStateTo;
import plover.controller.cmds.thenChangeStateTo;
import plover.controller.guards.BrowsingFailed;
import plover.controller.guards.ListFileDoesExist;
import plover.controller.state.StateConstant;

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
                .on( StateConstant.START_BROWSING, StateEvent )
                .always.execute( BrowseDialogue, onBrowseCompleteChangeStateTo( StateConstant.POST_BROWSE, injector ) );

        flow
                .on( StateConstant.START_POST_BROWSING, StateEvent )
                .either.execute( thenChangeStateTo( StateConstant.IDLE, dispatcher ) ).butOnlyIf( BrowsingFailed )
                .or.execute( thenChangeStateTo( StateConstant.OPEN, dispatcher ) ).butOnlyIf( ListFileDoesExist )
                .or.execute( thenChangeStateTo( StateConstant.IMPORT, dispatcher ) )


    }


}
}
