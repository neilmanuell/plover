package config
{
import flash.events.IEventDispatcher;

import plover.controller.cmds.browsing.BrowseDialogue;
import plover.controller.state.StateConstant;

import robotlegs.bender.framework.api.IConfig;

import statemachine.flow.api.EventFlowMap;

import tools.statemachine.StateEvent;

public class BrowsingConfig implements IConfig
{

    [Inject]
    public var flow:EventFlowMap;

    [Inject]
    public var dispatcher:IEventDispatcher;

    public function configure():void
    {
        flow
                .on( StateConstant.START_BROWSING, StateEvent )
                .all.execute( BrowseDialogue );

    }


}
}
