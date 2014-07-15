package bundles
{
import robotlegs.bender.framework.api.IBundle;
import robotlegs.bender.framework.api.IContext;

import statemachine.engine.StateMachineExtension;
import statemachine.flow.EventFlowMapExtension;
import statemachine.flow.TriggerFlowMapExtension;

public class EventFlowBundle implements IBundle
{

    public function extend( context:IContext ):void
    {
        context.install(
                TriggerFlowMapExtension,
                EventFlowMapExtension );
    }
}
}