package config
{
import flash.events.IEventDispatcher;

import plover.controller.cmds.ChangeDragControl;
import plover.controller.events.ChangeDragControlEvent;

import robotlegs.bender.framework.api.IConfig;

import statemachine.flow.api.EventFlowMap;

import tools.statemachine.StateHistory;

public class ControllerConfig implements IConfig
{

    [Inject]
    public var flow:EventFlowMap;

    [Inject]
    public var dispatcher:IEventDispatcher;

    [Inject]
    public var stateHistory:StateHistory;


    public function configure():void
    {


        flow
                .on( ChangeDragControlEvent.CHANGE, ChangeDragControlEvent )
                .always.execute( ChangeDragControl );



    }


}
}
