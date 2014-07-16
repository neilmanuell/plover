package plover.model.slides
{
import flash.display.BitmapData;
import flash.filesystem.File;

import tools.loaderservice.data.NULL_BITMAP_DATA;

use namespace NULL_BITMAP_DATA;

public class SlideCarriage
{

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

    private var _selectedIndex:int = -1;

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

    private var _numberOfChildren:int;

    [Bindable]
    public function get numberOfChildren():int
    {
        return _numberOfChildren;
    }

    public function set numberOfChildren( value:int ):void
    {
        _numberOfChildren = value;
    }

    private var _remainder:Number;

    [Bindable]
    public function get remainder():Number
    {

        return _remainder;
    }

    public function set remainder( value:Number ):void
    {
        _remainder = value;
    }

    public function set multiplier( value:Number ):void
    {
        const f:Number = value * _mappings.length - 1;
        selectedIndex = int( f );
        remainder = f - _selectedIndex;
        // trace( " f = " + f + " i = " + selectedIndex + " r = " + _remainder );
    }

    public function getItemAt( index:int ):BitmapData
    {
        return  _mappings[index].bmp;
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
}
}

import flash.display.BitmapData;
import flash.filesystem.File;

import plover.utils.bmp.resizeBitmapDataByEdges;

class Mapping
{
    public var file:File;
    public var bmp:BitmapData;

    public function Mapping( file:File, bmp:BitmapData ):void
    {
        this.file = file;
        this.bmp = resize( bmp, 1600, 1200 );

    }

    private static function resize( bmp:BitmapData, maxWidth:Number, maxHeight:Number ):BitmapData
    {
        if ( bmp.width > maxWidth || bmp.height > maxHeight )
        {
            return resizeBitmapDataByEdges( bmp, maxWidth, maxHeight, true );
        }
        else
        {
            return bmp;
        }
    }
}
