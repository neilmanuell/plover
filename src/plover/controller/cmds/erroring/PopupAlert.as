package plover.controller.cmds.erroring
{
import flash.events.IEventDispatcher;

import plover.controller.cmds.changeStateTo;
import plover.controller.state.StateConstant;
import plover.model.errors.ErrorRegistry;
import plover.model.errors.ErrorReport;

import spark.components.Alert;

public class PopupAlert
{
    [Inject]
    public var dispatcher:IEventDispatcher;

    [Inject]
    public var errors:ErrorRegistry;

    public function execute():void
    {
        const report:ErrorReport = errors.activeReport;
        Alert.show( report.report, report.title, Alert.OK, null, function ():void
        {
            changeStateTo( StateConstant.IDLE, dispatcher )();
        } )
    }
}
}
