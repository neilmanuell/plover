package plover.controller.constants
{
public class ScreenInfo
{

    public static const DISPLAY:ScreenInfo = new ScreenInfo( 0, "DISPLAY", "Slide Viewer" );
    public static const EDIT:ScreenInfo = new ScreenInfo( 1, "EDIT", "Editor" );

    public static function getFromName( name:String ):ScreenInfo
    {
        return ScreenInfo[name];
    }

    private var _name:String;
    private var _index:int;
    private var _label:String;

    public function ScreenInfo( index:int, name:String, label:String )
    {
        _index = index;
        _name = name;
        _label = label;
    }

    public function get index():int
    {
        return _index;
    }

    public function get name():String
    {
        return _name;
    }

    public function get label():String
    {
        return _label;
    }
}
}
