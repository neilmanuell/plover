package plover.controller.cmds.browsing
{
import flash.events.IEventDispatcher;

import plover.model.files.ImportFileModel;
import plover.service.file.BrowseFileService;
import plover.service.file.BrowseResults;

import tools.statemachine.StateEvent;

public class OnBrowseCompleteChangeStateTo
{
    public function OnBrowseCompleteChangeStateTo(action:String)
    {
        _action = action;
    }

    [Inject]
    public var service:BrowseFileService;

    [Inject]
    public var dispatcher:IEventDispatcher;

    private var _action:String;

    public function execute():void
    {
        service.browseComplete.addOnce( function ( result:BrowseResults ):void
                {

                    dispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, _action ) );
                }
        );
    }
}
}
