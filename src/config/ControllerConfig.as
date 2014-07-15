package config
{
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import plover.controller.cmds.ChangeDragControl;
import plover.controller.cmds.DecreaseSlide;
import plover.controller.cmds.EnableDrag;
import plover.controller.cmds.ExitApplication;
import plover.controller.cmds.FlushImageModel;
import plover.controller.cmds.HandleLoadedImages;
import plover.controller.cmds.IncreaseSlide;
import plover.controller.cmds.LoadImages;
import plover.controller.cmds.OpenImportDialogue;
import plover.controller.cmds.PopulateImageModel;
import plover.controller.cmds.SetSlideMultiplier;
import plover.controller.constants.ButtonNames;
import plover.controller.events.ButtonClickEvent;
import plover.controller.events.ChangeDragControlEvent;
import plover.service.image.LoadImageEvent;

import robotlegs.bender.framework.api.IConfig;

import statemachine.flow.api.EventFlowMap;

import tools.mouse.MouseDragEvent;

public class ControllerConfig implements IConfig
{

    [Inject]
    public var flow:EventFlowMap;

    public function configure():void
    {

        flow
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
                .execute( DecreaseSlide );
        //.and.fix();

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
        //.and.fix();


    }

    private function onlyIfKeyIs( keyCode:uint, shift:Boolean = false ):Function
    {
        return function ( event:KeyboardEvent ):Boolean
        {
            return ((event.keyCode == keyCode) && (event.shiftKey == shift));
        }
    }

    public function onlyIfNameIs( name:String ):Function
    {
        return function ( event:ButtonClickEvent ):Boolean
        {
            return (event.name == name);
        }
    }
}
}
