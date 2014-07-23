package plover.controller.cmds.state
{
import statemachine.flow.api.EventFlowMap;

import tools.loaderservice.api.LoaderService;

public class TearDownAcquiring
{
    [Inject]
    public var flow:EventFlowMap;

    [Inject]
    public var service:LoaderService;

    public function execute():void
    {
        service.on.removeAll();
    }
}
}
