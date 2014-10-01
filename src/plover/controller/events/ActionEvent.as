package plover.controller.events
{
import flash.display.NativeMenu;
import flash.display.NativeMenuItem;
import flash.events.Event;

public class ActionEvent extends Event
{
    public static const EXECUTE:String = "ActionEvent.EXECUTE";
    private var _index:int;

    public function ActionEvent( index:int, name:String, nativeMenu:NativeMenu )
    {
        super( EXECUTE );
        _index = index;
        _name = name;
        _nativeMenu = nativeMenu;
    }
    private var _nativeMenu:NativeMenu;

    private var _name:String;

    public function get name():String
    {
        return _name;
    }

    override public function clone():Event
    {
        return new ActionEvent( _index, _name, _nativeMenu );
    }

    public function deselectMenuItem( id:String ):void
    {
        _nativeMenu.items.forEach( function ( item:NativeMenuItem, index:int, a:Array ):void
        {
            if ( item.isSeparator )return;

            if ( item.data.@id == id )
            {
                item.data.@toggled = false;
            }
        } );
    }

    public function get index():int
    {
        return _index;
    }
}
}
