package plover.controller.cmds.opening
{
import flash.events.IEventDispatcher;

import plover.controller.state.StateConstants;
import plover.model.files.FileModel;
import plover.service.file.BrowseFileService;
import plover.service.file.ImageServiceResults;

import tools.statemachine.StateEvent;

public class BrowseDialogue
{
    [Inject]
    public var service:BrowseFileService;

    [Inject]
    public var model:FileModel;

    [Inject]
    public var dispatcher:IEventDispatcher;

    public function execute():void
    {
        service.browse().addOnce( function ( result:ImageServiceResults ):void
                {
                    var action:String = StateConstants.IDLE;

                    if ( result.success )
                    {
                        model.setParentFile( result.file );
                        action = ( model.listExists )
                                ? StateConstants.ACQUIRE
                                : StateConstants.IMPORT
                    }
                    dispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, action ) );

                }
        )
        ;
    }
}
}
