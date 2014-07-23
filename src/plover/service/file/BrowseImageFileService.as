package plover.service.file
{
import flash.events.Event;
import flash.filesystem.File;

import plover.controller.constants.FileName;

import tools.signals.Signal1;

public class BrowseImageFileService implements BrowseFileService
{
    private const _complete:Signal1 = new Signal1( ImageServiceResults );
    private const EXTENTIONS:Vector.<String> = new <String>["jpg", "png", "jpeg"];

    public function browse():Signal1
    {
        const file:File = File.documentsDirectory;
        file.addEventListener( Event.SELECT, onSelected );
        file.addEventListener( Event.CANCEL, onCancel );
        file.browseForDirectory( "Select a directory" );

        return _complete;
    }

    private function onCancel( event:Event ):void
    {
        dispatch(false, null  );
    }

    private function onSelected( event:Event ):void
    {
        const file:File = event.target as File;
       // const list:File = getPloverList( file );

            dispatch( true, file );


    }

    private function getPloverList( file:File ):File
    {
        const list:File = file.resolvePath( FileName.PLOVER_LIST_FILE );
        return list
    }

    private function retrieveImages( file:File ):void
    {
        const contents:Array = file.getDirectoryListing();
        const out:Array = contents.filter( function ( item:File, index:int, a:Array ):Boolean
        {
            return (!item.isDirectory && EXTENTIONS.indexOf( item.extension.toLowerCase() ) != -1);
        } );
        //dispatch( ImageServiceStatus.IMPORT_SUCCESS, file, out );
    }

    private function dispatch( success:Boolean, file:File ):void
    {
        _complete.dispatch( new ImageServiceResults( success, file ) );
    }
}
}
