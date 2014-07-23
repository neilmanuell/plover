package config
{
import flash.events.IEventDispatcher;

import plover.controller.state.StateConstant;

import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IContext;

import tools.statemachine.FSMInjector;

import tools.statemachine.StateMachine;

/**
 * @author Scott Enders
 */
public class StateMachineConfig implements IConfig
{

    //--------------------------------------------------------------------------------------------------
    //  PUBLIC PROPERTIES
    //--------------------------------------------------------------------------------------------------

    [Inject]
    public var context:IContext;

    [Inject]
    public var eventDispatcher:IEventDispatcher;

    //--------------------------------------------------------------------------------------------------
    //  PRIVATE PROPERTIES
    //--------------------------------------------------------------------------------------------------



    //--------------------------------------------------------------------------------------------------
    //  PUBLIC METHODS
    //--------------------------------------------------------------------------------------------------

    public function configure():void
    {
        trace( "StateMachineConfig.configure()" );
        var fsmInjector:FSMInjector = new FSMInjector( StateConstant.FSM );
        var stateMachine:StateMachine = new StateMachine( eventDispatcher );
        fsmInjector.inject( stateMachine );

        // Allow the instance of the StateMachine to be injected into mediators
        context.injector.map( StateMachine ).toValue( stateMachine );
    }
}
}