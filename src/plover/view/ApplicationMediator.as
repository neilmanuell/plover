package plover.view
{
import mx.events.FlexEvent;

import plover.controller.state.StateConstant;

import robotlegs.bender.bundles.mvcs.Mediator;

import tools.statemachine.StateEvent;

public class ApplicationMediator extends Mediator
{

    [Inject]
    public var view:Main;


    override public function initialize():void
    {
       addViewListener(FlexEvent.APPLICATION_COMPLETE, onComplete)

    }

    private function onComplete(event:FlexEvent):void
    {
      dispatch(new  StateEvent(StateEvent.ACTION, StateConstant.START_APPLICATION) )
    }


}
}
