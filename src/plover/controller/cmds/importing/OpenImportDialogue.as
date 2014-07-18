package plover.controller.cmds.importing
{
import flash.events.IEventDispatcher;

import plover.controller.state.StateConstants;
import plover.service.file.ImageFileService;
import plover.service.file.ImageServiceResults;
import plover.service.file.ImageServiceStatus;
import plover.service.image.ImportEvent;

import tools.statemachine.StateEvent;

public class OpenImportDialogue
{
    [Inject]
    public var service:ImageFileService;

    [Inject]
    public var dispatcher:IEventDispatcher;

    public function execute():void
    {
        service.get().addOnce( function ( result:ImageServiceResults ):void
        {
            if ( result.status == ImageServiceStatus.SUCCESS )
            {
                dispatcher.dispatchEvent( new ImportEvent( result.files ) );
            }

            else
            {
                dispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, StateConstants.IDLE ) )
            }
        } );
    }
}
}
