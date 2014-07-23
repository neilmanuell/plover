package plover.model.files
{
import flash.filesystem.File;

import plover.controller.constants.FileName;
import plover.utils.files.getURLSFromFiles;

public class FileModel
{
    private var _imageFiles:Vector.<File>;
    private var _imageURLs:Array;

    public function get imageURLs():Array
    {
        return _imageURLs || (_imageURLs = getURLSFromFiles( _imageFiles ));
    }

    private var _list:File;

    public function get list():File
    {
        return _list;
    }

    private var _parent:File;

    public function get parent():File
    {
        return _parent;
    }

    public function setImageFiles( files:Vector.<File> ):void
    {
        _imageFiles = files;
    }

    public function getFileFromURL( url:String ):File
    {
        var out:File;
        _imageFiles.every( function ( item:File, index:int, v:Vector.<File> ):Boolean
        {
            if ( item.url == url )
            {
                out = item;
                return false;
            }
            return true;
        } );
        return out;
    }

    public function parseList( list:Array ):void
    {
        _imageFiles = new <File>[];
        list.forEach( function ( item:String, index:int, a:Array ):void
        {
            _imageFiles.push( _parent.resolvePath( item ) );
        } );
    }

    public function setParentFile( parent:File ):void
    {
        _parent = parent;
        _list = _parent.resolvePath( FileName.PLOVER_LIST_FILE );
    }

    public function toString():String
    {
        const out:Array = [];
        _imageFiles.forEach( function ( item:File, index:int, v:Vector.<File> ):void
        {
            out.push( item.name );
        } );

        out.sort();
        return JSON.stringify(out);
    }

    /* private function orderByName( a:String, b:File ):int
     {

     if ( a.name > b.name )
     {
     return 1;
     }

     else if ( a.name < b.name )
     {
     return -1;
     }
     return 0;

     }*/

    public function get listExists():Boolean
    {
        return (_list == null ) ? false : list.exists;
    }
}
}
