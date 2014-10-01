package plover.controller.cmds.invoking
{
import flash.filesystem.File;

import plover.model.files.ImportFileModel;

import tools.statemachine.StateEvent;

public class HandleInvokedFile
{
    [Inject]
    public var model:ImportFileModel;

    [Inject]
    public var event:StateEvent;

    public function execute():void
    {
        model.setParentFile( event.data as File );
    }
}
}
