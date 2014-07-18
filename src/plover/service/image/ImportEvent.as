package plover.service.image
{
import flash.events.Event;
import flash.filesystem.File;

import plover.utils.files.getURLSFromFiles;

public class ImportEvent extends Event
{
    public static const LOAD_REQUEST:String = "LoadImageEvent.LOAD_REQUEST";

    public function ImportEvent( files:Vector.<File> )
    {
        super( LOAD_REQUEST );
        _files = files;
    }

    private var _files:Vector.<File>;

    public function get files():Vector.<File>
    {
        return _files;
    }

    private var _urls:Array;

    public function get urls():Array
    {
        return _urls || (_urls = getURLSFromFiles( _files ));
    }

    public function getFileFromURL( url:String ):File
    {
        var out:File;
        _files.every( function ( item:File, index:int, v:Vector.<File> ):Boolean
        {
            if ( item.url == url )
            {
                out = item;
                return false;
            }
            return true;
        } )
        return out;
    }

    override public function clone():Event
    {
        return new ImportEvent( _files );
    }
}
}
