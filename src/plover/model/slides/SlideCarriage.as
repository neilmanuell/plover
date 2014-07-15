package plover.model.slides
{
import flash.display.BitmapData;
import flash.filesystem.File;

import tools.loaderservice.data.NULL_BITMAP_DATA;
import tools.signals.Signal1;

use namespace NULL_BITMAP_DATA;

public class SlideCarriage
{
    public const changed:Signal1 = new Signal1( BitmapData );

    private const _mappings:Vector.<Mapping> = new <Mapping>[];

    private var _selectedItem:BitmapData;

    [Bindable]
    public function get selectedItem():BitmapData
    {
        return _selectedItem;
    }

    public function set selectedItem( value:BitmapData ):void
    {
        _selectedItem = value;
    }

    private var _selectedIndex:int;
    private var _numberOfChildren:int;

    [Bindable]
    public function get selectedIndex():int
    {
        return _selectedIndex;
    }

    public function set selectedIndex( value:int ):void
    {
        if ( value < 0 || value > _mappings.length - 1 || value == _selectedIndex )return;
        _selectedIndex = value;
        selectedItem = _mappings[_selectedIndex].bmp;
    }

    public function set multiplier( value:Number ):void
    {
        selectedIndex = Math.round( value * _mappings.length - 1 );
    }

    public function add( file:File, bmp:BitmapData ):void
    {
        _mappings.push( new Mapping( file, bmp ) );
        numberOfChildren = _mappings.length;
    }

    public function flush():void
    {
        _mappings.length = 0;
        selectedItem = NULL_BITMAP_DATA.clone();

    }

    [Bindable]


    public function get numberOfChildren():int
    {
        return _numberOfChildren;
    }

    public function set numberOfChildren( value:int ):void
    {
        _numberOfChildren = value;
    }
}
}

import flash.display.BitmapData;
import flash.filesystem.File;

class Mapping
{
    public var file:File;
    public var bmp:BitmapData;

    public function Mapping( file:File, bmp:BitmapData ):void
    {
        this.file = file;
        this.bmp = bmp;

    }
}
