package plover.controller.cmds.browsing
{
import flash.events.IEventDispatcher;

import plover.model.files.FileModel;
import plover.service.file.BrowseFileService;
import plover.service.file.ImageServiceResults;

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
        service.browseComplete.addOnce( function ( result:ImageServiceResults ):void
                {

                    dispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, _action ) );
                }
        );
    }
}
}
