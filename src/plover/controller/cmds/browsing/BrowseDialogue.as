package plover.controller.cmds.browsing
{
import flash.events.IEventDispatcher;

import plover.model.files.FileModel;
import plover.service.file.BrowseFileService;
import plover.service.file.ImageServiceResults;

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
                    //var action:String = StateConstant.IDLE;

                    if ( result.success )
                    {
                        model.setParentFile( result.file );
                        /* action = ( model.listExists )
                         ? StateConstant.OPEN
                         : StateConstant.IMPORT*/
                    }
                    //dispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, action ) );
                }
        );
    }
}
}
