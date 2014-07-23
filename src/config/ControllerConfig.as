package config
{
import flash.events.KeyboardEvent;

import plover.controller.cmds.ChangeDragControl;
import plover.controller.cmds.EnableDrag;
import plover.controller.cmds.acquiring.AcquireList;
import plover.controller.cmds.acquiring.HandleListAcquired;
import plover.controller.cmds.exiting.ExitApplication;
import plover.controller.cmds.importing.FlushImageModel;
import plover.controller.cmds.importing.HandleItemLoadComplete;
import plover.controller.cmds.importing.HandleLoadProgress;
import plover.controller.cmds.importing.HandleQueueComplete;
import plover.controller.cmds.importing.LoadImages;
import plover.controller.cmds.importing.RetrieveImageFiles;
import plover.controller.cmds.importing.WriteToListFile;
import plover.controller.cmds.opening.BrowseDialogue;
import plover.controller.cmds.state.SetupIdling;
import plover.controller.cmds.state.SetupOpening;
import plover.controller.cmds.state.TearDownAcquiring;
import plover.controller.cmds.state.TearDownIdling;
import plover.controller.cmds.state.TearDownImporting;
import plover.controller.cmds.state.TearDownOpening;
import plover.controller.events.ChangeDragControlEvent;
import plover.controller.guards.OnlyIfListFileDoesNotExist;
import plover.controller.state.StateConstants;

import robotlegs.bender.framework.api.IConfig;

import statemachine.flow.api.EventFlowMap;

import tools.statemachine.StateEvent;

public class ControllerConfig implements IConfig
{

    [Inject]
    public var flow:EventFlowMap;

    public function configure():void
    {
        flow
                .on( StateConstants.SETUP_IDLING, StateEvent )
                .all.execute( SetupIdling );

        flow
                .on( StateConstants.TEARDOWN_IDLING, StateEvent )
                .all.execute( TearDownIdling );

        flow
                .on( StateConstants.SETUP_OPENING, StateEvent )
                .all.execute( SetupOpening );

        flow
                .on( StateConstants.TEARDOWN_OPENING, StateEvent )
                .all.execute( TearDownOpening );

        flow
                .on( StateConstants.INIT_OPENING, StateEvent )
                .all.execute( BrowseDialogue );

        flow
                .on( StateConstants.SETUP_IMPORTING, StateEvent )
                .all.onApproval( OnlyIfListFileDoesNotExist )
                .execute( RetrieveImageFiles, WriteToListFile );


        flow
                .on( StateConstants.INIT_IMPORTING, StateEvent )
                .all.execute( FlushImageModel, EnableDrag, HandleQueueComplete, HandleItemLoadComplete, HandleLoadProgress, LoadImages );

        flow
                .on( ChangeDragControlEvent.CHANGE, ChangeDragControlEvent )
                .all.execute( ChangeDragControl );


        flow
                .on( StateConstants.TEARDOWN_IMPORTING, StateEvent )
                .all.execute( TearDownImporting );

        flow
                .on( StateConstants.TEARDOWN_AQUIRING, StateEvent )
                .all.execute( TearDownAcquiring );

        flow
                .on( StateConstants.INIT_AQUIRING, StateEvent )
                .all.execute( AcquireList, HandleListAcquired );


        flow
                .on( StateConstants.INIT_EXITING_APPLICATION, StateEvent )
                .all.execute( ExitApplication );


        /*











         /* flow
         .on( ButtonClickEvent.CLICK, ButtonClickEvent )
         .all.onApproval( onlyIfNameIs( ButtonNames.IMPORT_IMAGES ) )
         .execute( OpenImportDialogue );
         //.and.fix();


         flow
         .on( ButtonClickEvent.CLICK, ButtonClickEvent )
         .all.onApproval( onlyIfNameIs( ButtonNames.EXIT_APP ) )
         .execute( ExitApplication );
         //.and.fix();


         flow
         .on( LoadImageEvent.LOAD_REQUEST, LoadImageEvent )
         .all.execute( LoadImages, HandleLoadedImages );


         flow
         .on( LoadImageEvent.LOAD_REQUEST, LoadImageEvent )
         .all.execute( LoadImages, HandleLoadedImages );
         //.and.fix();

         flow
         .on( LoadImageEvent.LOAD_COMPLETE, LoadImageEvent )
         .all.execute( FlushImageModel, PopulateImageModel, EnableDrag );
         //.and.fix();

         flow
         .on( ChangeDragControlEvent.CHANGE, ChangeDragControlEvent )
         .all.execute( ChangeDragControl );

         flow
         .on( KeyboardEvent.KEY_DOWN, KeyboardEvent )
         .all.onApproval( onlyIfKeyIs( Keyboard.RIGHT ) )
         .execute( IncreaseSlide );
         //.and.fix();

         flow
         .on( KeyboardEvent.KEY_DOWN, KeyboardEvent )
         .all.onApproval( onlyIfKeyIs( Keyboard.LEFT ) )
         .execute( DecreaseSlide )

         flow
         .on( KeyboardEvent.KEY_UP, KeyboardEvent )
         .all.onApproval( onlyIfKeyIs( Keyboard.ESCAPE ) )
         .execute( ExitApplication );

         flow
         .on( KeyboardEvent.KEY_UP, KeyboardEvent )
         .all.onApproval( onlyIfKeyIs( Keyboard.I, true ) )
         .execute( OpenImportDialogue );

         flow
         .on( MouseDragEvent.DRAG, MouseDragEvent )
         .all.execute( SetSlideMultiplier );
         //.and.fix();*/


    }

    private function onlyIfKeyIs( keyCode:uint, shift:Boolean = false ):Function
    {
        return function ( event:KeyboardEvent ):Boolean
        {
            return ((event.keyCode == keyCode) && (event.shiftKey == shift));
        }
    }


}
}
