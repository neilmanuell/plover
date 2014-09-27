package plover.model.slides
{
import flash.display.BitmapData;
import flash.filesystem.File;

import mx.collections.ArrayCollection;
import mx.collections.IList;

import tools.loaderservice.data.NULL_BITMAP_DATA;
import tools.mouse.DragControllerClient;

use namespace NULL_BITMAP_DATA;

public class SlideCarriage implements DragControllerClient
{

    private const _mappings:ArrayCollection = new ArrayCollection();

    private var _selectedItem:BitmapData;


    public function serialise( sort:Boolean = false ):String
    {
        const out:Array = [];

        const len:int = _mappings.length;
        for ( var i:int = 0; i < len; i++ )
        {
            var mapping:Mapping = _mappings.getItemAt( i ) as Mapping;
            out.push( mapping.file.name );
        }

        if ( sort )
        {
            out.sort();
        }

        return JSON.stringify( out );
    }


    public function get dataProvider():IList
    {
        return _mappings;
    }

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
        if ( value == _selectedIndex )return;
        else if ( value == -1 )
        {
            _selectedIndex = value;
            selectedItem = NULL_BITMAP_DATA;
            return;
        }
        else if ( value < 0 || value > _mappings.length - 1 )return;
        _selectedIndex = value;
        selectedItem = (_mappings[_selectedIndex] as Mapping).bmp;
    }

    public function get numberOfChildren():int
    {
        return _mappings.length;
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

    public function get length():int
    {
        return _mappings.length;
    }

    public function getItemAt( index:int ):BitmapData
    {
        return  (_mappings[index] as Mapping).bmp;
    }

    public function add( file:File, bmp:BitmapData ):void
    {
        _mappings.addItem( new Mapping( file, bmp ) );
    }

    public function flush():void
    {
        //const len:int = _mappings.length;
        _mappings.removeAll();
        for each ( var mapping:Mapping in _mappings){
            mapping.dispose();
        }
        selectedIndex = -1;
    }
}
}

import flash.display.BitmapData;
import flash.events.EventDispatcher;
import flash.filesystem.File;

class Mapping extends EventDispatcher
{
    public var file:File;
    private var _bmp:BitmapData;

    public function Mapping( file:File, bmp:BitmapData ):void
    {
        this.file = file;
        _bmp = bmp;
    }


    public function get bmp():BitmapData
    {
        return _bmp;
    }

    public function dispose():void
    {
        _bmp.dispose();
    }
}
