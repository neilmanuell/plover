package plover.service.file
{
import plover.service.*;

import flash.events.Event;
import flash.filesystem.File;

import tools.signals.Signal1;

public class BrowseImageFileService implements ImageFileService
{
    private const _complete:Signal1 = new Signal1( ImageServiceResults );
    private const EXTENTIONS:Vector.<String> = new <String>["jpg", "png", "jpeg"];

    public function get():Signal1
    {
        const file:File = File.documentsDirectory;
        file.addEventListener( Event.SELECT, onSelected );
        file.addEventListener( Event.CANCEL, onCancel );
        file.browseForDirectory( "Select a directory" );

        return _complete;
    }

    private function onCancel( event:Event ):void
    {
        _complete.dispatch( new ImageServiceResults( ImageServiceStatus.CANCELLED, null ) );
    }

    private function onSelected( event:Event ):void
    {
        const contents:Array = (event.target as File).getDirectoryListing();
        const out:Array = contents.filter( function ( item:File, index:int, a:Array ):Boolean
        {
            return (!item.isDirectory && EXTENTIONS.indexOf( item.extension.toLowerCase() ) != -1);
        } );
        _complete.dispatch( new ImageServiceResults( ImageServiceStatus.SUCCESS, out ) );
    }
}
}
