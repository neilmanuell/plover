package plover.service.image
{
import flash.events.Event;
import flash.filesystem.File;

import plover.utils.files.getURLSFromFiles;

public class LoadImageEvent extends Event
{
    public static const LOAD_REQUEST:String = "LoadImageEvent.LOAD_REQUEST";
    public static const LOAD_COMPLETE:String = "LoadImageEvent.LOAD_COMPLETE";

    public function LoadImageEvent( type:String, files:Vector.<File> )
    {
        super( type );
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

    override public function clone():Event
    {
        return new LoadImageEvent( type, _files );
    }
}
}
