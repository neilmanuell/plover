package plover.controller.events
{
import flash.display.NativeMenu;
import flash.display.NativeMenuItem;
import flash.events.Event;

public class ActionEvent extends Event
{
    public static const EXECUTE:String = "ActionEvent.EXECUTE";
    private var _name:String;
    private var _nativeMenu:NativeMenu;

    public function ActionEvent( name:String, nativeMenu:NativeMenu )
    {
        super( EXECUTE );
        _name = name;
        _nativeMenu = nativeMenu;
    }

    public function deselectMenuItem( id:String ):void
    {
        _nativeMenu.items.forEach( function ( item:NativeMenuItem, index:int, a:Array ):void
        {
            if( item.isSeparator )return;

            if ( item.data.@id == id )
            {
                item.data.@toggled = false;
            }
        } );
    }

    override public function clone():Event
    {
        return new ActionEvent( _name, _nativeMenu );
    }

    public function get name():String
    {
        return _name;
    }
}
}
